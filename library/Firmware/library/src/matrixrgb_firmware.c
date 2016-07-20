/****************************************************************************
* Title                 :   Matrix RGB CLICK
* Filename              :   matrixrgb_firmware.c
* Author                :   CAL
* Origin Date           :   05/23/2016
* Notes                 :   Firmware layer
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*     Date    Software Version    Initials       Description
*  05/23/2016       .1              CAL       Interface Created.
*
*****************************************************************************/
/**
 * @file matrixrgb_hw.c
 * @brief <h3> Firmware Layer </h3>
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdbool.h>
#include <stddef.h>
#include "matrixrgb_firmware.h"
/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/
#define Clk_Toggle()                Delay_us(1); Led_Matrix_Clk = 1; asm nop; asm nop; asm nop; Delay_us(1); Led_Matrix_Clk = 0;
#define Latch_Off()                 Led_Matrix_STB = 0;
#define Latch_On()                  Led_Matrix_STB = 1;
#define _LED_GLOBAL_DIMMER_FREQ     200000
#define SPIS0_CLK_PIN               36
#define SPIS0_SS_PIN                37
#define SPIS0_MOSI_PIN              38
#define SPIS0_MISO_PIN              39
#define RDY_PIN                     17
#define ClearCSInt()                (GPIO_INT_PEND_32_63.B5 = 1)
#define CSSelected()                (GPIO_PIN37_bit == 0)
#define CSDeSelected()              (GPIO_PIN37_bit == 1)
#define SetReady()                  (GPIO_PIN17_bit = 1)
#define SetNotReady()               (GPIO_PIN17_bit = 0)
#define Ready()                     (GPIO_PIN17_bit == 1)
#define MAX_BUFFER_SIZE             2048
/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/
typedef enum
{
    ROW_ONE = 0x0F,
    ROW_TWO = 0x02,
    ROW_THREE = 0x03,
    ROW_FOUR = 0x04,
    ROW_FIVE = 0x05,
    ROW_SIX = 0x06,
    ROW_SEVEN = 0x07,
    ROW_EIGHT = 0x08

} rows_t;

/******************************************************************************
* Module Variable Definitions
*******************************************************************************/

unsigned char Led_Matrix_Data at GPIO_PORT_08_15;   /**< Port for LED R1, G1, B1, R2, G2, B2 data */
sbit Led_Matrix_A        at GPIO_PIN32_bit;         /**< Led Matrix Row Data A0 */
sbit Led_Matrix_B        at GPIO_PIN33_bit;         /**< Led Matrix Row Data A1 */
sbit Led_Matrix_C        at GPIO_PIN34_bit;         /**< Led Matrix Row Data A2 */
sbit Led_Matrix_D        at GPIO_PIN35_bit;         /**< Led Matrix Row Data A3 */
sbit Led_Matrix_CLK      at GPIO_PIN45_bit;         /**< Led Matrix Clock Pin, used every transfer of Led_Matrix_Data */
sbit Led_Matrix_STB      at GPIO_PIN44_bit;         /**< Led Matrix Latch Pin, pulled low before transfering of Led_Matrix_Data, then high before row change */
sbit Led_Matrix_OE       at GPIO_PIN52_bit;         /**< Led Matrix OE Pin, used while switching rows, disables / enables leds ( prevents bleeding ) */

static volatile uint8_t *img;       /**< Image Buffer */
uint8_t *FB;                        /**< Frame Buffer.. dynamically allocated once setup is complete */
rows_t currRow      = ROW_ONE;           /**< Current row of display */
uint8_t pan_width, pan_height;      /**< Width and Height in panels */
uint32_t shift_reg;                 /**< Shift reg size ( ( width * height ) * 32 ) */
uint8_t firm_buffer[65]  = { 0 };   /**< Buffer for SPI Slave FIFO.. 64 bytes long  */
uint16_t p_width;
uint16_t p_height;                  /**< Width and Height in pixels */
panel_size_t g_panel_size;            /**< For user to choose between 32x32 and 16x32 panels

/******************************************************************************
* Function Prototypes
*******************************************************************************/

/******************************************************************************
* Private Function Definitions
*******************************************************************************/
static uint16_t get_coord_index( uint16_t row, uint16_t col );
/******************************************************************************
* Public Function Definitions
*******************************************************************************/

static uint16_t get_coord_index( uint16_t row, uint16_t col )
{
    uint16_t incrementer = 0;
    uint16_t starter     = 0;
    uint16_t buffer      = 0;
    uint16_t new         = 0;
    uint16_t mult        = 0;
    uint16_t new_col     = 0;

    if( g_panel_size == BIG_PANEL )
    {
        //Check for boundaries
        if ( row >= 32 )
        {
            new_col = row / 32;
            new_col *= ( pan_width * 32 );
            row = row % 32;
            col += new_col;
        }
        incrementer = ( row / 8 );
        if ( ( ( incrementer % 2 ) == 0 ) || incrementer == 0 )
            incrementer = 32;
        else
            incrementer = 0;
        starter = ( col / 32 ) * 32;
        if ( row < 16 )
            new = 0;
        else
            new = shift_reg * 8;
        mult = ( row % 8 ) * shift_reg;
        buffer = incrementer + mult + new + starter + col;

        return buffer;
    }
    else if( g_panel_size == SMALL_PANEL )
    {            
        if ( row >= 32 )
        {
            new_col = row / 32;
            new_col *= ( pan_width * 32 );
            row = row % 32;
            col += new_col;
        }
         if( row == 0 )
         {
             starter = 0;
             incrementer = 0;
         }
         else
         {
             starter = row % 16;
             incrementer = ( row / 16 ) * 32;
         }
        col+= ( col / 32 ) * 32;
        buffer = incrementer + ( starter *  shift_reg ) + col;
        
        return buffer;
    }
}

