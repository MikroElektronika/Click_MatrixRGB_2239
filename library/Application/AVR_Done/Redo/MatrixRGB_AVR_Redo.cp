#line 1 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/AVR/Redo/MatrixRGB_AVR_Redo.c"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for avr/include/stdint.h"




typedef signed char int8_t;
typedef signed int int16_t;
typedef signed long int int32_t;


typedef unsigned char uint8_t;
typedef unsigned int uint16_t;
typedef unsigned long int uint32_t;


typedef signed char int_least8_t;
typedef signed int int_least16_t;
typedef signed long int int_least32_t;


typedef unsigned char uint_least8_t;
typedef unsigned int uint_least16_t;
typedef unsigned long int uint_least32_t;



typedef signed char int_fast8_t;
typedef signed int int_fast16_t;
typedef signed long int int_fast32_t;


typedef unsigned char uint_fast8_t;
typedef unsigned int uint_fast16_t;
typedef unsigned long int uint_fast32_t;


typedef signed int intptr_t;
typedef unsigned int uintptr_t;


typedef signed long int intmax_t;
typedef unsigned long int uintmax_t;
#line 1 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for avr/include/stdint.h"
#line 116 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
typedef struct
{
 uint8_t red;
 uint8_t green;
 uint8_t blue;
}color_t;
#line 147 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_init( char level, uint8_t width, uint8_t height );
#line 162 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_image_load( uint8_t *bmp, uint8_t width, uint8_t height );
#line 178 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_img_left( uint8_t *bmp, uint8_t width, uint8_t height, uint8_t speed );
#line 194 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_img_right( uint8_t *bmp, uint8_t width, uint8_t height, uint8_t speed );
#line 208 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_write_pixel( int row, int column, char red, char green, char blue );
#line 225 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_write_pixel_img( int row, int column, char red, char green, char blue );
#line 236 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_erase_pixel( int row, int column );
#line 249 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_text_right( char *text, color_t color, uint8_t speed , uint8_t text_size );
#line 262 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_text_left( char *text, color_t color, uint8_t speed , uint8_t text_size );
#line 271 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_up( void );
#line 280 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_down( void );
#line 289 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_right( void );
#line 298 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_shift_left( void );
#line 308 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_up( uint8_t speed );
#line 318 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_down( uint8_t speed );
#line 328 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_left( uint8_t speed );
#line 338 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_right( uint8_t speed );
#line 352 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_refresh( void );
#line 361 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_clear_screen( void );
#line 373 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hw.h"
void matrixrgb_set_color( color_t *color, uint8_t red_color, uint8_t green_color, uint8_t blue_color );
#line 4 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/AVR/Redo/MatrixRGB_AVR_Redo.c"
sbit MATRIXRGB_CS at PORTA5_bit;
sbit MATRIXRGB_CS_DIR at DDA5_bit;
sbit MATRIXRGB_READY at PORTD2_bit;
sbit MATRIXRGB_READY_DIR at DDD2_bit;
sbit MATRIXRGB_RST at PORTA6_bit;
sbit MATRIXRGB_RST_DIR at DDA6_bit;

void system_setup( char brightness, uint8_t width, uint8_t height );

void main()
{
 uint8_t count = 3;
 uint8_t i = 0;
 color_t my_color;

 system_setup( 100, 2, 1 );



 matrixrgb_set_color( &my_color, 1, 1, 1 );
 matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
#line 43 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/AVR/Redo/MatrixRGB_AVR_Redo.c"
 while(1)
 {
 matrixrgb_set_color( &my_color, 1, 1, 1 );
 matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
#line 53 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/AVR/Redo/MatrixRGB_AVR_Redo.c"
 }
}

void system_setup( char brightness, uint8_t width, uint8_t height )
{
 MATRIXRGB_CS_DIR = 1;
 MATRIXRGB_RST_DIR = 1;
 MATRIXRGB_READY_DIR = 0;

 SPI1_Init_Advanced( _SPI_MASTER, _SPI_FCY_DIV32, _SPI_CLK_LO_LEADING );

 MATRIXRGB_RST = 0;
 Delay_ms(200);
 MATRIXRGB_RST = 1;
 Delay_ms(300);

 matrixrgb_init( brightness, width, height );
 Delay_ms(200);

}
