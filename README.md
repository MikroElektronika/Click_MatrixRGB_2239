![MikroE](http://www.mikroe.com/img/designs/beta/logo_small.png)

---

# Matrix RGB Click

- **CIC Prefix**  : MATRIXRGB
- **Author**      : Milos Vidojevic
- **Verison**     : 2.1.0
- **Date**        : Jul 2018.

---

### Software Support

We provide a library for the Matrix RGB Click on our [LibStock](https://libstock.mikroe.com/projects/view/1840/matrix-rgb-click) 
page, as well as a demo application (example), developed using MikroElektronika 
[compilers](http://shop.mikroe.com/compilers). The demo can run on all the main 
MikroElektronika [development boards](http://shop.mikroe.com/development-boards).

**Library Description**

Library covers 8 different patterns, from single to 4 panels positioned as square. 
You can draw images, write text change brightness and write single pixels on the panel.

Key functions :

- ``` void matrixrgb_fillScreen( uint16_t color ) ``` - Fill screen with provided color
- ``` void matrixrgb_drawImage( const uint8_t *img ) ``` - Draw image on screen
- ``` void matrixrgb_writeText( char* text, uint8_t x, uint8_t y ) ``` - Write text on display

**Examples Description**

Description :

The application is composed of three sections :

- System Initialization : Initializes GPIO pins and SPI bus used for
         communcation with the click board
- Application Initialization : Initializes driver, reset device and initializes
         firmware depend on pattern used alongside with fonts
- Application Task (code snippet) : Test of panel brightnes, draws red cross on
         the panel using pixel write function and finaly displays image on the panel.

Notes :

Use mikroE GLCD Font Creator to create font definition table.

```.c

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

    // Image Test
    matrixrgb_drawImage( &mikroe_logo_32x32_bmp[0] );
    Delay_ms( 1000 );
}

```

The full application code, and ready to use projects can be found on our 
[LibStock](https://libstock.mikroe.com/projects/view/1840/matrix-rgb-click) page.

Other mikroE Libraries used in the example:

- SPI

**Additional notes and informations**

Depending on the development board you are using, you may need 
[USB UART click](http://shop.mikroe.com/usb-uart-click), 
[USB UART 2 Click](http://shop.mikroe.com/usb-uart-2-click) or 
[RS232 Click](http://shop.mikroe.com/rs232-click) to connect to your PC, for 
development systems with no UART to USB interface available on the board. The 
terminal available in all Mikroelektronika 
[compilers](http://shop.mikroe.com/compilers), or any other terminal application 
of your choice, can be used to read the message.

---
### Architectures Supported

#### mikroC

| STM | KIN | CEC | MSP | TIVA | PIC | PIC32 | DSPIC | AVR | FT90x |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| x | x | x | x | x | x | x | x | x | x |

#### mikroBasic

| STM | KIN | CEC | MSP | TIVA | PIC | PIC32 | DSPIC | AVR | FT90x |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| x | x | x | x | x | x | x | x | x | x |

#### mikroPascal

| STM | KIN | CEC | MSP | TIVA | PIC | PIC32 | DSPIC | AVR | FT90x |
|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|:-:|
| x | x | x | x | x | x | x | x | x | x |

---
---