void setup_command( void )
{
    receive_data( &firm_buffer, 3 );
    system_setup( firm_buffer[0], firm_buffer[1], firm_buffer[2] );
}

void write_text_command( void )
{
    uint8_t text[256] = { 0 };
    char *ptr = text;
    uint8_t i = 0;
    uint8_t size = 0;
    color_t my_color;
    uint8_t col_hi, col_lo;
    uint8_t row_hi, row_lo;
    uint16_t start_col;
    uint16_t start_row;

    receive_data( &firm_buffer, 1 );
    size           = firm_buffer[0];
    receive_data( &firm_buffer, 3 );
    my_color.red   = firm_buffer[0];
    my_color.green = firm_buffer[1];
    my_color.blue  = firm_buffer[2];
    receive_data( &firm_buffer, 4 );
    col_lo         = firm_buffer[0];
    col_hi         = firm_buffer[1];
    row_lo         = firm_buffer[2];
    row_hi         = firm_buffer[3];
    start_col      = col_hi;
    start_col      = ( start_col << 8 ) | col_lo;
    start_row      = row_hi;
    start_row      = ( start_row << 8 ) | row_lo;

    for ( i = 0; i < size; i++ )
    {
        receive_data( &firm_buffer, 1 );
        *ptr++ = firm_buffer[0];
    }
    write_text( text, my_color, start_row, start_col );

}

void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
{
    int i, j;
    uint16_t tmpCol, cnt;
    char red, green, blue;

    for ( i = 0; i < height; i++ )
    {
        cnt = 0;
        for ( j = 0; j < width; j++ )
        {
            tmpCol = firm_buffer[cnt] + (firm_buffer[cnt + 1] << 8);
            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;

            write_pixel_img( i, j, red, green, blue);
        }

    }

}

void image_load_command( void )
{
    uint16_t i, j;
    uint8_t wid_lo, wid_hi;
    uint8_t hei_lo, hei_hi;
    uint16_t wid, hei;
    uint16_t tmpCol;
    char red, green, blue;

    receive_data( &firm_buffer, 4 );
    wid_lo  = firm_buffer[0];
    wid_hi  = firm_buffer[1];
    hei_lo  = firm_buffer[2];
    hei_hi  = firm_buffer[3];
    wid = wid_hi;
    wid = ( wid << 8 ) | wid_lo;
    hei = hei_hi;
    hei = ( hei << 8 ) | hei_lo;

    for ( i = 0; i < hei; i++ )
        for ( j = 0; j < wid; j++ )
        {
            receive_data( &firm_buffer, 2 );

            tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;

            write_pixel_img( i, j, red, green, blue);
        }
}

void scroll_img_left_command( void )
{
    uint16_t img_w, img_h;
    uint16_t i, j;
    char red, green, blue;
    uint16_t cnt, tmpCol;
    uint8_t buffer = 0;
    uint8_t speed  = 0;
    uint8_t wid_lo, wid_hi;
    uint8_t hei_lo, hei_hi;

    receive_data( &firm_buffer, 4 );
    wid_lo  = firm_buffer[0];
    wid_hi  = firm_buffer[1];
    hei_lo  = firm_buffer[2];
    hei_hi  = firm_buffer[3];
    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];
    img_w = wid_hi;
    img_w = ( img_w << 8 ) | wid_lo;
    img_h = hei_hi;
    img_h = ( img_h << 8 ) | hei_lo;
    allocate_image( img_w, img_h );

    for ( i = 0; i < img_h; i++ )
        for ( j = 0; j < img_w; j++ )
        {
            buffer = 0;
            receive_data( &firm_buffer, 2 );

            tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;
            if ( ( red & 0x18 ) > 0 )
                buffer |= 0x04;
            if ( ( green & 0x38 ) > 0 )
                buffer |= 0x02;
            if ( ( blue & 0x18 ) > 0 )
                buffer |= 0x01;
            img[( i * img_w ) + j] = buffer;
        }
    scroll_image_onto_right( img, img_w, img_h, speed );

    //Free the memory
    Free( img, (img_w * img_h) );
}


