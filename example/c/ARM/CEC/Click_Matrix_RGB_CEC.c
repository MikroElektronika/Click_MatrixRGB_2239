/*
Example for Matrix_RGB Click

    Date          : Jul 2018.
    Author        : MikroE Team

Test configuration CEC :
    
    MCU              : CEC1702
    Dev. Board       : Clicker 2 for CEC1702
    ARM Compiler ver : v6.0.0.0

---

Description :

The application is composed of three sections :

- System Initialization : Initializes GPIO pins and SPI bus used for
         communcation with the click board
- Application Initialization : Initializes driver, reset device and initializes
         firmware depend on pattern used alongside with fonts
- Application Task (code snippet) : Test of panel brightnes, draws red cross on
         the panel using pixel write function, writes text on panel using
         write text function and finaly displays image on the panel.

Notes :

Use mikroE GLCD Font Creator to create font definition table.

*/

#include "Click_Matrix_RGB_types.h"
#include "Click_Matrix_RGB_config.h"

#include "images.h"

void systemInit()
{
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
    mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );

    mikrobus_spiInit( _MIKROBUS1, &_MATRIXRGB_SPI_CFG[0] );

    Delay_ms( 100 );
}

void applicationInit()
{
    matrixrgb_spiDriverInit( (T_MATRIXRGB_P)&_MIKROBUS1_GPIO, (T_MATRIXRGB_P)&_MIKROBUS1_SPI );
    matrixrgb_deviceReset();

    matrixrgb_deviceInit( _MATRIXRGB_PATTERN_1_MAP_5MM );
    matrixrgb_setPower( 1 );
    Delay_ms( 1000 );

    // matrixrgb_setFont( &Arial9x9[0], 0xFFFF, _MATRIXRGB_FONT_HORIZONTAL );
    matrixrgb_fillScreen( 0xFFFF );
    Delay_ms( 1000 );
}

void applicationTask()
{
    uint16_t test;

    // Brightness Test
    for (test = 5; test < 50; test++)
    {
        matrixrgb_setBrightness( test );
        Delay_ms( 50 );
    }

    for (test = 50; test > 5; test--)
    {
        matrixrgb_setBrightness( test );
        Delay_ms( 50 );
    }

    // Pixel Write Test
    matrixrgb_fillScreen( 0x0000 );
    for (test = 0; test < 32; test++)
    {
        matrixrgb_writePixel( test, test, 0xF100 );
        Delay_ms( 100 );
    }
    for (test = 32; test > 0; test--)
    {
        matrixrgb_writePixel( 31 - test, test, 0xF100 );
        Delay_ms( 100 );
    }

    // Text Write Ttest
    // matrixrgb_fillScreen( 0x0000 );
    // matrixrgb_writeText( "RGB", 6, 5 );
    // matrixrgb_writeText( "Demo", 4, 20 );
    // Delay_ms( 2000 );

    // Image Test
    matrixrgb_drawImage( &mikroe_logo_32x32_bmp[0] );
    Delay_ms( 1000 );
}

void main()
{
    systemInit();
    applicationInit();

    while (1)
    {
        applicationTask();
    }
}