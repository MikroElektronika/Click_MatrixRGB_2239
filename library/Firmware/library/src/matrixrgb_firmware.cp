#line 1 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
#line 1 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdint.h"





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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stddef.h"
#line 1 "c:/users/corey/documents/projects/matrixrgb/firmware/library/font/fontlibrary.h"
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for ft90x/include/stdint.h"
#line 11 "c:/users/corey/documents/projects/matrixrgb/firmware/library/font/fontlibrary.h"
extern const uint8_t Dejavu18_Bitmaps[2912];
extern uint8_t Dejavu18_Widths[91];
#line 118 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
typedef struct
{
 uint8_t red;
 uint8_t green;
 uint8_t blue;
}color_t;
#line 147 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void refresh( void );
#line 158 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void init_parameters( uint8_t width, uint8_t height );
#line 167 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void create_frame_buffer( void );
#line 176 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void clear_frame_buffer( void );
#line 189 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void setup_timer( void );
#line 202 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void system_setup( uint8_t width, uint8_t height );
#line 212 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void set_brightness( char brightness );
#line 221 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void inc_row( void );
#line 230 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void reset_row( void );
#line 245 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void image_load( uint8_t *bmp, uint8_t width, uint8_t height );
#line 261 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 275 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 291 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 305 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed );
#line 319 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void write_pixel( uint16_t row, uint16_t column, char red, char green, char blue);
#line 336 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void write_pixel_img( uint16_t row, uint16_t column, char red, char green, char blue);
#line 347 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void erase_pixel( uint16_t row, uint16_t column );
#line 360 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color );
#line 373 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_left( char *text, color_t color, uint16_t speed );
#line 385 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed );
#line 398 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_right( char *text, color_t color, uint16_t speed );
#line 410 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed );
#line 419 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_left( void );
#line 429 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_left( uint16_t speed );
#line 438 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_right( void );
#line 448 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_right( uint16_t speed );
#line 457 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_up( void );
#line 467 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_up( uint16_t speed );
#line 476 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_down( void );
#line 486 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_off_screen_down( uint16_t speed );
#line 495 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void spi_bus_init( void );
#line 506 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void receive_data(uint8_t* dataPtr, uint16_t dataSize);
#line 515 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void setup_command( void );
#line 524 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void image_load_command( void );
#line 533 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void my_img_load( void );
#line 542 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_img_left_command( void );
#line 551 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_img_right_command( void );
#line 560 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void write_pxl_command( void );
#line 569 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void write_pxl_img_command( void );
#line 578 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void erase_pxl_command( void );
#line 587 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_left_command( void );
#line 596 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void scroll_text_right_command( void );
#line 605 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_up_command( void );
#line 614 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_down_command( void );
#line 623 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_right_command( void );
#line 632 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_shift_left_command( void );
#line 641 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_up_command( void );
#line 650 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_down_command( void );
#line 659 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_left_command( void );
#line 668 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void display_scroll_off_scrn_right_command( void );
#line 677 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void refresh_command( void );
#line 686 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void clear_screen_command( void );
#line 698 "c:/users/corey/documents/projects/matrixrgb/firmware/library/include/matrixrgb_firmware.h"
void allocate_image( uint8_t width, uint8_t height );

void write_text_command( void );

void write_text( uint8_t *text, color_t color, uint16_t start_row, uint16_t start_col );

void write_letter( uint8_t *bmp, uint8_t width, uint16_t current_row, uint16_t current_col );
#line 50 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
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
#line 66 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
unsigned char Led_Matrix_Data at GPIO_PORT_08_15;
sbit Led_Matrix_A at GPIO_PIN32_bit;
sbit Led_Matrix_B at GPIO_PIN33_bit;
sbit Led_Matrix_C at GPIO_PIN34_bit;
sbit Led_Matrix_D at GPIO_PIN35_bit;
sbit Led_Matrix_CLK at GPIO_PIN45_bit;
sbit Led_Matrix_STB at GPIO_PIN44_bit;
sbit Led_Matrix_OE at GPIO_PIN52_bit;