void scroll_img_right_command( void )
{
    uint16_t img_w, img_h;
    uint16_t i, j;
    char red, green, blue;
    uint16_t cnt, tmpCol;
    uint8_t buffer = 0;
    uint8_t speed  = 0;
    uint8_t wid_lo, wid_hi;
    uint8_t hei_lo, hei_hi;

    receive_data( &firm_buffer, 4 );
    wid_lo  = firm_buffer[0];
    wid_hi  = firm_buffer[1];
    hei_lo  = firm_buffer[2];
    hei_hi  = firm_buffer[3];
    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];

    img_w = wid_hi;
    img_w = ( img_w << 8 ) | wid_lo;
    img_h = hei_hi;
    img_h = ( img_h << 8 ) | hei_lo;
    allocate_image( img_w, img_h );


    for ( i = 0; i < img_h; i++ )
        for ( j = 0; j < img_w; j++ )
        {
            buffer = 0;
            receive_data( &firm_buffer, 2 );

            tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;
            if ( ( red & 0x18 ) > 0 )
                buffer |= 0x04;
            if ( ( green & 0x38 ) > 0 )
                buffer |= 0x02;
            if ( ( blue & 0x18 ) > 0 )
                buffer |= 0x01;
            img[( i * img_w ) + j] = buffer;
        }
    scroll_image_onto_left( img, img_w, img_h, speed );

    //Free memory
    Free( img, (img_w * img_h) );
}

void write_pxl_command( void )
{
    uint16_t row;
    uint16_t col;


    receive_data( &firm_buffer, 7 );
    row = firm_buffer[1];
    row = ( row << 8 ) | firm_buffer[0];
    col = firm_buffer[3];
    col = ( col << 8 ) | firm_buffer[2];
    write_pixel( row, col, firm_buffer[4], firm_buffer[5], firm_buffer[6] );
}


void write_pxl_img_command( void )
{
    uint16_t row;
    uint16_t col;

    receive_data( &firm_buffer, 7 );
    row = firm_buffer[1];
    row = ( row << 8 ) | firm_buffer[0];
    col = firm_buffer[3];
    col = ( col << 8 ) | firm_buffer[2];
    write_pixel_img( row, col, firm_buffer[4], firm_buffer[5], firm_buffer[6] );
}


void erase_pxl_command( void )
{
    uint16_t row;
    uint16_t col;

    receive_data( &firm_buffer, 4 );
    row = firm_buffer[1];
    row = ( row << 8 ) | firm_buffer[0];
    col = firm_buffer[3];
    col = ( col << 8 ) | firm_buffer[2];
    erase_pixel( row, col );
}

void scroll_text_left_command( void )
{
    uint8_t text[256] = { 0 };
    char *ptr = text;
    uint8_t i = 0;
    uint8_t size = 0;
    color_t my_color;
    uint8_t speed = 0;

    receive_data( &firm_buffer, 1 );
    size = firm_buffer[0];
    receive_data( &firm_buffer, 3 );
    my_color.red   = firm_buffer[0];
    my_color.green = firm_buffer[1];
    my_color.blue  = firm_buffer[2];
    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];

    for ( i = 0; i < size; i++ )
    {
        receive_data( &firm_buffer, 1 );
        *ptr++ = firm_buffer[0];
    }

    scroll_text_left( text, my_color, speed );
}


void scroll_text_right_command( void )
{

    char text[256] = { 0 };
    char *ptr = text;
    uint8_t i = 0;
    uint8_t size = 0;
    color_t my_color;
    uint8_t speed = 0;

    receive_data( &firm_buffer, 1 );
    size = firm_buffer[0];
    receive_data( &firm_buffer, 3 );
    my_color.red   = firm_buffer[0];
    my_color.green = firm_buffer[1];
    my_color.blue  = firm_buffer[2];
    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];


    for ( i = 0; i < size; i++ )
    {
        receive_data( &firm_buffer, 1 );
        *ptr++ = firm_buffer[0];
    }

    scroll_text_right( text, my_color, speed );

}


void display_shift_up_command( void )
{
    display_shift_up();
}


void display_shift_down_command( void )
{
    display_shift_down();
}


void display_shift_right_command( void )
{
    display_shift_right();
}


void display_shift_left_command( void )
{
    display_shift_left();
}


void display_scroll_off_scrn_up_command( void )
{
    uint8_t speed = 0;

    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];
    scroll_off_screen_up( speed );
}


void display_scroll_off_scrn_down_command( void )
{
    uint8_t speed = 0;

    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];
    scroll_off_screen_down( speed );
}


void display_scroll_off_scrn_left_command( void )
{
    uint8_t speed = 0;

    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];
    scroll_off_screen_left( speed );
}


void display_scroll_off_scrn_right_command( void )
{
    uint8_t speed = 0;

    receive_data( &firm_buffer, 1 );
    speed = firm_buffer[0];
    scroll_off_screen_right( speed );
}

void refresh_command( void )
{
    refresh();
}

void clear_screen_command( void )
{
    clear_frame_buffer();
}

void allocate_image( uint8_t width, uint8_t height )
{
    uint16_t size = width * height;
    uint16_t i = 0;

    img = Malloc( sizeof( uint8_t ) * size );
    for ( i = 0; i < size; i++ )
        img[i] = 0x00;

}

void receive_data(uint8_t* dataPtr, uint16_t dataSize)
{

    SetReady();

    while (SPIS1_RX_FIFO_COUNT < dataSize) ;

    STREAMIN_B(dataPtr, &SPIS1_DATA, dataSize);

    SetNotReady();


}

