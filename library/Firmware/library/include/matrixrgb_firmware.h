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
 * @file matrixrgb_firmware.h
 * @brief <h3> Firmware Layer </h3>
 *
 * @par
 * Low level functions for
 * <a href="http://www.mikroe.com">MikroElektronika's</a> Matrix RGB click
 * board.
 */

/**
 * @page LIB_INFO Library Info
 * @date 23 May 2016
 * @author Corey Lakey
 * @copyright GNU Public License
 * @version 1.0.0 - Initial testing and verification
 */

/**
 * @page TEST_CFG Test Configurations
 *
 * ### Test configuration STM : ###
 * @par
 * -<b> MCU           </b> :      STM32F107VC
 * -<b> Dev. Board    </b> :      EasyMx Pro v7
 * -<b> Oscillator    </b> :      72 Mhz internal
 * -<b> Ext. Modules  </b> :      CLICKNAME Click
 * -<b> SW            </b> :      MikroC PRO for ARM 4.7.1
 *
 * ### Test configuration PIC32 : ###
 * @par
 * -<b> MCU           </b> :      PIC32MX795F512L
 * -<b> Dev. Board    </b> :      EasyPIC Fusion v7
 * -<b> Oscillator    </b> :      80 Mhz internal
 * -<b> Ext. Modules  </b> :      CLICKNAME Click
 * -<b> SW            </b> :      MikroC PRO for PIC 3.6.0
 *
 * ### Test configuration FT90x : ###
 * @par
 * -<b> MCU           </b> :      FT900Q
 * -<b> Dev. Board    </b> :      EasyFT90x v7
 * -<b> Oscillator    </b> :      100 Mhz internal
 * -<b> Ext. Modules  </b> :      CLICKNAME Click
 * -<b> SW            </b> :      MikroC PRO for FT90x 1.2.1
 *
 * ### Test configuration PIC : ###
 * @par
 * -<b> MCU           </b> :      PIC18F87K22
 * -<b> Dev. Board    </b> :      EasyPIC Pro v7
 * -<b> Oscillator    </b> :      16 Mhz external
 * -<b> Ext. Modules  </b> :      CLICKNAME Click
 * -<b> SW            </b> :      MikroC PRO for PIC 6.6.3
 *
 * ### Test configuration dsPIC : ###
 * @par
 * -<b> MCU           </b> :      dsPIC33EJ256GP710A
 * -<b> Dev. Board    </b> :      EasyPIC Fusion v7
 * -<b> Oscillator    </b> :      8 Mhz internal
 * -<b> Ext. Modules  </b> :      CLICKNAME Click
 * -<b> SW            </b> :      MikroC PRO for dsPIC 6.2.1
 *
 * ### Test configuration AVR : ###
 * @par
 * -<b> MCU           </b> :      ATMEGA32
 * -<b> Dev. Board    </b> :      EasyAVR v7
 * -<b> Oscillator    </b> :      8 Mhz external
 * -<b> Ext. Modules  </b> :      CLICKNAME Click
 * -<b> SW            </b> :      MikroC PRO for FT90x 6.1.1
 */

/**
 * @mainpage
 * <h3> General Description </h3>
 * @par
 *
 *
 * <h3> Features </h3>
 * @par
 *
 *
 */
#ifndef MATRIXRGB_FIRMWARE_H
#define MATRIXRGB_FIRMWARE_H
/******************************************************************************
* Includes
*******************************************************************************/
#include <stdint.h>
#include <stddef.h>
#include "fontlibrary.h"
/******************************************************************************
* Preprocessor Constants
*******************************************************************************/

/******************************************************************************
* Configuration Constants
*******************************************************************************/

/******************************************************************************
* Macros
*******************************************************************************/

/******************************************************************************
* Typedefs
*******************************************************************************/
typedef struct
{
    uint8_t red;
    uint8_t green;
    uint8_t blue;
}color_t;

typedef enum
{
    BIG_PANEL   = 0,
    SMALL_PANEL = 1
} panel_size_t;

/******************************************************************************
* Variables
*******************************************************************************/

