#line 1 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/MicroC/MatrixRGB_MikroC.c"
#line 1 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
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
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/font/fontlibrary.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 11 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/font/fontlibrary.h"
extern const uint8_t Dejavu18_Bitmaps[2912];
extern uint8_t Dejavu18_Widths[91];
#line 118 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
typedef struct
{
 uint8_t red;
 uint8_t green;
 uint8_t blue;
}color_t;
#line 147 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void refresh( void );
#line 158 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void init_parameters( uint8_t width, uint8_t height );
#line 167 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void create_frame_buffer( void );
#line 176 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void clear_frame_buffer( void );
#line 189 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void setup_timer( void );
#line 202 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void system_setup( char level, uint8_t width, uint8_t height );
#line 212 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void set_brightness( char brightness );
#line 221 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void inc_row( void );
#line 230 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void reset_row( void );
#line 245 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void image_load( uint8_t *bmp, uint8_t width, uint8_t height );
#line 261 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 275 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 291 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 305 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 319 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void write_pixel( int row, int column, char red, char green, char blue);
#line 336 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void write_pixel_img( int row, int column, char red, char green, char blue);
#line 347 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void erase_pixel( int row, int column );
#line 360 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color );
#line 373 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_left( char *text, color_t color, uint16_t speed );
#line 385 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed );
#line 398 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_right( char *text, color_t color, uint16_t speed );
#line 410 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed );
#line 419 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_left( void );
#line 429 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_left( uint16_t speed );
#line 438 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_right( void );
#line 448 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_right( uint16_t speed );
#line 457 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_up( void );
#line 467 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_up( uint16_t speed );
#line 476 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_down( void );
#line 486 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_down( uint16_t speed );
#line 495 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void spi_bus_init( void );
#line 506 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void receive_data(uint8_t* dataPtr, uint16_t dataSize);
#line 515 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void setup_command( void );
#line 524 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void image_load_command( void );
#line 533 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void my_img_load( void );
#line 542 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_img_left_command( void );
#line 551 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_img_right_command( void );
#line 560 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void write_pxl_command( void );
#line 569 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void write_pxl_img_command( void );
#line 578 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void erase_pxl_command( void );
#line 587 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_left_command( void );
#line 596 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_right_command( void );
#line 605 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_up_command( void );
#line 614 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_down_command( void );
#line 623 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_right_command( void );
#line 632 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_shift_left_command( void );
#line 641 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_up_command( void );
#line 650 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_down_command( void );
#line 659 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_left_command( void );
#line 668 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_right_command( void );
#line 677 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void refresh_command( void );
#line 686 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void clear_screen_command( void );
#line 698 "//vboxsvr/corey/projects/clicklibraries/matrixrgb_click/library/firmware/library/include/matrixrgb_firmware.h"
void allocate_image( uint8_t width, uint8_t height );
#line 3 "//VBOXSVR/corey/Projects/ClickLibraries/MatrixRGB_Click/library/MicroC/MatrixRGB_MikroC.c"
enum
{
 SETUP_CMD = 0x01,
 IMAGE_LOAD_CMD,
 SCROLL_IMG_LEFT_CMD,
 SCROLL_IMG_RIGHT_CMD,
 WRITE_PXL_CMD,
 WRITE_PXL_IMG_CMD,
 ERASE_PXL_CMD,
 SCROLL_TEXT_LEFT_CMD,
 SCROLL_TEXT_RIGHT_CMD,
 DISPLAY_SHIFT_UP_CMD,
 DISPLAY_SHIFT_DOWN_CMD,
 DISPLAY_SHIFT_RIGHT_CMD,
 DISPLAY_SHIFT_LEFT_CMD,
 DISPLAY_SCROLL_OFF_SCRN_UP_CMD,
 DISPLAY_SCROLL_OFF_SCRN_DWN_CMD,
 DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD,
 DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD,
 REFRESH_CMD,
 CLR_SCRN_CMD

}cmd_t;

uint8_t buffer[65] = { 0 };
uint8_t setup_flag = 0;

void main()
{


 color_t my_color;
 uint16_t speed = 30;
 my_color.red = 1;


 spi_bus_init();
 Delay_ms(300);

 while(1)
 {
 receive_data( &buffer, 1 );

 switch( buffer[0] )
 {
 case SETUP_CMD:
 setup_command();
 break;
 case IMAGE_LOAD_CMD:
 image_load_command();
 break;
 case SCROLL_IMG_LEFT_CMD:
 scroll_img_left_command();
 break;
 case SCROLL_IMG_RIGHT_CMD:
 scroll_img_right_command();
 break;
 case WRITE_PXL_CMD:
 write_pxl_command();
 break;
 case WRITE_PXL_IMG_CMD:
 write_pxl_img_command();
 break;
 case ERASE_PXL_CMD:
 erase_pxl_command();
 break;
 case SCROLL_TEXT_LEFT_CMD:
 scroll_text_left_command();
 break;
 case SCROLL_TEXT_RIGHT_CMD:
 scroll_text_right_command();
 break;
 case DISPLAY_SHIFT_UP_CMD:
 display_shift_up_command();
 break;
 case DISPLAY_SHIFT_DOWN_CMD:
 display_shift_down_command();
 break;
 case DISPLAY_SHIFT_RIGHT_CMD:
 display_shift_right_command();
 break;
 case DISPLAY_SHIFT_LEFT_CMD:
 display_shift_left_command();
 break;
 case DISPLAY_SCROLL_OFF_SCRN_UP_CMD:
 display_scroll_off_scrn_up_command();
 break;
 case DISPLAY_SCROLL_OFF_SCRN_DWN_CMD:
 display_scroll_off_scrn_down_command();
 break;
 case DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD:
 display_scroll_off_scrn_left_command();
 break;
 case DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD:
 display_scroll_off_scrn_right_command();
 break;
 case REFRESH_CMD:
 refresh();
 break;
 case CLR_SCRN_CMD:
 clear_screen_command();
 break;
 default:
 break;
 }
 }
}
