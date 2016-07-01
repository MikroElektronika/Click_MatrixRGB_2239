#line 1 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/AVR/Redo/MatrixRGB_AVR_SPI_Test.c"
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
#line 1 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for avr/include/stdint.h"
#line 1 "c:/c4w/mikroelektronika/mikroc pro for avr/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/c4w/mikroelektronika/mikroc pro for avr/include/stddef.h"



typedef int ptrdiff_t;
typedef unsigned int size_t;
typedef unsigned int wchar_t;
#line 64 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_cs_high( void );
#line 72 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_cs_low( void );
#line 87 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_init( void );
#line 101 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_write( uint8_t *buffer,
 uint16_t count );
#line 116 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
void matrixrgb_hal_read( uint8_t *buffer,
 uint16_t count );
#line 4 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/AVR/Redo/MatrixRGB_AVR_SPI_Test.c"
sbit MATRIXRGB_RST at PORTB0_bit;
sbit MATRIXRGB_RST_DIR at DDB0_bit;
sbit MATRIXRGB_CS at PORTB4_bit;
sbit MATRIXRGB_CS_DIR at DDB4_bit;
sbit MATRIXRGB_READY at PORTB2_bit;
sbit MATRIXRGB_READY_DIR at DDB2_bit;

void system_setup( char brightness, uint8_t width, uint8_t height );

void main()
{
 uint8_t count = 3;
 uint8_t i = 0;


 system_setup( 100, 2, 1 );


 while(1)
 {

 }
}

void system_setup( char brightness, uint8_t width, uint8_t height )
{
 uint8_t buffer[6] = { 0 };

 MATRIXRGB_CS_DIR = 1;

 MATRIXRGB_READY_DIR = 0;

 SPI1_Init_Advanced( _SPI_MASTER, _SPI_FCY_DIV128, _SPI_CLK_LO_LEADING );



 Delay_ms(200);
 matrixrgb_hal_init();


 buffer[0] = 0x01;
 matrixrgb_hal_write( &buffer, 1 );
 buffer[0] = 100;
 buffer[1] = 2;
 buffer[2] = 1;
 matrixrgb_hal_write( &buffer, 3 );
 buffer[0] = 5;
 matrixrgb_hal_write( &buffer, 1 );
 buffer[0] = 3;
 buffer[1] = 3;
 buffer[2] = 1;
 buffer[3] = 0;
 buffer[4] = 0;
 matrixrgb_hal_write( &buffer, 5 );

}