/******************************************************************************
* Function Prototypes
*******************************************************************************/
#ifdef __cplusplus
extern "C"{
#endif

//***************************Functions******************


/**
 * @brief <h3> Refresh </h3>
 *
 * @par
 *  Refreshes the display 
 *
 */
void refresh( void );

/**
 * @brief <h3> Initialize Parameters </h3>
 *
 * @par
 *  Initializes p_width and p_height to the correct values 
 *
 * @param[in] width     -   Width in panels
 * @param[in] height    -   Height in panels
 */
void init_parameters( uint8_t width, uint8_t height );

/**
 * @brief <h3> Create Frame Buffer </h3>
 *
 * @par
 *  Allocates space needed for the display parameters provided already.
 *
 */
void create_frame_buffer( void );

/**
 * @brief <h3> Clear Frame Buffer </h3>
 *
 * @par
 *  Clears the frame buffer to all 0 ( blank display ) 
 *
 */
void clear_frame_buffer( void );


/**
 * @brief <h3> Setup Timer </h3>
 *
 * @par
 *  Sets up timer for use
 *
 * @note Library no longer uses this function, user interfaces w/ FT900 and
 * can implement their own timer on Master side for refresh rates.
 *
 */
void setup_timer( void );

/**
 * @brief <h3> System Setup </h3>
 *
 * @par
 *  Sets up the brightness, as well as the display parameters, and sends those
 * parameters to create_frame_buffer to allocate memory before any refreshes are done.
 *
 * @param[in] level     -   Brightness level ( 0 - 100 )
 * @param[in] width     -   Width in panels
 * @param[in] height    -   Height in panels
 */
void system_setup( uint8_t width, uint8_t height, panel_size_t panel_size );

/**
 * @brief <h3> Set Brightness </h3>
 *
 * @par
 *  Sets the brightness of the LEDs ( PWM duty cycle )
 *
 * @param[in] brightness    -   Brightness of LEDs ( 0 - 100 )
 */
void set_brightness( char brightness );

/**
 * @brief <h3> Increment Row </h3>
 *
 * @par
 *  Increments the active row, only used in refresh() 
 *
 */
void inc_row( void );

/**
 * @brief <h3> Reset Row </h3>
 *
 * @par
 *  Resets active row to 0, only used in refresh() 
 *
 */
void reset_row( void );

/**
 * @brief <h3> Image Load </h3>
 *
 * @par
 *  Loads a bitmap image to your display. 
 *
 * @note Works only with 565 format bitmaps, seperated in 2 8-bit values.
 * Each pixel : { RRRRRGGG, GGGBBBBB } <- 1 pixel
 *
 * @param[in] *bmp      -   Bitmap
 * @param[in] width     -   Width in pixels
 * @param[in] height    -   Height in pixels
 */
void image_load( uint8_t *bmp, uint8_t width, uint8_t height  );

/**
 * @brief <h3> Scroll Image Left </h3>
 *
 * @par
 *  Takes a bitmap image ( see documentation of matrixrgb_image_load for desc. ) 
 * and scrolls it onto your display from right to left, stopping at the edge.
 *
 * @note To scroll all the way through your display, use matrixrgb_scroll_off_scrn_left
 *
 * @param[in] *bmp      -   Bitmap
 * @param[in] width     -   Width in pixels
 * @param[in] height    -   Height in pixels
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)
 */
void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );

/**
 * @brief <h3> Scroll Image Onto Right </h3>
 *
 * @par
 *  Used by scroll_image_left to shift an image onto the screen one column at a time onto the right side
 * of the display.
 *
 * @param[in] *bmp      -   Bitmap
 * @param[in] width     -   Width in pixels
 * @param[in] height    -   Height in pixels
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)
 */
void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );

/**
 * @brief <h3> Scroll Image Right </h3>
 *
 * @par
 *  Takes a bitmap image ( see documentation of matrixrgb_image_load for desc. ) 
 * and scrolls it onto your display from left to right, stopping at the edge.
 *
 * @note To scroll all the way through your display, use matrixrgb_scroll_off_scrn_right
 *
 * @param[in] *bmp      -   Bitmap
 * @param[in] width     -   Width in pixels
 * @param[in] height    -   Height in pixels
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)
 */
void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );

/**
 * @brief <h3> Scroll Image Onto Left </h3>
 *
 * @par
 *  Used by scroll_image_right to shift an image onto the screen one column at a time onto the left side
 * of the display.
 *
 * @param[in] *bmp      -   Bitmap
 * @param[in] width     -   Width in pixels
 * @param[in] height    -   Height in pixels
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)
 */
void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );

/**
 * @brief <h3> MatrixRGB Write Pixel </h3>
 *
 * @par
 *  Writes a single pixel to your display.
 *
 * @param[in] row       -   Row of display
 * @param[in] column    -   Column of display
 * @param[in] red       -   Red pixel ( 0 or 1 )
 * @param[in] green     -   Green pixel ( 0 or 1 )
 * @param[in] blue      -   Blue pixel ( 0 or 1 )
 */
void write_pixel( uint16_t row, uint16_t column, char red, char green, char blue);

/**
 * @brief <h3> Write Pixel Image </h3>
 *
 * @par
 *  Writes a single pixel to your display.
 *
 * @note 
 *  Same as write_pixel except it takes color in 565 format.. ( colors are shifted to the lower bits ) 
 *
 * @param[in] row       -   Row of display
 * @param[in] column    -   Column of display
 * @param[in] red       -   Red pixel ( 5 bit resolution but display only uses 1 or 0 )
 * @param[in] green     -   Green pixel ( 6 bit resolution but display only uses 1 or 0 )
 * @param[in] blue      -   Blue pixel ( 5 bit resolution but display only uses 1 or 0 )
 */
void write_pixel_img( uint16_t row, uint16_t column, char red, char green, char blue);

/**
 * @brief <h3> Erase Pixel </h3>
 *
 * @par
 *  Erases a single pixel from your display.
 *
 * @param[in] row       -   Row of display
 * @param[in] column    -   Column of display
 */
void erase_pixel( uint16_t row, uint16_t column );

/**
 * @brief <h3> Load Text </h3>
 *
 * @par
 *  Not implemented application side. Was used for attempting to put an image on the display.
 *
 * @param[in] text          -   Text string
 * @param[in] text_width    -   Font width in pixels
 * @param[in] text_height   -   Font height in pixels
 * @param[in] color         -   Color of text
 */
void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color );

/**
 * @brief <h3> Scroll Text Left </h3>
 *
 * @par
 *  Scrolls text provided from right to left
 *
 * @param[in] *text     -   String of text
 * @param[in] color     -   color_t struct to use
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)
 * @param[in] text_size -   Size of text in characters
 */
void scroll_text_left( char *text, color_t color, uint16_t speed );

/**
 * @brief <h3> Shift Letter Onto Right </h3>
 *
 * @par
 *  Used by scroll_text_left to shift one single letter onto the right of the display.
 *
 * @param[in] *text_frame       -   String of text
 * @param[in] font_width        -   Width of font
 * @param[in] speed             -   Speed to scroll, (lower the number, faster the scroll)
 */
void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed );

/**
 * @brief <h3> Scroll Text Right </h3>
 *
 * @par
 *  Scrolls text provided from left to right
 *
 * @param[in] *text     -   String of text
 * @param[in] color     -   color_t struct to use
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)
 * @param[in] text_size -   Size of text in characters
 */
void scroll_text_right( char *text, color_t color, uint16_t speed );

/**
 * @brief <h3> Shift Letter Onto Left </h3>
 *
 * @par
 *  Used by scroll_text_right to shift one single letter onto the left of the display.
 *
 * @param[in] *text_frame       -   String of text
 * @param[in] font_width        -   Width of font
 * @param[in] speed             -   Speed to scroll, (lower the number, faster the scroll)
 */
void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed );

/**
 * @brief <h3> Display Shift Left </h3>
 *
 * @par
 *  Shifts the entire display left one row, last row becoming blank.
 *
 */
void display_shift_left( void );

/**
 * @brief <h3> Scroll Off Screen Left </h3>
 *
 * @par
 *  Scrolls the entire screen off the screen, left.
 *
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)  
 */
void scroll_off_screen_left( uint16_t speed );

/**
 * @brief <h3> Display Shift Right </h3>
 *
 * @par
 *  Shifts the entire display right one row, last row becoming blank.
 *
 */
