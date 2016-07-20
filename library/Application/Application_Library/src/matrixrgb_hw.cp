#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
#line 1 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"





typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;
typedef signed long long int64_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;
typedef unsigned long long uint64_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;
typedef signed long long int_least64_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;
typedef unsigned long long uint_least64_t;



typedef signed long int int_fast8_t;
typedef signed long int int_fast16_t;
typedef signed long int int_fast32_t;
typedef signed long long int_fast64_t;


typedef unsigned long int uint_fast8_t;
typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long long uint_fast64_t;


typedef signed long int intptr_t;
typedef unsigned long int uintptr_t;


typedef signed long long intmax_t;
typedef unsigned long long uintmax_t;
#line 116 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
typedef struct
{
 uint8_t red;
 uint8_t green;
 uint8_t blue;
}color_t;

typedef enum
{
 BIG_PANEL = 0,
 SMALL_PANEL = 1
} panel_size_t;
#line 152 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_init( uint8_t width, uint8_t height, panel_size_t panel_size );

void matrixrgb_write_text( char *text, color_t color, uint8_t text_size, uint16_t start_row, uint16_t start_col );
#line 169 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_image_load( uint8_t *bmp, uint16_t width, uint16_t height );
#line 185 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_img_left( uint8_t *bmp, uint16_t width, uint16_t height, uint8_t speed );
#line 201 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_img_right( uint8_t *bmp, uint16_t width, uint16_t height, uint8_t speed );
#line 215 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_write_pixel( uint16_t row, uint16_t column, char red, char green, char blue );
#line 232 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_write_pixel_img( uint16_t row, uint16_t column, char red, char green, char blue );
#line 243 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_erase_pixel( uint16_t row, uint16_t column );
#line 256 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_text_right( char *text, color_t color, uint8_t speed , uint8_t text_size );
#line 269 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_text_left( char *text, color_t color, uint8_t speed , uint8_t text_size );
#line 278 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_up( void );
#line 287 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_down( void );
#line 296 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_right( void );
#line 305 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_left( void );
#line 315 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_up( uint8_t speed );
#line 325 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_down( uint8_t speed );
#line 335 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_left( uint8_t speed );
#line 345 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_right( uint8_t speed );
#line 359 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_refresh( void );
#line 368 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_clear_screen( void );
#line 380 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_set_color( color_t *color, uint8_t red_color, uint8_t green_color, uint8_t blue_color );
#line 1 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hal.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdint.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 64 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_cs_high( void );
#line 72 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_cs_low( void );
#line 87 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_init( void );
#line 101 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_write( uint8_t *buffer,
 uint16_t count );
#line 116 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_read( uint8_t *buffer,
 uint16_t count );
#line 35 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
enum
{
 SETUP_CMD = 0x01,
 IMAGE_LOAD_CMD = 0x02,
 SCROLL_IMG_LEFT_CMD = 0x03,
 SCROLL_IMG_RIGHT_CMD = 0x04,
 WRITE_PXL_CMD = 0x05,
 WRITE_PXL_IMG_CMD = 0x06,
 ERASE_PXL_CMD = 0x07,
 SCROLL_TEXT_LEFT_CMD = 0x08,
 SCROLL_TEXT_RIGHT_CMD = 0x09,
 DISPLAY_SHIFT_UP_CMD = 0x0A,
 DISPLAY_SHIFT_DOWN_CMD = 0x0B,
 DISPLAY_SHIFT_RIGHT_CMD = 0x0C,
 DISPLAY_SHIFT_LEFT_CMD = 0x0D,
 DISPLAY_SCROLL_OFF_SCRN_UP_CMD = 0x0E,
 DISPLAY_SCROLL_OFF_SCRN_DWN_CMD = 0x0F,
 DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD = 0x10,
 DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD = 0x11,
 REFRESH_CMD = 0x12,
 CLR_SCRN_CMD = 0x13,
 WRITE_TEXT_CMD = 0x14

}master_cmd_t;
#line 62 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
static uint8_t spi_buffer[100] = { 0 };
#line 75 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
void matrixrgb_init( uint8_t width, uint8_t height, panel_size_t panel_size )
{
 matrixrgb_hal_init();
 Delay_ms(300);

 if( panel_size != BIG_PANEL && panel_size != SMALL_PANEL )
 return;
 spi_buffer[0] = SETUP_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 spi_buffer[0] = width;
 spi_buffer[1] = height;
 spi_buffer[2] = panel_size;
 matrixrgb_hal_write( &spi_buffer, 3 );

}

void matrixrgb_write_text( char *text, color_t color, uint8_t text_size, uint16_t start_row, uint16_t start_col )
{
 uint8_t i = 0;
 uint8_t *ptr = text;
 uint8_t col_lo, col_hi;
 uint8_t row_lo, row_hi;

 row_lo = start_row & 0xFF;
 row_hi = ( start_row >> 8 ) & 0xFF;
 col_lo = start_col & 0xFF;
 col_hi = ( start_col >> 8 ) & 0xFF;

 spi_buffer[0] = WRITE_TEXT_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 spi_buffer[0] = text_size;
 matrixrgb_hal_write( &spi_buffer, 1 );
 spi_buffer[0] = color.red;
 spi_buffer[1] = color.green;
 spi_buffer[2] = color.blue;
 matrixrgb_hal_write( &spi_buffer, 3 );
 spi_buffer[0] = col_lo;
 spi_buffer[1] = col_hi;
 spi_buffer[2] = row_lo;
 spi_buffer[3] = row_hi;
 matrixrgb_hal_write( &spi_buffer, 4 );

 for( i = 0; i < text_size; i++ )
 {
 spi_buffer[0] = *ptr++;
 matrixrgb_hal_write( &spi_buffer, 1 );
 }
}