static volatile uint8_t *img;
uint8_t *FB;
rows_t currRow = ROW_ONE;
uint8_t pan_width, pan_height;
uint32_t shift_reg;
uint8_t firm_buffer[65] = { 0 };
uint16_t p_width;
uint16_t p_height;
#line 92 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
static uint16_t get_coord_index( uint16_t row, uint16_t col );
#line 97 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
static uint16_t get_coord_index( uint16_t row, uint16_t col )
{
 uint16_t incrementer = 0;
 uint16_t starter = 0;
 uint16_t buffer = 0;
 uint16_t new = 0;
 uint16_t mult = 0;
 uint16_t new_col = 0;


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

void setup_command( void )
{
 receive_data( &firm_buffer, 2 );
 system_setup( firm_buffer[0], firm_buffer[1] );
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
 size = firm_buffer[0];
 receive_data( &firm_buffer, 3 );
 my_color.red = firm_buffer[0];
 my_color.green = firm_buffer[1];
 my_color.blue = firm_buffer[2];
 receive_data( &firm_buffer, 4 );
 col_lo = firm_buffer[0];
 col_hi = firm_buffer[1];
 row_lo = firm_buffer[2];
 row_hi = firm_buffer[3];
 start_col = col_hi;
 start_col = ( start_col << 8 ) | col_lo;
 start_row = row_hi;
 start_row = ( start_row << 8 ) | row_lo;

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
 wid_lo = firm_buffer[0];
 wid_hi = firm_buffer[1];
 hei_lo = firm_buffer[2];
 hei_hi = firm_buffer[3];
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
 uint8_t speed = 0;
 uint8_t wid_lo, wid_hi;
 uint8_t hei_lo, hei_hi;

 receive_data( &firm_buffer, 4 );
 wid_lo = firm_buffer[0];
 wid_hi = firm_buffer[1];
 hei_lo = firm_buffer[2];
 hei_hi = firm_buffer[3];
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


 Free( img, (img_w * img_h) );
}


void scroll_img_right_command( void )
{
 uint16_t img_w, img_h;
 uint16_t i, j;
 char red, green, blue;
 uint16_t cnt, tmpCol;
 uint8_t buffer = 0;
 uint8_t speed = 0;
 uint8_t wid_lo, wid_hi;
 uint8_t hei_lo, hei_hi;

 receive_data( &firm_buffer, 4 );
 wid_lo = firm_buffer[0];
 wid_hi = firm_buffer[1];
 hei_lo = firm_buffer[2];
 hei_hi = firm_buffer[3];
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
 my_color.red = firm_buffer[0];
 my_color.green = firm_buffer[1];
 my_color.blue = firm_buffer[2];
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
 my_color.red = firm_buffer[0];
 my_color.green = firm_buffer[1];
 my_color.blue = firm_buffer[2];
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

  (GPIO_PIN17_bit = 1) ;

 while (SPIS1_RX_FIFO_COUNT < dataSize) ;

 STREAMIN_B(dataPtr, &SPIS1_DATA, dataSize);

  (GPIO_PIN17_bit = 0) ;


}

void spi_bus_init()
{
 int i;

 char slave_pins[] = { _GPIO_PIN_NUM_36,
 _GPIO_PIN_NUM_37,
 _GPIO_PIN_NUM_38,
 _GPIO_PIN_NUM_39
 };
 char output_pins[] = { _GPIO_PIN_NUM_18,
 _GPIO_PIN_NUM_17,
 _GPIO_PIN_NUM_50
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


 SPIS1_CNTL = ( 1 << SP_IE ) |
 ( 1 << SP_E ) |
 ( 1 << SP_R0 ) |
 ( 1 << SP_R1 ) |
 ( 1 << SP_R2 );

 SPIS1_CNTL &= ~( 1 << CLK_POL );


 SPIS1_FIFO_CNTL = ( 1 << FIFO_SIZE ) |
 ( 1 << TX_RST ) |
 ( 1 << RCVR_RST ) |
 ( 1 << FIFO_EN );



 SPIS1_TNSFR_FRMT_CNTL |= ( 1 << MULTI_REC );


}

void system_setup( uint8_t width, uint8_t height )
{

 uint8_t currRow = 0;


 GPIO_Digital_Output(&GPIO_PORT_08_15, _GPIO_PINMASK_ALL);
#line 599 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
 GPIO_Digital_Output(&GPIO_PORT_32_39, _GPIO_PINMASK_0 | _GPIO_PINMASK_1 | _GPIO_PINMASK_2 | _GPIO_PINMASK_3 );
 GPIO_Digital_Output(&GPIO_PORT_40_47, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 );

 GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );


 Led_Matrix_Data = 0; asm nop;
 Led_Matrix_A = 0; asm nop;
 Led_Matrix_B = 0; asm nop;
 Led_Matrix_C = 0; asm nop;
 Led_Matrix_D = 0; asm nop;
 Led_Matrix_CLK = 0; asm nop;
 Led_Matrix_STB = 1; asm nop;
 Led_Matrix_OE = 1; asm nop;
 Delay_ms(100);





 init_parameters( width, height );


 create_frame_buffer();




}

void set_brightness( char brightness )
{
 unsigned int current_duty;
 char tmpPwmInitState;
 unsigned int pwm_period;

 pwm_period = PWM_Init( 200000 );
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
 current_duty = ((unsigned long)pwm_period * brightness) / 100;
 PWM_EnableOutput();
 }
 PWM_ConfigChannel(current_duty, tmpPwmInitState, _PWM_CHANNEL_4);

 GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );
}

