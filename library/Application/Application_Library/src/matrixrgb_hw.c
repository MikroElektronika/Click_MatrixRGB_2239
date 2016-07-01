/****************************************************************************
* Title                 :   Matrix RGB CLICK
* Filename              :   matrixrgb_hw.c
* Author                :   CAL
* Origin Date           :   05/23/2016
* Notes                 :   Hardware layer
*****************************************************************************/
/**************************CHANGE LIST **************************************
*
*     Date    Software Version    Initials       Description
*  05/23/2016       .1              CAL       Interface Created.
*
*****************************************************************************/
/**
 * @file matrixrgb_hw.c
 * @brief <h3> Hardware Layer </h3>
 */
/******************************************************************************
* Includes
*******************************************************************************/
#include "matrixrgb_hw.h"
#include "matrixrgb_hal.h"
/******************************************************************************
* Module Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Module Preprocessor Macros
*******************************************************************************/

/******************************************************************************
* Module Typedefs
*******************************************************************************/

enum
{
    SETUP_CMD = 0x01,                       /**< Setup function */
    IMAGE_LOAD_CMD = 0x02,                  /**< Image Load function */
    SCROLL_IMG_LEFT_CMD = 0x03,                    /**< Scroll Image Left Function */
    SCROLL_IMG_RIGHT_CMD = 0x04,                   /**< Scroll Image Right Function */
    WRITE_PXL_CMD = 0x05,                          /**< Write Pixel Function */
    WRITE_PXL_IMG_CMD = 0x06,                      /**< Write Pixel Image Function */
    ERASE_PXL_CMD = 0x07,                          /**< Erase Pixel Function */
    SCROLL_TEXT_LEFT_CMD = 0x08,                   /**< Scroll Text Left Function */
    SCROLL_TEXT_RIGHT_CMD = 0x09,                  /**< Scroll Text Right Function */
    DISPLAY_SHIFT_UP_CMD = 0x0A,                   /**< Display Shift Up Function */
    DISPLAY_SHIFT_DOWN_CMD = 0x0B,                 /**< Display Shift Down Function */
    DISPLAY_SHIFT_RIGHT_CMD = 0x0C,                /**< Display Shift Right Function */
    DISPLAY_SHIFT_LEFT_CMD = 0x0D,                 /**< Display Shift Left Function */
    DISPLAY_SCROLL_OFF_SCRN_UP_CMD = 0x0E,         /**< Display Scroll Off Screen Up Function */
    DISPLAY_SCROLL_OFF_SCRN_DWN_CMD = 0x0F,        /**< Display Scroll Off Screen Down Function */
    DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD = 0x10,       /**< Display Scroll Off Screen Left Function */
    DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD = 0x11,      /**< Display Scroll Off Screen Right Function */
    REFRESH_CMD = 0x12,                            /**< Refresh Function */
    CLR_SCRN_CMD = 0x13,                           /**< Clear Screen Function */
    WRITE_TEXT_CMD = 0x14                          /**< Write Text Function */

}master_cmd_t;
/******************************************************************************
* Module Variable Definitions
*******************************************************************************/
static uint8_t spi_buffer[100] = { 0 };

/******************************************************************************
* Function Prototypes
*******************************************************************************/

/******************************************************************************
* Private Function Definitions
*******************************************************************************/

/******************************************************************************
* Public Function Definitions
*******************************************************************************/
void matrixrgb_init( uint8_t width, uint8_t height )
{
    matrixrgb_hal_init();
    Delay_ms(300);

    spi_buffer[0] = SETUP_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = width;
    spi_buffer[1] = height;
    matrixrgb_hal_write( &spi_buffer, 2 );

}

void matrixrgb_write_text( char *text, color_t color, uint8_t text_size, uint8_t start_row, uint8_t start_col )
{
    uint8_t i = 0;
    uint8_t *ptr = text;

    spi_buffer[0] = WRITE_TEXT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = text_size;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = color.red;
    spi_buffer[1] = color.green;
    spi_buffer[2] = color.blue;
    matrixrgb_hal_write( &spi_buffer, 3 );
        spi_buffer[0] = start_row;
        spi_buffer[1] = start_col;
        matrixrgb_hal_write( &spi_buffer, 2 );

    for( i = 0; i < text_size; i++ )
      {
        spi_buffer[0] = *ptr++;
        matrixrgb_hal_write( &spi_buffer, 1 );
      }
}

void matrixrgb_image_load( uint8_t *bmp, uint8_t width, uint8_t height )
{
    uint16_t i, j;
    uint8_t *ptr = bmp;

    spi_buffer[0] = IMAGE_LOAD_CMD;             // Send command for Image Load
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = width;
    spi_buffer[1] = height;
    matrixrgb_hal_write( &spi_buffer, 2 );      // Send Width and then Height

    for( i = 0; i < height; i++ )
        for( j = 0; j < width; j++ )
        {
            spi_buffer[0] = ptr[ 2 * ( i * width + j ) ];
            spi_buffer[1] = ptr[ 2 * ( i * width + j ) + 1 ];
            matrixrgb_hal_write( &spi_buffer, 2 );
        }
}

