#line 1 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/Application_Library/src/matrixrgb_hal.c"
#line 1 "c:/users/corey/documents/projects/matrixrgb/application/application_library/include/matrixrgb_hal.h"
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
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stdbool.h"



 typedef char _Bool;
#line 1 "c:/users/public/documents/mikroelektronika/mikroc pro for arm/include/stddef.h"



typedef long ptrdiff_t;


 typedef unsigned long size_t;

typedef unsigned long wchar_t;
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
#line 39 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/Application_Library/src/matrixrgb_hal.c"
static void ( *write_spi_p ) ( unsigned int data_out );
static unsigned int ( *read_spi_p ) ( unsigned int buffer );
#line 68 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/Application_Library/src/matrixrgb_hal.c"
extern sfr sbit MATRIXRGB_CS;
extern sfr sbit MATRIXRGB_READY;
#line 80 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/Application_Library/src/matrixrgb_hal.c"
void matrixrgb_hal_cs_high()
{
 MATRIXRGB_CS = 1;
}

void matrixrgb_hal_cs_low()
{
 MATRIXRGB_CS = 0;
}

void matrixrgb_hal_init()
{
#line 97 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/Application_Library/src/matrixrgb_hal.c"
 write_spi_p = SPI_Wr_Ptr;
 read_spi_p = SPI_Rd_Ptr;
#line 111 "C:/Users/Corey/Documents/Projects/MatrixRGB/Application/Application_Library/src/matrixrgb_hal.c"
 matrixrgb_hal_cs_high();

}

void matrixrgb_hal_write( uint8_t *buffer,
 uint16_t count )
{

 while( MATRIXRGB_READY != 1 )
 {

 }

 while( count-- )
 {
 matrixrgb_hal_cs_low();
 write_spi_p( *( buffer++ ) );
 matrixrgb_hal_cs_high();
 }

}

void matrixrgb_hal_read( uint8_t *buffer,
 uint16_t count )
{
 while( count-- )
 *( buffer++ ) = read_spi_p(  0x00  );
}