void display_shift_right( void );

/**
 * @brief <h3> Scroll Off Screen Right </h3>
 *
 * @par
 *  Scrolls the entire screen off the screen, right.
 *
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)  
 */
void scroll_off_screen_right( uint16_t speed );

/**
 * @brief <h3> Display Shift Up </h3>
 *
 * @par
 *  Shifts the entire display up one row, last row becoming blank.
 *
 */
void display_shift_up( void );

/**
 * @brief <h3> Scroll Off Screen Up </h3>
 *
 * @par
 *  Scrolls the entire screen off the screen, upwards.
 *
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)  
 */
void scroll_off_screen_up( uint16_t speed );

/**
 * @brief <h3> Display Shift Down </h3>
 *
 * @par
 *  Shifts the entire display down one row, last row becoming blank.
 *
 */
void display_shift_down( void );

/**
 * @brief <h3> Scroll Off Screen Down </h3>
 *
 * @par
 *  Scrolls the entire screen off the screen, downwards.
 *
 * @param[in] speed     -   Speed to scroll, (lower the number, faster the scroll)  
 */
void scroll_off_screen_down( uint16_t speed );

/**
 * @brief <h3> Spi Bus Initialize </h3>
 *
 * @par
 *  Initializes SPI bus communication as a slave.
 *
 */
void spi_bus_init( void );

/**
 * @brief <h3> Receive Data </h3>
 *
 * @par
 *  Receives data from the SPI Master, waits until it receives the requested amount of data.
 *
 * @param[in] *dataPtr     -   Buffer to put data received  
 * @param[in] dataSize     -   Amount of bytes to wait to receive  
 */
void receive_data(uint8_t* dataPtr, uint16_t dataSize);

/**
 * @brief <h3> Setup Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void setup_command( void );                           

/**
 * @brief <h3> Image Load Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void image_load_command( void );                      

/**
 * @brief <h3> My Image Load </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void my_img_load( void );                             

/**
 * @brief <h3> Scroll Image Left Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void scroll_img_left_command( void );

/**
 * @brief <h3> Scroll Image Right Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void scroll_img_right_command( void );

/**
 * @brief <h3> Write Pixel Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void write_pxl_command( void );                       

/**
 * @brief <h3> Write Pixel Image Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void write_pxl_img_command( void );                   

/**
 * @brief <h3> Erase Pixel Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void erase_pxl_command( void );                       

/**
 * @brief <h3> Scroll Text Left Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void scroll_text_left_command( void );                

/**
 * @brief <h3> Scroll Text Right Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void scroll_text_right_command( void );               

/**
 * @brief <h3> Display Shift Up Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_shift_up_command( void );                

/**
 * @brief <h3> Display Shift Down Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_shift_down_command( void );              

/**
 * @brief <h3> Display Shift Right Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_shift_right_command( void );             

/**
 * @brief <h3> Display Shift Left Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_shift_left_command( void );              

/**
 * @brief <h3> Display Scroll Off Screen Up Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_scroll_off_scrn_up_command( void );      

/**
 * @brief <h3> Display Scroll Off Screen Down Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_scroll_off_scrn_down_command( void );    

/**
 * @brief <h3> Display Scroll Off Screen Left Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_scroll_off_scrn_left_command( void );    

/**
 * @brief <h3> Display Scroll Off Screen Right Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void display_scroll_off_scrn_right_command( void );   

/**
 * @brief <h3> Refresh Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void refresh_command( void );                         

/**
 * @brief <h3> Clear Screen Command </h3>
 *
 * @par
 *  When command is received, this function handles the request.
 *
 */
void clear_screen_command( void ); 

/**
 * @brief <h3> Allocate Image </h3>
 *
 * @par
 *  Allocates space needed for the image sent to display on matrix.
 *
 * @param[in] width     -   Width of image in pixels
 * @param[in] height    -   Height of image in pixels
 *
 */
void allocate_image( uint8_t width, uint8_t height );

void write_text_command( void );

void write_text( uint8_t *text, color_t color, uint16_t start_row, uint16_t start_col );

void write_letter( uint8_t *bmp, uint8_t width, uint16_t current_row, uint16_t current_col );

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MATRIXRGB_FIRMWARE_H */
/*** End of File **************************************************************/