void spi_bus_init()
{
    int i;

    char slave_pins[] = { _GPIO_PIN_NUM_36,  // SPI0_CLk_Pin
                          _GPIO_PIN_NUM_37,  // Slave Select Pin
                          _GPIO_PIN_NUM_38,  // SPI0_MOSI_Pin
                          _GPIO_PIN_NUM_39   // SPI0_MISO_Pin
                        };
    char output_pins[] = { _GPIO_PIN_NUM_18,  // Camera Power Down Pin
                           _GPIO_PIN_NUM_17,  // Ready Pin
                           _GPIO_PIN_NUM_50   // Camera Reset Pin
                         };




    for ( i = 0; i < sizeof( output_pins ); i++ )
    {
        GPIO_Pin_Config( output_pins[i],
                         _GPIO_DIR_OUTPUT,
                         _GPIO_CFG_SLEW_RATE_FAST |
                         _GPIO_CFG_SCHMITT_DISABLE |
                         _GPIO_CFG_PULL_DOWN |
                         _GPIO_CFG_DRIVE_16mA |
                         _GPIO_CFG_SPEC_NONE );
    }

    PWR_EnableModule( _PWR_CLK_SPIS0 );

    for ( i = 0; i < sizeof( slave_pins ); i++ )
    {
        GPIO_Pin_Config( slave_pins[i],
                         ( i == _GPIO_PIN_NUM_39 ) ? _GPIO_DIR_OUTPUT : _GPIO_DIR_INPUT,
                         _GPIO_CFG_SLEW_RATE_FAST |
                         _GPIO_CFG_SCHMITT_DISABLE |
                         _GPIO_CFG_PULL_NONE |
                         _GPIO_CFG_DRIVE_16mA |
                         _GPIO_CFG_SPEC_FUNC_1 );
    }
    GPIO_Pin_Digital_Input( _GPIO_PIN_NUM_37 );


    SPIS1_CNTL  = ( 1 << SP_IE )   |  // Enable spi slave interrupt( SP_IE )
                  ( 1 << SP_E )    |  // Enable spi ( SP_E )
                  ( 1 << SP_R0 )   |
                  ( 1 << SP_R1 )   |
                  ( 1 << SP_R2 );

    SPIS1_CNTL &= ~( 1 << CLK_POL );

    /* 64 Byte deep FIFOs enabled, tx and rx fifo enabled */
    SPIS1_FIFO_CNTL =  ( 1 << FIFO_SIZE )  |  // Enable deep 64 byte FIFO
                       ( 1 << TX_RST )     |  // Reset TX FIFO
                       ( 1 << RCVR_RST )   |  // Reset RX FIFO
                       ( 1 << FIFO_EN );      // FIFO Enable



    SPIS1_TNSFR_FRMT_CNTL |= ( 1 << MULTI_REC );    // Allow continuous reception of data


}

void system_setup( uint8_t width, uint8_t height, panel_size_t panel_size )
{
    // Local Declarations
    uint8_t currRow = 0;

    //GPIOs
    GPIO_Digital_Output(&GPIO_PORT_08_15, _GPIO_PINMASK_ALL);
    GPIO_Digital_Output(&GPIO_PORT_32_39, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | \
                        _GPIO_PINMASK_2 | _GPIO_PINMASK_3 );
    GPIO_Digital_Output(&GPIO_PORT_40_47, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 );
    //GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_ALL );    // PWM Pin
    GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );         // OE Pin

    //LED Pins
    Led_Matrix_Data = 0; asm nop;
    Led_Matrix_A    = 0; asm nop;
    Led_Matrix_B    = 0; asm nop;
    Led_Matrix_C    = 0; asm nop;
    Led_Matrix_D    = 0; asm nop;
    Led_Matrix_CLK  = 0; asm nop;
    Led_Matrix_STB  = 1; asm nop;
    Led_Matrix_OE   = 1; asm nop;
    Delay_ms(100);

    //PWM
    //set_brightness( 10 );
    
    //Set panel size.. Big or Small
    g_panel_size = panel_size;
    
    //Size Parameters
    init_parameters( width, height );

    //Creation of Frame Buffer
    create_frame_buffer();

    //Timer Initialization
    //setup_timer();



}

void set_brightness( char brightness )
{
    unsigned int current_duty;
    char tmpPwmInitState;
    unsigned int pwm_period;

    pwm_period = PWM_Init(_LED_GLOBAL_DIMMER_FREQ);
    tmpPwmInitState = _PWM_INIT_STATE_0;

    if (brightness == 0)
    {
        tmpPwmInitState = _PWM_INIT_STATE_1;
        PWM_DisableOutput();
    }
    else if (brightness == 100)
    {
        PWM_DisableOutput();
    }
    else
    {
        current_duty  = ((unsigned long)pwm_period * brightness) / 100;              // initial value for current_duty
        PWM_EnableOutput();
    }
    PWM_ConfigChannel(current_duty, tmpPwmInitState, _PWM_CHANNEL_4);                // PWM output on P52 pin

    GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );
}