void matrixrgb_image_load( uint8_t *bmp, uint16_t width, uint16_t height )
{
 uint16_t i, j;
 uint8_t *ptr = bmp;
 uint8_t w_lo, w_hi;
 uint8_t h_lo, h_hi;

 w_lo = width & 0xFF;
 w_hi = ( width >> 8 ) & 0xFF;
 h_lo = height & 0xFF;
 h_hi = ( height >> 8 ) & 0xFF;

 spi_buffer[0] = IMAGE_LOAD_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 spi_buffer[0] = w_lo;
 spi_buffer[1] = w_hi;
 spi_buffer[2] = h_lo;
 spi_buffer[3] = h_hi;
 matrixrgb_hal_write( &spi_buffer, 4 );
#line 147 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
 for( i = 0; i < height; i++ )
 for( j = 0; j < width; j++ )
 {
 spi_buffer[0] = ptr[ 2 * ( i * width + j ) ];
 spi_buffer[1] = ptr[ 2 * ( i * width + j ) + 1 ];
 matrixrgb_hal_write( &spi_buffer, 2 );
 }
}

void matrixrgb_scroll_img_left( uint8_t *bmp, uint16_t width, uint16_t height, uint8_t speed )
{
 uint16_t i, j;
 uint8_t *ptr = bmp;
 uint8_t w_lo, w_hi;
 uint8_t h_lo, h_hi;

 w_lo = width & 0xFF;
 w_hi = ( width >> 8 ) & 0xFF;
 h_lo = height & 0xFF;
 h_hi = ( height >> 8 ) & 0xFF;

 spi_buffer[0] = SCROLL_IMG_LEFT_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 spi_buffer[0] = w_lo;
 spi_buffer[1] = w_hi;
 spi_buffer[2] = h_lo;
 spi_buffer[3] = h_hi;
 matrixrgb_hal_write( &spi_buffer, 4 );
#line 178 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
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

void matrixrgb_scroll_img_right( uint8_t *bmp, uint16_t width, uint16_t height, uint8_t speed )
{
 uint16_t i, j;
 uint8_t *ptr = bmp;
 uint8_t w_lo, w_hi;
 uint8_t h_lo, h_hi;

 w_lo = width & 0xFF;
 w_hi = ( width >> 8 ) & 0xFF;
 h_lo = height & 0xFF;
 h_hi = ( height >> 8 ) & 0xFF;

 spi_buffer[0] = SCROLL_IMG_RIGHT_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 spi_buffer[0] = w_lo;
 spi_buffer[1] = w_hi;
 spi_buffer[2] = h_lo;
 spi_buffer[3] = h_hi;
 matrixrgb_hal_write( &spi_buffer, 4 );
#line 212 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/Application/Application_Library/src/matrixrgb_hw.c"
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

void matrixrgb_write_pixel( uint16_t row, uint16_t column, char red, char green, char blue )
{
 uint8_t r_lo, r_hi;
 uint8_t c_lo, c_hi;

 spi_buffer[0] = WRITE_PXL_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 r_lo = row & 0xFF;
 r_hi = ( row >> 8 ) & 0xFF;
 c_lo = column & 0xFF;
 c_hi = ( column >> 8 ) & 0xFF;
 spi_buffer[0] = r_lo;
 spi_buffer[1] = r_hi;
 spi_buffer[2] = c_lo;
 spi_buffer[3] = c_hi;
 spi_buffer[4] = red;
 spi_buffer[5] = green;
 spi_buffer[6] = blue;
 matrixrgb_hal_write( &spi_buffer, 7 );

}

void matrixrgb_write_pixel_img( uint8_t row, uint8_t column, char red, char green, char blue )
{
 uint8_t r_lo, r_hi;
 uint8_t c_lo, c_hi;

 spi_buffer[0] = WRITE_PXL_IMG_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 r_lo = row & 0xFF;
 r_hi = ( row >> 8 ) & 0xFF;
 c_lo = column & 0xFF;
 c_hi = ( column >> 8 ) & 0xFF;
 spi_buffer[0] = r_lo;
 spi_buffer[1] = r_hi;
 spi_buffer[2] = c_lo;
 spi_buffer[3] = c_hi;
 spi_buffer[4] = red;
 spi_buffer[5] = green;
 spi_buffer[6] = blue;
 matrixrgb_hal_write( &spi_buffer, 7 );

}

void matrixrgb_erase_pixel( uint16_t row, uint16_t column )
{
 uint8_t r_lo, r_hi;
 uint8_t c_lo, c_hi;

 spi_buffer[0] = ERASE_PXL_CMD;
 matrixrgb_hal_write( &spi_buffer, 1 );
 r_lo = row & 0xFF;
 r_hi = ( row >> 8 ) & 0xFF;
 c_lo = column & 0xFF;
 c_hi = ( column >> 8 ) & 0xFF;
 spi_buffer[0] = r_lo;
 spi_buffer[1] = r_hi;
 spi_buffer[2] = c_lo;
 spi_buffer[3] = c_hi;
 matrixrgb_hal_write( &spi_buffer, 4 );

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

 color->red = red_color;
 color->green = green_color;
 color->blue = blue_color;

}
