#include <stdint.h>
#include "matrixrgb_hal.h"

sbit MATRIXRGB_RST 	at PORTB0_bit;
sbit MATRIXRGB_RST_DIR 	at DDB0_bit;
sbit MATRIXRGB_CS 	at PORTB4_bit;
sbit MATRIXRGB_CS_DIR 	at DDB4_bit;
sbit MATRIXRGB_READY 	at PORTB2_bit;
sbit MATRIXRGB_READY_DIR 	at DDB2_bit;

void system_setup( char brightness, uint8_t width, uint8_t height );

void main()
{
    uint8_t count = 3;
    uint8_t i     = 0;
    //color_t my_color;

    system_setup( 100, 2, 1 );


    while(1)
    {

    }
}

void system_setup( char brightness, uint8_t width, uint8_t height )
{
    uint8_t buffer[6] = { 0 };

    MATRIXRGB_CS_DIR    = 1;
    //MATRIXRGB_RST_DIR   = 1;
    MATRIXRGB_READY_DIR = 0;

    SPI1_Init_Advanced( _SPI_MASTER, _SPI_FCY_DIV128, _SPI_CLK_LO_LEADING );

    //MATRIXRGB_RST = 1;        //Reset slave ( toggle )
   // MATRIXRGB_RST = 0;
    Delay_ms(200);
    matrixrgb_hal_init();
    //matrixrgb_init( brightness, width, height );
    //Delay_ms(200);
    buffer[0] = 0x01;
    matrixrgb_hal_write( &buffer, 1 );
    buffer[0] = 100;
    buffer[1] = 2;
    buffer[2] = 1;
    matrixrgb_hal_write( &buffer, 3 );
    buffer[0] = 5;
    matrixrgb_hal_write( &buffer, 1 );
    buffer[0] = 3;     //row
    buffer[1] = 3;     //column
    buffer[2] = 1;     //red
    buffer[3] = 0;     //green
    buffer[4] = 0;     //blue
    matrixrgb_hal_write( &buffer, 5 );

}