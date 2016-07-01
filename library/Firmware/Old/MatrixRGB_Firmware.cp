#line 1 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/MatrixRGB_Firmware.c"
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
#line 1 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "c:/users/corey/documents/projects/matrixrgb/firmware/resources.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 9 "c:/users/corey/documents/projects/matrixrgb/firmware/resources.h"
extern uint8_t ime_bmp[ 2048 ];
extern uint8_t prezime_bmp[ 2048 ];
extern uint8_t Title_bmp[ 2048 ];
extern uint8_t my_img[ 2048 ];
extern uint8_t MikroeBITMAP_bmp[ 2048 ];
extern const code char mikroe[ 2048 ];
extern const unsigned short Tahoma10x11[2048];
#line 1 "c:/users/corey/documents/projects/matrixrgb/firmware/fontlibrary.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 11 "c:/users/corey/documents/projects/matrixrgb/firmware/fontlibrary.h"
extern const uint8_t Dejavu18_Bitmaps[2912];
extern uint8_t Dejavu18_Widths[91];
#line 119 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
typedef struct
{
 uint8_t red;
 uint8_t green;
 uint8_t blue;
}color_t;
#line 148 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void refresh( void );
#line 159 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void init_parameters( uint8_t width, uint8_t height );
#line 168 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void create_frame_buffer( void );
#line 177 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void clear_frame_buffer( void );
#line 190 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void setup_timer( void );
#line 203 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void system_setup( char level, uint8_t width, uint8_t height );
#line 213 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void set_brightness( char brightness );
#line 222 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void inc_row( void );
#line 231 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void reset_row( void );
#line 246 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void image_load( uint8_t *bmp, uint8_t width, uint8_t height );
#line 262 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 276 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 292 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 306 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 320 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void write_pixel( int row, int column, char red, char green, char blue);
#line 337 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void write_pixel_img( int row, int column, char red, char green, char blue);
#line 348 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void erase_pixel( int row, int column );
#line 361 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color );
#line 374 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_text_left( char *text, color_t color, uint16_t speed );
#line 386 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed );
#line 399 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_text_right( char *text, color_t color, uint16_t speed );
#line 411 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed );
#line 420 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_left( void );
#line 430 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_off_screen_left( uint16_t speed );
#line 439 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_right( void );
#line 449 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_off_screen_right( uint16_t speed );
#line 458 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_up( void );
#line 468 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_off_screen_up( uint16_t speed );
#line 477 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_down( void );
#line 487 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_off_screen_down( uint16_t speed );
#line 496 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void spi_bus_init( void );
#line 507 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void receive_data(uint8_t* dataPtr, uint16_t dataSize);
#line 516 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void setup_command( void );
#line 525 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void image_load_command( void );
#line 534 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void my_img_load( void );
#line 543 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_img_left_command( void );
#line 552 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_img_right_command( void );
#line 561 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void write_pxl_command( void );
#line 570 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void write_pxl_img_command( void );
#line 579 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void erase_pxl_command( void );
#line 588 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_text_left_command( void );
#line 597 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void scroll_text_right_command( void );
#line 606 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_up_command( void );
#line 615 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_down_command( void );
#line 624 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_right_command( void );
#line 633 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_shift_left_command( void );
#line 642 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_scroll_off_scrn_up_command( void );
#line 651 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_scroll_off_scrn_down_command( void );
#line 660 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_scroll_off_scrn_left_command( void );
#line 669 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void display_scroll_off_scrn_right_command( void );
#line 678 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void refresh_command( void );
#line 687 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void clear_screen_command( void );
#line 699 "c:/users/corey/documents/projects/matrixrgb/firmware/matrixrgb_firmware.h"
void allocate_image( uint8_t width, uint8_t height );
#line 4 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/MatrixRGB_Firmware.c"
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
