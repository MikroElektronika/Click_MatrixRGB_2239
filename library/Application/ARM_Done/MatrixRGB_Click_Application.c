#include "matrixrgb_hw.h"
#include "resources.h"

sbit MATRIXRGB_CS       at GPIOD_ODR.B13;
sbit MATRIXRGB_READY    at GPIOD_IDR.B10;
sbit MATRIXRGB_RST      at GPIOC_ODR.B2;

void system_setup( uint8_t width, uint8_t height );

void main()
{
    uint16_t count = 0;
    uint16_t i, j  = 0;
    color_t my_color;

    system_setup( 6, 1 );
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_text_left( "Scrolling", my_color, 10,20 );
  /*  matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_write_text( "Row 2", my_color, 5, 32, 0 );
    matrixrgb_write_text( "Row 3", my_color, 5, 48, 0 );  */
  /*  matrixrgb_image_load( MikroeBITMAP_bmp, 64, 16 );
    matrixrgb_set_color( &my_color, 1, 0, 0 );
    matrixrgb_write_pixel( 35, 0, 1, 0, 0 );
    matrixrgb_scroll_text_left( "Scrolling", my_color, 15, 20 );
    matrixrgb_scroll_img_left( MikroeBITMAP_bmp, 64, 16, 15 );
    matrixrgb_scroll_text_left( "Left Scroll", my_color, 20, 11 );
    matrixrgb_scroll_off_scrn_right( 20 );
    matrixrgb_scroll_text_right( "Right Scroll", my_color, 20, 12 );
    matrixrgb_scroll_off_scrn_left( 20 );
    matrixrgb_scroll_text_left( "Fast Scroll", my_color, 10, 11 );
    matrixrgb_scroll_off_scrn_left( 10 );
    matrixrgb_scroll_text_right( "Faster Scroll", my_color, 5, 13 );
    matrixrgb_scroll_off_scrn_right( 5 );
    matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 10 );
    matrixrgb_scroll_off_scrn_right( 10 );       */
    //matrixrgb_image_load( MikroE_Sign_bmp, 32, 32 );

   /* matrixrgb_set_color( &my_color, 1, 0, 0 );
        for( i = 0; i < 32; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 1, 1 ); */

   /* matrixrgb_write_text( "1", my_color, 1, 0, 0 );
    matrixrgb_write_text( "2", my_color, 1, 0, 32 );
    matrixrgb_write_text( "3", my_color, 1, 48, 0 );
    matrixrgb_write_text( "4", my_color, 1, 32, 32 );
    matrixrgb_write_text( "3", my_color, 1, 32, 0 );
    matrixrgb_write_text( "4", my_color, 1, 48, 0 );
    matrixrgb_write_text( "5", my_color, 1, 64, 0 );
    matrixrgb_write_text( "6", my_color, 1, 80, 0 );
    matrixrgb_write_text( "7", my_color, 1, 96, 0 );
    matrixrgb_write_text( "8", my_color, 1, 112, 0 );
    matrixrgb_write_text( "9", my_color, 1, 0, 16 );
    matrixrgb_write_text( "10", my_color, 2, 16, 16 );
    matrixrgb_write_text( "11", my_color, 2, 32, 16 );
    matrixrgb_write_text( "12", my_color, 2, 48, 16 );
    matrixrgb_write_text( "13", my_color, 2, 64, 16 );
    matrixrgb_write_text( "14", my_color, 2, 80, 16 );
    matrixrgb_write_text( "15", my_color, 2, 96, 16 );
    matrixrgb_write_text( "16", my_color, 2, 112, 16 );
    matrixrgb_write_text( "A", my_color, 1, 126, 0 );
    matrixrgb_write_pixel( 126, 0, 1, 0, 0 ); */
       /* matrixrgb_write_text( "A", my_color, 1, 0, 134 );
        matrixrgb_write_text( "B", my_color, 1, 16, 134 );
        matrixrgb_write_text( "C", my_color, 1, 32, 134 );
        matrixrgb_write_text( "D", my_color, 1, 48, 134 );
        matrixrgb_write_text( "E", my_color, 1, 64, 134 );
        matrixrgb_write_text( "F", my_color, 1, 80, 134 );
        matrixrgb_write_text( "G", my_color, 1, 96, 134 );
        matrixrgb_write_text( "H", my_color, 1, 112, 134 );   */
     /*   matrixrgb_write_text( "9", my_color, 1, 128, 0 );
        matrixrgb_write_text( "10", my_color, 2, 144, 0 );
        matrixrgb_write_text( "11", my_color, 2, 160, 0 );
        matrixrgb_write_text( "12", my_color, 2, 176, 0 );
        matrixrgb_write_text( "13", my_color, 2, 192, 0 );
        matrixrgb_write_text( "14", my_color, 2, 0, 32 );
        matrixrgb_write_text( "15", my_color, 2, 16, 32 );
        matrixrgb_write_text( "16", my_color, 2, 32, 32 );
        matrixrgb_write_text( "17", my_color, 2, 48, 32 );
        matrixrgb_write_text( "18", my_color, 2, 64, 32 );
        matrixrgb_write_text( "19", my_color, 2, 80, 32 );
        matrixrgb_write_text( "20", my_color, 2, 96, 32 );  */

      /*  for( i = 0; i < 8; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );
        for( i = 8; i < 16; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 0, 1, 0 );
        for( i = 16; i < 24; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 0, 0, 1 );
        for( i = 24; i < 32; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 1, 0 );
        for( i = 32; i < 40; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 1 );
        for( i = 40; i < 48; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 0, 1, 1 );
        for( i = 48; i < 56; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 1, 1 );
        for( i = 56; i < 64; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 0, 0, 0 );
        for( i = 64; i < 72; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 1, 1 );
        for( i = 72; i < 80; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );
        for( i = 104; i < 112; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );
        for( i = 146; i < 154; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );
        for( i = 178; i < 186; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );
       /* for( i = 210; i < 218; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );
        for( i = 242; i < 250; i++ )
                for( j = 0; j < 32; j++ )
                        matrixrgb_write_pixel( i, j, 1, 0, 0 );     */



  /*  matrixrgb_scroll_img_left( MikroE_Sign_bmp, 32, 32, 4 );
    matrixrgb_scroll_off_scrn_down( 4 );
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_text_right( "Matrix ", my_color, 10, 10 );
    matrixrgb_set_color( &my_color, 1, 0, 0 );
    matrixrgb_scroll_text_left( "R", my_color, 10, 1 );
    matrixrgb_set_color( &my_color, 0, 1, 0 );
    matrixrgb_scroll_text_left( "G", my_color, 10, 1 );
    matrixrgb_set_color( &my_color, 0, 0, 1 );
    matrixrgb_scroll_text_left( "B ", my_color, 10, 1 );
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_off_scrn_up( 10 );
    matrixrgb_set_color( &my_color, 1, 0, 0 );
    matrixrgb_scroll_text_left( "By: ", my_color, 10, 4 );
    matrixrgb_set_color( &my_color, 1, 1, 1 );
    matrixrgb_scroll_text_left( "Corey ", my_color, 10, 6 );
    matrixrgb_set_color( &my_color, 0, 0, 1 );
    matrixrgb_scroll_text_left( "Lakey ", my_color, 10, 6 );
    matrixrgb_scroll_off_scrn_left( 17 );
    matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 10 );
    matrixrgb_scroll_off_scrn_right( 10 );                        */
    //matrixrgb_set_color( &my_color, 1, 0, 0 );
    //matrixrgb_image_load( MikroeBITMAP_bmp, 64, 16 );
    //matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 10 );
    while(1)
    {
        //matrixrgb_scroll_text_left( "MikroElektronika", my_color, 3, 16 );
     /*   matrixrgb_set_color( &my_color, 1, 1, 1 );
        matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
        matrixrgb_set_color( &my_color, 1, 0, 0 );
        matrixrgb_scroll_text_left( "R", my_color, 20, 1 );
        matrixrgb_set_color( &my_color, 0, 1, 0 );
        matrixrgb_scroll_text_left( "G", my_color, 20, 1 );
        matrixrgb_set_color( &my_color, 0, 0, 1 );
        matrixrgb_scroll_text_left( "B", my_color, 20, 1 );  */
        matrixrgb_scroll_text_left( "Text Scrolling Across Screen", my_color, 10, 28 );
       /* if( count >= 150 )
        {
            matrixrgb_shift_down();
            count = 0;
        }
        count++; */
       // matrixrgb_refresh();
    }
}

void system_setup( uint8_t width, uint8_t height )
{
    
    GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13); // Set Chip Select pin as output
    GPIO_Digital_Output( &GPIOC_BASE, _GPIO_PINMASK_2 ); // Set Reset pin to output
    GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10);  // Set Ready to input

    // Initialize SPI
    SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
                       _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                       _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_DISABLE | _SPI_SSI_1,
                       &_GPIO_MODULE_SPI3_PC10_11_12);

    MATRIXRGB_RST = 0;        //Reset slave ( toggle )
    Delay_ms(20);
    MATRIXRGB_RST = 1;
    Delay_ms(200);

    matrixrgb_init( width, height );
    Delay_ms(200);

}