void matrixrgb_scroll_img_left( uint8_t *bmp, uint8_t width, uint8_t height, uint8_t speed )
{
    uint16_t i, j;
    uint8_t *ptr = bmp;

    spi_buffer[0] = SCROLL_IMG_LEFT_CMD;        
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = width;
    spi_buffer[1] = height;
    matrixrgb_hal_write( &spi_buffer, 2 );
    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );

    for( i = 0; i < height; i++ )
        for( j = 0; j < width; j++ )
        {
            spi_buffer[0] = ptr[ 2 * ( i * width + j ) ];
            spi_buffer[1] = ptr[ 2 * ( i * width + j ) + 1 ];
            matrixrgb_hal_write( &spi_buffer, 2 );
        }
}

void matrixrgb_scroll_img_right( uint8_t *bmp, uint8_t width, uint8_t height, uint8_t speed )
{
    uint16_t i, j;
    uint8_t *ptr = bmp;

    spi_buffer[0] = SCROLL_IMG_RIGHT_CMD;         // Send command for image load
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = width;
    spi_buffer[1] = height;
    matrixrgb_hal_write( &spi_buffer, 2 );
    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );

    for( i = 0; i < height; i++ )
        for( j = 0; j < width; j++ )
        {
            spi_buffer[0] = ptr[ 2 * ( i * width + j ) ];
            spi_buffer[1] = ptr[ 2 * ( i * width + j ) + 1 ];
            matrixrgb_hal_write( &spi_buffer, 2 );
        }
}

void matrixrgb_scroll_text_right( char *text, color_t color, uint8_t speed, uint8_t text_size )
{
    uint8_t i = 0;
    uint8_t *ptr = text;

    spi_buffer[0] = SCROLL_TEXT_RIGHT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = text_size;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = color.red;
    spi_buffer[1] = color.green;
    spi_buffer[2] = color.blue;
    matrixrgb_hal_write( &spi_buffer, 3 );
    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );

    for( i = 0; i < text_size; i++ )
    {
        spi_buffer[0] = *ptr++;
        matrixrgb_hal_write( &spi_buffer, 1 );
    }
}

void matrixrgb_scroll_text_left( char *text, color_t color, uint8_t speed , uint8_t text_size )
{
    uint8_t i = 0;
    uint8_t *ptr = text;

    spi_buffer[0] = SCROLL_TEXT_LEFT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = text_size;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = color.red;
    spi_buffer[1] = color.green;
    spi_buffer[2] = color.blue;
    matrixrgb_hal_write( &spi_buffer, 3 );
        spi_buffer[0] = speed;
        matrixrgb_hal_write( &spi_buffer, 1 );

    for( i = 0; i < text_size; i++ )
    {
        spi_buffer[0] = *ptr++;
        matrixrgb_hal_write( &spi_buffer, 1 );
    }

}

void matrixrgb_write_pixel( int row, int column, char red, char green, char blue )
{
    spi_buffer[0] = WRITE_PXL_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = row;
    spi_buffer[1] = column;
    spi_buffer[2] = red;
    spi_buffer[3] = green;
    spi_buffer[4] = blue;
    matrixrgb_hal_write( &spi_buffer, 5 );

}

void matrixrgb_write_pixel_img( int row, int column, char red, char green, char blue )
{
    spi_buffer[0] = WRITE_PXL_IMG_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = row;
    spi_buffer[1] = column;
    spi_buffer[2] = red;
    spi_buffer[3] = green;
    spi_buffer[4] = blue;
    matrixrgb_hal_write( &spi_buffer, 5 );

}

void matrixrgb_erase_pixel( int row, int column )
{
    spi_buffer[0] = ERASE_PXL_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
    spi_buffer[0] = row;
    spi_buffer[1] = column;
    matrixrgb_hal_write( &spi_buffer, 2 );

}

void matrixrgb_shift_up( void )
{
    spi_buffer[0] = DISPLAY_SHIFT_UP_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_shift_down( void )
{
    spi_buffer[0] = DISPLAY_SHIFT_DOWN_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_shift_right( void )
{
    spi_buffer[0] = DISPLAY_SHIFT_RIGHT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_shift_left( void )
{
    spi_buffer[0] = DISPLAY_SHIFT_LEFT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_scroll_off_scrn_up( uint8_t speed )
{
    spi_buffer[0] = DISPLAY_SCROLL_OFF_SCRN_UP_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );

    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_scroll_off_scrn_down( uint8_t speed )
{
    spi_buffer[0] = DISPLAY_SCROLL_OFF_SCRN_DWN_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );

    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_scroll_off_scrn_left( uint8_t speed )
{
    spi_buffer[0] = DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );

    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_scroll_off_scrn_right( uint8_t speed )
{
    spi_buffer[0] = DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );

    spi_buffer[0] = speed;
    matrixrgb_hal_write( &spi_buffer, 1 );
}

void matrixrgb_refresh( void )
{
    spi_buffer[0] = REFRESH_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );

}

void matrixrgb_clear_screen( void )
{
    spi_buffer[0] = CLR_SCRN_CMD;
    matrixrgb_hal_write( &spi_buffer, 1 );

}

void matrixrgb_set_color( color_t *color, uint8_t red_color, uint8_t green_color, uint8_t blue_color )
{

    color->red   = red_color;
    color->green = green_color;
    color->blue  = blue_color;

}
/*************** END OF FUNCTIONS *********************************************/