void init_parameters( uint8_t width, uint8_t height )
{
    if( g_panel_size == BIG_PANEL )
    {
        pan_width  = width;
        pan_height = height;
        p_height = height * 32;
        p_width  = width * 32;
        shift_reg = 64 * ( width * height );
    }
    else if( g_panel_size == SMALL_PANEL )
    {
        pan_width  = width;
        pan_height = height;
        p_height = height * 16;
        p_width  = width * 32;
        shift_reg = 32 * ( width * height );
    
    }
}

void create_frame_buffer( void )
{
    uint16_t size = p_width * p_height;

    MM_Init();
    FB = Malloc( sizeof( uint8_t ) * size );
    memset( FB, 0, size );
}

void refresh( void )
{
    uint8_t j, i;
    uint16_t p;

    reset_row();
    for ( i = 0, j = 8; i < 8; i++, j++ )
    {
        Latch_Off();
        for ( p = 0; p < shift_reg; p++ )
        {
            Led_Matrix_Data = 0;
            Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 4 ) << 1;
            Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 2 ) << 3;
            Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 1 ) << 5;
            Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 4 ) >> 2;
            Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 2 );
            Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 1 ) << 2;
            Clk_Toggle();
        }
        inc_row();
        Latch_On();
    }
}

void inc_row( void )
{
    // Max address
    if (currRow == ROW_EIGHT )
        currRow = ROW_ONE;
    else
        currRow++;
    


    Led_Matrix_OE = 1;
    Led_Matrix_A = currRow;
    Led_Matrix_B = currRow >> 1;
    Led_Matrix_C = currRow >> 2;
    Led_Matrix_D = currRow >> 3;
    /*asm nop; asm nop; asm nop;
    asm nop; asm nop; asm nop;
    asm nop; asm nop; asm nop;
    asm nop; asm nop; asm nop; */
    Led_Matrix_OE = 0;


}

void reset_row( void )
{
    currRow = ROW_ONE;

    Led_Matrix_OE = 1;
    Led_Matrix_A = currRow;
    Led_Matrix_B = currRow >> 1;
    Led_Matrix_C = currRow >> 2;
    Led_Matrix_D = currRow >> 3;
  /*  asm nop; asm nop; asm nop;
    asm nop; asm nop; asm nop;
    asm nop; asm nop; asm nop;
    asm nop; asm nop; asm nop;    */
    Led_Matrix_OE = 0;


}

void clear_frame_buffer( void )
{
    uint16_t i;
    uint8_t *ptr = FB;
    uint8_t zero = 0x00;

    for ( i = 0; i < ( p_width * p_height ); i++ )
        ptr[i] = zero;
}

void write_text( uint8_t *text, color_t color, uint16_t start_row, uint16_t start_col )
{
    char *ptr = text;
    uint8_t text_frame[256] = { 0 };
    uint8_t j, k;
    uint8_t temp, temp_2;
    uint8_t cnt = 0;
    uint8_t font_width;
    uint8_t color_buffer = 0;
    uint16_t curr_row = start_row;    //Current row and column are top left of letter
    uint16_t curr_col = start_col;

    if ( ptr == NULL )          //Sanity check
        return;

    if ( color.red  > 0 )       //Create color for frame
        color_buffer |= 0x04;
    if ( color.green > 0 )
        color_buffer |= 0x02;
    if ( color.blue > 0 )
        color_buffer |= 0x01;

    while ( *ptr != NULL )
    {
        cnt = 0;
        for ( k = 0; k < 16; k++ )
        {
            temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
            temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
            for ( j = 0; j < 8; j++ )
            {
                if ( ( temp & 0x80 ) > 0x00 )
                    text_frame[( k * 16 ) + j] = color_buffer;
                else
                    text_frame[( k * 16 ) + j] = 0x00;
                temp = ( temp << 1 );
            }
            for ( j = 8; j < 16; j++ )
            {
                if ( ( temp_2 & 0x80 ) > 0x00 )
                    text_frame[( k * 16 ) + j] = color_buffer;
                else
                    text_frame[( k * 16 ) + j] = 0x00;
                temp_2 = ( temp_2 << 1 );
            }
            cnt += 2;
        }
        font_width = 0;
        font_width = Dejavu18_Widths[ *ptr - 32 ];
        if ( ( curr_col + font_width ) >= p_width )
        {
            curr_row += 16;
            curr_col = start_col;
        }
        write_letter( text_frame, font_width, curr_row, curr_col );
        curr_col += font_width;
        //Check if column has reached end of space and increment row by font height, and increase row by 16
        if ( curr_col >= shift_reg )
        {
            curr_row += 16;
            curr_col = start_col;
        }
        ptr++;
    }

}

void write_letter( uint8_t *text_frame, uint8_t width, uint16_t current_row, uint16_t current_col )
{
    uint8_t k, m;
    char red, green, blue;
    uint8_t row = current_row;
    uint8_t col = current_col;

    color_t my_color;
    my_color.red = 1;
    my_color.green = 0;
    my_color.blue = 0;


    for ( m = 0; m < width; m++ )
    {

        for ( k = 0; k < 16; k++ )
        {
            red = text_frame[( k * 16 + m )] & 0x04;
            green = text_frame[( k * 16 + m )] & 0x02;
            blue = text_frame[( k * 16 + m )] & 0x01;
            write_pixel( row + k, col + m, red, green, blue );
        }

    }


}

