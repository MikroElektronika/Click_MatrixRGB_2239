#include "matrixrgb_hw.h"


sbit MATRIXRGB_CS            at PORTA_PIN5CTRL;//PORTA5_bit;
sbit CS_DIR                  at PORTD_DIR;//DDA5_bit;
sbit MATRIXRGB_READY         at PORTD_PIN2CTRL;//PIND2_bit;
sbit READY_DIR               at PORTD_DIR;//DDD2_bit;
sbit MATRIXRGB_RST           at PORTA_PIN6CTRL;//PORTA6_bit;
sbit RST_DIR                 at PORTA_DIR;//DDA6_bit;



void system_setup( char brightness, uint8_t width, uint8_t height );

void main()
{
    uint8_t count = 3;
    uint8_t i     = 0;
    color_t my_color;
    char brightness  = 100;
    uint8_t width    = 2;
    uint8_t height   = 1;

    system_setup( brightness, width, height );

    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_text_left( "Matrix", my_color, 17, 10 );
    


    while(1)
    {
         matrixrgb_set_color( &my_color, 1, 0, 0 );
         matrixrgb_scroll_text_left( "Matrix", my_color, 17, 10 );
    }
}

void system_setup( char brightness, uint8_t width, uint8_t height )
{
    CS_DIR    = 1;
    RST_DIR   = 1;
    READY_DIR = 0;

    SPIC_Init();
   // SPI1_Init_Advanced( _SPI_MASTER, _SPI_FCY_DIV2, _SPI_CLK_LO_LEADING );
    Delay_ms(300);
    
    MATRIXRGB_RST = 0;        //Reset slave ( toggle )
    Delay_ms(20);
    MATRIXRGB_RST = 1;
    Delay_ms(1000);
    

    matrixrgb_init( brightness, width, height );
    Delay_ms(200);

}