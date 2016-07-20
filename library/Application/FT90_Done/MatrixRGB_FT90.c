#include "matrixrgb_hw.h"
#include "resources.h"

sbit MATRIXRGB_CS       at GPIO_PIN28_bit;
sbit MATRIXRGB_READY    at GPIO_PIN3_bit;
sbit MATRIXRGB_RST      at GPIO_PIN1_bit;

void system_setup( uint8_t width, uint8_t height );

void main()
{
    uint8_t count = 3;
    uint8_t i     = 0;
    color_t my_color;

    system_setup( 2, 1 );

    matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 40 );
    matrixrgb_scroll_off_scrn_down( 30 );
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
    matrixrgb_set_color( &my_color, 1, 0, 0 );
    matrixrgb_scroll_text_left( "R", my_color, 17, 1 );  
    matrixrgb_set_color( &my_color, 0, 1, 0 );
    matrixrgb_scroll_text_left( "G", my_color, 17, 1 );
    matrixrgb_set_color( &my_color, 0, 0, 1 );
    matrixrgb_scroll_text_left( "B ", my_color, 17, 1 );
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_off_scrn_up( 30 );
    matrixrgb_set_color( &my_color, 1, 0, 0 );
    matrixrgb_scroll_text_left( "By: ", my_color, 17, 4 ); 
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_text_left( "Corey ", my_color, 17, 6 ); 
    matrixrgb_set_color( &my_color, 0, 0, 1 );
    matrixrgb_scroll_text_left( "Lakey ", my_color, 17, 6 );
    matrixrgb_scroll_off_scrn_left( 17 );
    matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 25 );
    matrixrgb_scroll_off_scrn_right( 10 );

    while(1)
    {
            matrixrgb_set_color( &my_color, 1, 1, 1 );
        matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
            matrixrgb_set_color( &my_color, 1, 0, 0 );
        matrixrgb_scroll_text_left( "R", my_color, 20, 1 );
            matrixrgb_set_color( &my_color, 0, 1, 0 );
        matrixrgb_scroll_text_left( "G", my_color, 20, 1 );
            matrixrgb_set_color( &my_color, 0, 0, 1 );
        matrixrgb_scroll_text_left( "B", my_color, 20, 1 );
    }
}

void system_setup( uint8_t width, uint8_t height )
{

   GPIO_Digital_Input(&GPIO_PORT_00_07, _GPIO_PINMASK_3 );
   GPIO_Digital_Output(&GPIO_PORT_00_07, _GPIO_PINMASK_1 );
   GPIO_Digital_Output(&GPIO_PORT_24_31, _GPIO_PINMASK_4 );

    // Initialize SPI
    SPIM1_Init_Advanced( _SPI_MASTER_CLK_RATIO_2, _SPI_CFG_PHASE_CAPTURE_FALLING |
                     _SPI_CFG_POLARITY_IDLE_LOW | _SPI_CFG_SS_AUTO_DISABLE |
                     _SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );

    MATRIXRGB_RST = 0;        //Reset slave ( toggle )
    MATRIXRGB_RST = 1;
    Delay_ms(200);

    matrixrgb_init( width, height );
    Delay_ms(200);

}