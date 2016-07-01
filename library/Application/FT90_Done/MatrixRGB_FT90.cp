#line 1 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/FT90_Done/MatrixRGB_FT90.c"
#line 1 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stdint.h"





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
#line 116 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
typedef struct
{
 uint8_t red;
 uint8_t green;
 uint8_t blue;
}color_t;
#line 147 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_init( char level, uint8_t width, uint8_t height );
#line 162 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_image_load( uint8_t *bmp, uint8_t width, uint8_t height );
#line 178 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_img_left( uint8_t *bmp, uint8_t width, uint8_t height, uint8_t speed );
#line 194 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_img_right( uint8_t *bmp, uint8_t width, uint8_t height, uint8_t speed );
#line 208 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_write_pixel( int row, int column, char red, char green, char blue );
#line 225 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_write_pixel_img( int row, int column, char red, char green, char blue );
#line 236 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_erase_pixel( int row, int column );
#line 249 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_text_right( char *text, color_t color, uint8_t speed , uint8_t text_size );
#line 262 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_text_left( char *text, color_t color, uint8_t speed , uint8_t text_size );
#line 271 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_shift_up( void );
#line 280 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_shift_down( void );
#line 289 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_shift_right( void );
#line 298 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_shift_left( void );
#line 308 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_up( uint8_t speed );
#line 318 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_down( uint8_t speed );
#line 328 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_left( uint8_t speed );
#line 338 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_scroll_off_scrn_right( uint8_t speed );
#line 352 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_refresh( void );
#line 361 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_clear_screen( void );
#line 373 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/include/matrixrgb_hw.h"
void matrixrgb_set_color( color_t *color, uint8_t red_color, uint8_t green_color, uint8_t blue_color );
#line 1 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/resources/resources.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 9 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/application/resources/resources.h"
extern uint8_t ime_bmp[ 2048 ];
extern uint8_t prezime_bmp[ 2048 ];
extern uint8_t Title_bmp[ 2048 ];
extern uint8_t my_img[ 2048 ];
extern uint8_t MikroeBITMAP_bmp[ 2048 ];
extern const code char mikroe[ 2048 ];
extern const unsigned short Tahoma10x11[2048];
#line 4 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/FT90_Done/MatrixRGB_FT90.c"
sbit MATRIXRGB_CS at GPIO_PIN28_bit;
sbit MATRIXRGB_READY at GPIO_PIN3_bit;
sbit MATRIXRGB_RST at GPIO_PIN1_bit;

void system_setup( char brightness, uint8_t width, uint8_t height );

void main()
{
 uint8_t count = 3;
 uint8_t i = 0;
 color_t my_color;

 system_setup( 100, 2, 1 );

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

void system_setup( char brightness, uint8_t width, uint8_t height )
{

 GPIO_Digital_Input(&GPIO_PORT_00_07, _GPIO_PINMASK_3 );
 GPIO_Digital_Output(&GPIO_PORT_00_07, _GPIO_PINMASK_1 );
 GPIO_Digital_Output(&GPIO_PORT_24_31, _GPIO_PINMASK_4 );


 SPIM1_Init_Advanced( _SPI_MASTER_CLK_RATIO_2, _SPI_CFG_PHASE_CAPTURE_FALLING |
 _SPI_CFG_POLARITY_IDLE_LOW | _SPI_CFG_SS_AUTO_DISABLE |
 _SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );

 MATRIXRGB_RST = 0;
 MATRIXRGB_RST = 1;
 Delay_ms(200);

 matrixrgb_init( brightness, width, height );
 Delay_ms(200);

}