void init_parameters( uint8_t width, uint8_t height )
{
 pan_width = width;
 pan_height = height;
 p_height = height * 32;
 p_width = width * 32;
 shift_reg = 64 * ( width * height );

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
  Led_Matrix_STB = 0; ;
 for ( p = 0; p < shift_reg; p++ )
 {
 Led_Matrix_Data = 0;
 Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 4 ) << 1;
 Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 2 ) << 3;
 Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 1 ) << 5;
 Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 4 ) >> 2;
 Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 2 );
 Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 1 ) << 2;
  Delay_us(1); Led_Matrix_Clk = 1; asm nop; asm nop; asm nop; Delay_us(1); Led_Matrix_Clk = 0; ;
 }
 inc_row();
  Led_Matrix_STB = 1; ;
 }
}

void inc_row( void )
{

 if (currRow == ROW_EIGHT )
 currRow = ROW_ONE;
 else
 currRow++;



 Led_Matrix_OE = 1;
 Led_Matrix_A = currRow;
 Led_Matrix_B = currRow >> 1;
 Led_Matrix_C = currRow >> 2;
 Led_Matrix_D = currRow >> 3;
#line 720 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
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
#line 738 "C:/Users/Corey/Documents/Projects/MatrixRGB/Firmware/library/src/matrixrgb_firmware.c"
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
 uint16_t curr_row = start_row;
 uint16_t curr_col = start_col;

 if ( ptr ==  ((void *)0)  )
 return;

 if ( color.red > 0 )
 color_buffer |= 0x04;
 if ( color.green > 0 )
 color_buffer |= 0x02;
 if ( color.blue > 0 )
 color_buffer |= 0x01;

 while ( *ptr !=  ((void *)0)  )
 {
 cnt = 0;
 for ( k = 0; k < 16; k++ )
 {
 temp = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
 temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt + 1 ];
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

void image_load( uint8_t *bmp, uint8_t width, uint8_t height )
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
 red = ( buffer & 0x04 );
 green = ( buffer & 0x02 );
 blue = ( buffer & 0x01 );
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
 red = ( buffer & 0x04 );
 green = ( buffer & 0x02 );
 blue = ( buffer & 0x01 );
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

 if ( ptr ==  ((void *)0)  )
 return;

 if ( color.red > 0 )
 color_buffer |= 0x04;
 if ( color.green > 0 )
 color_buffer |= 0x02;
 if ( color.blue > 0 )
 color_buffer |= 0x01;

 while ( *ptr !=  ((void *)0)  )
 {
 cnt = 0;
 for ( k = 0; k < 16; k++ )
 {
 temp = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
 temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt + 1 ];
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
 red = ( buffer & 0x04 );
 green = ( buffer & 0x02 );
 blue = ( buffer & 0x01 );
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

 if ( ptr ==  ((void *)0)  )
 return;

 if ( color.red > 0 )
 color_buffer |= 0x04;
 if ( color.green > 0 )
 color_buffer |= 0x02;
 if ( color.blue > 0 )
 color_buffer |= 0x01;

 while ( *ptr !=  ((void *)0)  )
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
 temp = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
 temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt + 1 ];
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
 red = ( buffer & 0x04 );
 green = ( buffer & 0x02 );
 blue = ( buffer & 0x01 );
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

 if ( ptr ==  ((void *)0)  )
 return;

 if ( color.red > 0 )
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
 uint16_t row = 0;
 uint16_t column = 0;
 uint16_t temp_col_one = 0;
 uint16_t temp_col_two = 0;
 uint8_t buffer = 0;

 for ( row = 0; row < p_height; row++ )
 {
 for ( column = 0; column <= ( p_width - 1 ); column++ )
 {
 buffer = 0;
 temp_col_one = column;
 temp_col_two = column + 1;
 FB[ get_coord_index( row, temp_col_one ) ] = FB[ get_coord_index( row, temp_col_two ) ];
 }
 erase_pixel( row, ( p_width - 1 ) );
 }

}
void display_shift_right( void )
{
 uint16_t row = 0;
 uint16_t column = 0;
 uint16_t temp_col_one = 0;
 uint16_t temp_col_two = 0;
 uint8_t buffer = 0;

 for ( row = 0; row < p_height; row++ )
 {
 for ( column = ( p_width - 1 ); column > 0; column-- )
 {
 buffer = 0;
 temp_col_one = column;
 temp_col_two = column - 1;
 FB[ get_coord_index( row, temp_col_one ) ] = FB[ get_coord_index( row, temp_col_two ) ];
 }
 erase_pixel( row, 0 );
 }

}

void display_shift_up( void )
{
 uint16_t row = 0;
 uint16_t column = 0;
 uint16_t temp_col = 0;
 uint16_t temp_row = 0;
 uint8_t buffer = 0;

 for ( row = 0; row < p_height; row++ )
 {
 for ( column = ( p_width - 1 ); column > 0; column-- )
 {
 if ( row == ( p_height - 1 ) )
 erase_pixel( row, column );
 else
 {
 buffer = 0;
 temp_col = column;
 temp_row = row + 1;
 buffer = FB[ get_coord_index( temp_row, temp_col ) ];
 FB[ get_coord_index( row, temp_col ) ] = buffer;
 }
 }
 buffer = 0;
 temp_col = 0;
 temp_row = row + 1;
 buffer = FB[ get_coord_index( temp_row, temp_col ) ];
 FB[ get_coord_index( row, temp_col ) ] = buffer;
 }

}

void display_shift_down( void )
{
 uint16_t i = 0;
 uint16_t row = 0;
 uint16_t column = 0;
 uint16_t temp_col = 0;
 uint16_t temp_row = 0;
 uint8_t buffer = 0;

 for ( row = ( p_height - 1 ); row > 0; row-- )
 {
 for ( column = ( p_width - 1 ); column > 0; column-- )
 {
 buffer = 0;
 temp_col = column;
 temp_row = row - 1;
 buffer = FB[ get_coord_index( temp_row, temp_col ) ];
 FB[ get_coord_index( row, temp_col ) ] = buffer;
 }
 buffer = 0;
 temp_col = 0;
 temp_row = row - 1;
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

 if ( red > 0 )
 buffer |= 0x04;
 if ( green > 0 )
 buffer |= 0x02;
 if ( blue > 0 )
 buffer |= 0x01;

 FB[ get_coord_index( row, column ) ] = buffer;

}

void erase_pixel( uint16_t row, uint16_t column )
{
 uint8_t buffer = 0;

 FB[get_coord_index( row, column ) ] = 0x00;
}

void setup_timer( void )
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


 if (TIMER_INT_A_bit)
 TIMER_INT = (TIMER_INT & 0xAA) | (1 << 0);
}