void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
{
    char red, green, blue;
    uint16_t cnt, tmpCol;
    int row, column;
    cnt = 0;

    for (row = 0; row < 16; row++)
        for (column = 0; column < 64; column++)
        {
            tmpCol = bmp[cnt] + (bmp[cnt + 1] << 8);

            if (tmpCol != 0)
                asm nop;

            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;
            write_pixel_img(row, column, red, green, blue);
            cnt += 2;
        }
}

void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
{
    char red, green, blue;
    uint16_t cnt, tmpCol;
    uint8_t image_frame[1024];
    int row, column;
    uint8_t buffer = 0;
    cnt = 0;

    for ( row = 0; row < 16; row++ )
        for (column = 0; column < ( ( height * width ) * 32 ); column++)
        {
            buffer = 0;
            tmpCol = bmp[cnt] + (bmp[cnt + 1] << 8);

            if (tmpCol != 0)
                asm nop;

            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;
            if ( ( red & 0x18 ) > 0 )
                buffer |= 0x04;
            if ( ( green & 0x38 ) > 0 )
                buffer |= 0x02;
            if ( ( blue & 0x18 ) > 0 )
                buffer |= 0x01;
            image_frame[( row * shift_reg ) + column] = buffer;
            cnt += 2;
        }
    scroll_image_onto_left( image_frame, width, height, speed );
}

void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
{
    uint8_t k, m, p;
    uint16_t i = 0, j = 64;
    uint8_t buffer = 0;
    char red, blue, green;

    for ( m = 1; m <= width; m++ )
    {
        display_shift_right();

        for ( k = 0; k < height; k++ )
        {
            buffer = bmp[( ( k + 1 ) * width ) - m];
            red   = ( buffer & 0x04 );
            green = ( buffer & 0x02 );
            blue  = ( buffer & 0x01 );
            write_pixel( k, 0, red, green, blue );
        }

        for ( p = 0; p < speed; p++ )
            refresh();

    }

}

void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
{
    char red, green, blue;
    uint16_t cnt, tmpCol;
    uint8_t image_frame[1024];
    int row, column;
    uint8_t buffer = 0;
    cnt = 0;

    for (row = 0; row < 16; row++)
        for (column = 0; column < ( ( height * width ) * 32 ); column++)
        {
            buffer = 0;
            tmpCol = bmp[cnt] + (bmp[cnt + 1] << 8);

            if (tmpCol != 0)
                asm nop;

            red = tmpCol >> 11;
            green = (tmpCol & 0x7FF) >> 5;
            blue = tmpCol & 0x1F;
            if ( ( red & 0x18 ) > 0 )
                buffer |= 0x04;
            if ( ( green & 0x38 ) > 0 )
                buffer |= 0x02;
            if ( ( blue & 0x18 ) > 0 )
                buffer |= 0x01;
            image_frame[( row * shift_reg ) + column] = buffer;
            cnt += 2;
        }

    scroll_image_onto_right( image_frame, width, height, speed );

}

void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
{
    uint8_t k, m, p;
    uint16_t i = 0, j = 64;
    uint8_t buffer = 0;
    char red, blue, green;

    for ( m = 0; m < width; m++ )
    {
        display_shift_left();

        for ( k = 0; k < height; k++ )
        {
            buffer = bmp[( k * width + m )];
            red   = ( buffer & 0x04 );
            green = ( buffer & 0x02 );
            blue  = ( buffer & 0x01 );
            write_pixel( k, ( p_width - 1 ), red, green, blue );
        }

        for ( p = 0; p < speed; p++ )
            refresh();

    }

}

void scroll_text_left( char *text, color_t color, uint16_t speed )
{
    char *ptr = text;
    uint8_t text_frame[256] = { 0 };
    uint8_t j, k;
    uint8_t temp, temp_2;
    uint8_t cnt = 0;
    uint8_t font_width;
    uint8_t color_buffer = 0;

    if ( ptr == NULL )          //Sanity check
        return;

    if ( color.red  > 0 )       //Create color for frame
        color_buffer |= 0x04;
    if ( color.green > 0 )
        color_buffer |= 0x02;
    if ( color.blue > 0 )
        color_buffer |= 0x01;

    while ( *ptr != NULL )
    {
        cnt = 0;
        for ( k = 0; k < 16; k++ )
        {
            temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
            temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
            for ( j = 0; j < 8; j++ )
            {
                if ( ( temp & 0x80 ) > 0x00 )
                    text_frame[( k * 16 ) + j] = color_buffer;
                else
                    text_frame[( k * 16 ) + j] = 0x00;
                temp = ( temp << 1 );
            }
            for ( j = 8; j < 16; j++ )
            {
                if ( ( temp_2 & 0x80 ) > 0x00 )
                    text_frame[( k * 16 ) + j] = color_buffer;
                else
                    text_frame[( k * 16 ) + j] = 0x00;
                temp_2 = ( temp_2 << 1 );
            }
            cnt += 2;
        }
        font_width = 0;
        font_width = Dejavu18_Widths[ *ptr - 32 ];
        shift_lett_onto_right( text_frame, font_width, speed );
        ptr++;
    }
}

void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
{
    uint8_t k, m, p;
    uint16_t i = 0, j = 63;
    char red, green, blue;
    uint8_t buffer = 0;

    for ( m = 0; m < font_width; m++ )
    {
        for ( k = 0; k < 16; k++ )
        {
            buffer = text_frame[( k * 16 + m )];
            red   = ( buffer & 0x04 );
            green = ( buffer & 0x02 );
            blue  = ( buffer & 0x01 );
            write_pixel( k, ( p_width - 1 ), red, green, blue );
        }

        for ( p = 0; p < speed; p++ )
            refresh();

        display_shift_left();
    }
}

void scroll_text_right( char *text, color_t color, uint16_t speed )
{
    char *ptr = text;
    uint8_t text_frame[256] = { 0 };
    uint8_t j, k;
    uint8_t temp, temp_2;
    uint8_t cnt = 0;
    uint8_t font_width;
    uint8_t color_buffer = 0;
    uint8_t text_length = 0;

    if ( ptr == NULL )          //Sanity check
        return;

    if ( color.red  > 0 )       //Create color for frame
        color_buffer |= 0x04;
    if ( color.green > 0 )
        color_buffer |= 0x02;
    if ( color.blue > 0 )
        color_buffer |= 0x01;

    while ( *ptr != NULL )
    {
        ptr++;
        text_length++;
    }

    ptr--;
    while ( text_length > 0 )
    {
        text_length--;
        cnt = 0;
        for ( k = 0; k < 16; k++ )
        {
            temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
            temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
            for ( j = 0; j < 8; j++ )
            {
                if ( ( temp & 0x80 ) > 0x00 )
                    text_frame[( k * 16 ) + j] = color_buffer;
                else
                    text_frame[( k * 16 ) + j] = 0x00;
                temp = ( temp << 1 );
            }
            for ( j = 8; j < 16; j++ )
            {
                if ( ( temp_2 & 0x80 ) > 0x00 )
                    text_frame[( k * 16 ) + j] = color_buffer;
                else
                    text_frame[( k * 16 ) + j] = 0x00;
                temp_2 = ( temp_2 << 1 );
            }
            cnt += 2;
        }
        font_width = 0;
        font_width = Dejavu18_Widths[ *ptr - 32 ];
        shift_lett_onto_left( text_frame, font_width, speed );
        ptr--;
    }
}

void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
{
    uint8_t k, m, p;
    uint16_t i = 0, j = 64;
    uint8_t difference = 16 - font_width;
    char red, green, blue;
    uint8_t buffer = 0;

    for ( m = difference; m < ( 16 - font_width ) + font_width ; m++ )
    {
        for ( k = 0; k < 16; k++ )
        {
            buffer = text_frame[k * 16 + ( 15 - m )];
            red   = ( buffer & 0x04 );
            green = ( buffer & 0x02 );
            blue  = ( buffer & 0x01 );
            write_pixel( k, 0, red, green, blue );
        }

        for ( p = 0; p < speed; p++ )
            refresh();

        display_shift_right();
    }
}

void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
{

    char *ptr = text;
    uint8_t j, k;
    uint8_t temp;
    uint8_t temp_2;
    uint8_t cnt = 0;
    uint8_t color_buffer = 0;

    if ( ptr == NULL )
        return;

    if ( color.red  > 0 )
        color_buffer |= 0x04;
    if ( color.green > 0 )
        color_buffer |= 0x02;
    if ( color.blue > 0 )
        color_buffer |= 0x01;

    for ( k = 0; k < 16; k++ )
    {
        temp = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
        temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + ( cnt + 1 ) ];
        for ( j = 0; j < 8; j++ )
        {
            if ( ( temp & 0x80 ) > 0 )
                FB[(k * 64) + j] = color_buffer;
            else
                FB[(k * 64) + j] = 0x00;
            temp = ( temp << 1 );
        }
        for ( j = 8; j < 16; j++ )
        {
            if ( ( temp_2 & 0x80 ) > 0 )
                FB[(k * 64) + j] = color_buffer;
            else
                FB[(k * 64) + j] = 0x00;
            temp_2 = ( temp_2 << 1 );
        }
        cnt += 2;
    }

}

void scroll_off_screen_left( uint16_t speed )
{
    uint16_t p, i;

    for ( i = 0; i < p_width; i++ )
    {
        display_shift_left();
        for ( p = 0; p < speed; p++ )
            refresh();
    }
}

void scroll_off_screen_right( uint16_t speed )
{
    uint16_t p, i;

    for ( i = 0; i < p_width; i++ )
    {
        display_shift_right();
        for ( p = 0; p < speed; p++ )
            refresh();
    }


}
void display_shift_left( void )
{
    uint16_t row          = 0;
    uint16_t column       = 0;
    uint16_t temp_col_one = 0;
    uint16_t temp_col_two = 0;
    uint8_t buffer        = 0;

    for ( row = 0; row < p_height; row++ )
    {
        for ( column = 0; column <= ( p_width - 1 ); column++ )
        {
            buffer = 0;
            temp_col_one   = column;
            temp_col_two = column + 1;
            FB[ get_coord_index( row, temp_col_one ) ] = FB[ get_coord_index( row, temp_col_two ) ];
        }
        erase_pixel( row, ( p_width - 1 ) );
    }

}
void display_shift_right( void )
{
    uint16_t row          = 0;
    uint16_t column       = 0;
    uint16_t temp_col_one = 0;
    uint16_t temp_col_two = 0;
    uint8_t buffer        = 0;

    for ( row = 0; row < p_height; row++ )
    {
        for ( column = ( p_width - 1 ); column > 0; column-- )
        {
            buffer = 0;
            temp_col_one   = column;
            temp_col_two = column - 1;
            FB[ get_coord_index( row, temp_col_one ) ] = FB[ get_coord_index( row, temp_col_two ) ];
        }
        erase_pixel( row, 0 );
    }

}

void display_shift_up( void )
{
    uint16_t row          = 0;
    uint16_t column       = 0;
    uint16_t temp_col     = 0;
    uint16_t temp_row     = 0;
    uint8_t buffer        = 0;

    for ( row = 0; row < p_height; row++ )
    {
        for ( column = ( p_width - 1 ); column > 0; column-- )
        {
            if ( row == ( p_height - 1 ) )
                erase_pixel( row, column );
            else
            {
                buffer     = 0;
                temp_col   = column;
                temp_row   = row + 1;
                buffer = FB[ get_coord_index( temp_row, temp_col ) ];
                FB[ get_coord_index( row, temp_col ) ] = buffer;
            }
        }
        buffer     = 0;
        temp_col   = 0;
        temp_row   = row + 1;
        buffer = FB[ get_coord_index( temp_row, temp_col ) ];
        FB[ get_coord_index( row, temp_col ) ] = buffer;
    }

}

void display_shift_down( void )
{
    uint16_t i            = 0;
    uint16_t row          = 0;
    uint16_t column       = 0;
    uint16_t temp_col     = 0;
    uint16_t temp_row     = 0;
    uint8_t buffer       = 0;

    for ( row = ( p_height - 1 ); row > 0; row-- )
    {
        for ( column = ( p_width - 1 ); column > 0; column-- )
        {
            buffer = 0;
            temp_col   = column;
            temp_row   = row - 1;
            buffer = FB[ get_coord_index( temp_row, temp_col ) ];
            FB[ get_coord_index( row, temp_col ) ] = buffer;
        }
        buffer = 0;
        temp_col   = 0;
        temp_row   = row - 1;
        buffer = FB[ get_coord_index( temp_row, temp_col ) ];
        FB[ get_coord_index( row, temp_col ) ] = buffer;
    }
    for ( i = 0; i < p_width; i++ )
        erase_pixel( 0, i );

}

void scroll_off_screen_up( uint16_t speed )
{
    uint16_t i, j;

    for ( i = 0; i < p_height; i++ )
    {
        display_shift_up();
        for ( j = 0; j < speed; j++ )
            refresh();
    }
}

void scroll_off_screen_down( uint16_t speed )
{
    uint16_t i, j;

    for ( i = 0; i < p_height; i++ )
    {
        display_shift_down();
        for ( j = 0; j < speed; j++ )
            refresh();
    }

}

void write_pixel_img( uint16_t row, uint16_t column, char red, char green, char blue)
{
    uint8_t buffer = 0;

    if ( ( red & 0x18 ) > 0 )
        buffer |= 0x04;
    if ( ( green & 0x38 ) > 0 )
        buffer |= 0x02;
    if ( ( blue & 0x18 ) > 0 )
        buffer |= 0x01;
    FB[ get_coord_index( row, column ) ] = buffer;
}

void write_pixel( uint16_t row, uint16_t column, char red, char green, char blue)
{
    uint8_t buffer = 0;

    if ( red  > 0 )
        buffer |= 0x04;
    if ( green > 0 )
        buffer |= 0x02;
    if ( blue > 0 )
        buffer |= 0x01;
    //FB[32] = buffer;
    FB[ get_coord_index( row, column ) ] = buffer;

}

void erase_pixel( uint16_t row, uint16_t column )
{
    uint8_t buffer = 0;

    FB[get_coord_index( row, column ) ] = 0x00;
}

void setup_timer( void )    //3 us Timer not used in End-User application
{
    TIMER_CONTROL_0 = 2;
    TIMER_SELECT = 0;
    TIMER_PRESC_LS = 0;
    TIMER_PRESC_MS = 0;
    TIMER_WRITE_LS = 43;
    TIMER_WRITE_MS = 1;
    TIMER_CONTROL_3 = 0;
    TIMER_CONTROL_4 |= 17;
    TIMER_CONTROL_2 |= 0;
    TIMER_INT |= 2;
    TIMER_CONTROL_1 |= 1;
    IRQ_CTRL.B31 = 0;
}

void TimerInterrupt(void) iv IVT_TIMERS_IRQ
{
    //refresh_flag = 1;

    if (TIMER_INT_A_bit)
        TIMER_INT = (TIMER_INT & 0xAA) | (1 << 0);
}

/*************** END OF FUNCTIONS *********************************************/