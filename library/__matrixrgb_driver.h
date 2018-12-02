/*
    __matrixrgb_driver.h

-----------------------------------------------------------------------------

  This file is part of mikroSDK.
  
  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

----------------------------------------------------------------------------- */

/**
@file   __matrixrgb_driver.h
@brief    Matrix_RGB Driver
@mainpage Matrix_RGB Click
@{

@image html libstock_fb_view.jpg

@}

@defgroup   MATRIXRGB
@brief      Matrix_RGB Click Driver
@{

| Global Library Prefix | **MATRIXRGB**     |
|:---------------------:|:-----------------:|
| Version               | **2.0.0**         |
| Date                  | **Jul 2018.**     |
| Developer             | **MikroE Team**   |

Compatibile with firmware version 2.1.0.

*/
/* -------------------------------------------------------------------------- */

#include "stdint.h"

#ifndef _MATRIXRGB_H_
#define _MATRIXRGB_H_

#define MATRIXRGB_ERR 		uint8_t

/** 
 * @macro T_MATRIXRGB_P
 * @brief Driver Abstract type 
 */
#define T_MATRIXRGB_P    const uint8_t*

/** @defgroup MATRIXRGB_COMPILE Compilation Config */              /** @{ */

   #define   __MATRIXRGB_DRV_SPI__                            /**<     @macro __MATRIXRGB_DRV_SPI__  @brief SPI driver selector */
//  #define   __MATRIXRGB_DRV_I2C__                            /**<     @macro __MATRIXRGB_DRV_I2C__  @brief I2C driver selector */                                          
// #define   __MATRIXRGB_DRV_UART__                           /**<     @macro __MATRIXRGB_DRV_UART__ @brief UART driver selector */ 

                                                                       /** @} */
/** @defgroup MATRIXRGB_VAR Variables */                               /** @{ */

extern const uint8_t _MATRIXRGB_FONT_HORIZONTAL;
extern const uint8_t _MATRIXRGB_FONT_VERTICAL;
extern const uint8_t _MATRIXRGB_FONT_VERTICAL_COLUMN;

extern const uint8_t _MATRIXRGB_PATTERN_1_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_1_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_2H_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_2H_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_2V_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_2V_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_3H_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_3H_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_3V_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_3V_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_4H_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_4H_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_4V_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_4V_MAP_6MM;
extern const uint8_t _MATRIXRGB_PATTERN_4S_MAP_5MM;
extern const uint8_t _MATRIXRGB_PATTERN_4S_MAP_6MM;

                                                                       /** @} */
/** @defgroup MATRIXRGB_TYPES Types */                                 /** @{ */



                                                                       /** @} */
#ifdef __cplusplus
extern "C"{
#endif

/** @defgroup MATRIXRGB_INIT Driver Initialization */              /** @{ */

#ifdef   __MATRIXRGB_DRV_SPI__
void matrixrgb_spiDriverInit(T_MATRIXRGB_P gpioObj, T_MATRIXRGB_P spiObj);
#endif
#ifdef   __MATRIXRGB_DRV_I2C__
void matrixrgb_i2cDriverInit(T_MATRIXRGB_P gpioObj, T_MATRIXRGB_P i2cObj, uint8_t slave);
#endif
#ifdef   __MATRIXRGB_DRV_UART__
void matrixrgb_uartDriverInit(T_MATRIXRGB_P gpioObj, T_MATRIXRGB_P uartObj);
#endif

// GPIO Only Drivers - remove in other cases
void matrixrgb_gpioDriverInit(T_MATRIXRGB_P gpioObj);
                                                                       /** @} */
/** @defgroup MATRIXRGB_FUNC Driver Functions */                   /** @{ */

/**
 * @brief Firmware Initialization
 *
 * @param[in] rowmap Panel ROW LUT - more info inside firmware documentation
 * @param[in] pattern_id Panel Pattern ID - more info inside firmware documentation
 *
 * @note
 * This function mus be executed right after driver initialization.
 */
MATRIXRGB_ERR matrixrgb_deviceInit( const uint8_t pattern_id );

/**
 * @brief Hard reset of the Matrix RGB click
 *
 * @note
 * Function takes 300 ms.
 */
void matrixrgb_deviceReset();

/**
 * @brief Set Power
 *
 * @param[in] powerState Power State (0 - OFF / 1 - ON)
 */
void matrixrgb_setPower( uint8_t powerState );

/**
 * @brief Set Brightness
 *
 * @param[in] brightness Brightness intensity
 *
 * @warning
 * In case of high brightness level flickering may appears due to fact
 * that this is software brightness implementation.
 */
void matrixrgb_setBrightness( uint8_t brightness );

/**
 * @brief Fill Screen
 *
 * @param[in] color screen color
 */
void matrixrgb_fillScreen( uint16_t color );

/**
 * @brief Draw Image on Panel
 *
 * @param[in] img pointer to image array
 *
 * @note
 * Image must be in RGB565 format LSB first.
 */
void matrixrgb_drawImage( const uint8_t *img );

/**
 * @brief Set Font Function
 *
 * Must be called before write text function to adjust text related properties.
 */
void matrixrgb_setFont( uint8_t *font, uint16_t color, uint8_t orientation );

/**
 * @brief Write Pixel
 *
 * @param[in] x horizontal position
 * @param[in] y vertical position
 * @param[in] color pixel color
 *
 * @return 
 * 0 OK / 1 Error
 *
 * @note 
 * Error may appear in case of wrong X or Y positions.
 */
MATRIXRGB_ERR matrixrgb_writePixel( uint16_t x, uint16_t y, uint16_t color );

/**
 * @brief Writes Text
 *
 * @param[in] x - horizontal offset
 * @param[in] y - vertical offset
 *
 * @return 
 * 0 OK / 1 Error
 *
 * Writing starts at provided offset
 *
 * @note 
 * Error may appear in case of wrong X or Y positions.
 */
MATRIXRGB_ERR matrixrgb_writeText( char *text, uint16_t x, uint16_t y );

                                                                       /** @} */
#ifdef __cplusplus
} // extern "C"
#endif
#endif

/**
    @example Click_Matrix_RGB_STM.c
    @example Click_Matrix_RGB_TIVA.c
    @example Click_Matrix_RGB_CEC.c
    @example Click_Matrix_RGB_KINETIS.c
    @example Click_Matrix_RGB_MSP.c
    @example Click_Matrix_RGB_PIC.c
    @example Click_Matrix_RGB_PIC32.c
    @example Click_Matrix_RGB_DSPIC.c
    @example Click_Matrix_RGB_AVR.c
    @example Click_Matrix_RGB_FT90x.c
    @example Click_Matrix_RGB_STM.mbas
    @example Click_Matrix_RGB_TIVA.mbas
    @example Click_Matrix_RGB_CEC.mbas
    @example Click_Matrix_RGB_KINETIS.mbas
    @example Click_Matrix_RGB_MSP.mbas
    @example Click_Matrix_RGB_PIC.mbas
    @example Click_Matrix_RGB_PIC32.mbas
    @example Click_Matrix_RGB_DSPIC.mbas
    @example Click_Matrix_RGB_AVR.mbas
    @example Click_Matrix_RGB_FT90x.mbas
    @example Click_Matrix_RGB_STM.mpas
    @example Click_Matrix_RGB_TIVA.mpas
    @example Click_Matrix_RGB_CEC.mpas
    @example Click_Matrix_RGB_KINETIS.mpas
    @example Click_Matrix_RGB_MSP.mpas
    @example Click_Matrix_RGB_PIC.mpas
    @example Click_Matrix_RGB_PIC32.mpas
    @example Click_Matrix_RGB_DSPIC.mpas
    @example Click_Matrix_RGB_AVR.mpas
    @example Click_Matrix_RGB_FT90x.mpas
*/                                                                     /** @} */
/* -------------------------------------------------------------------------- */
/*
  __matrixrgb_driver.h

  Copyright (c) 2017, MikroElektonika - http://www.mikroe.com

  All rights reserved.

Redistribution and use in source and binary forms, with or without
modification, are permitted provided that the following conditions are met:

1. Redistributions of source code must retain the above copyright
   notice, this list of conditions and the following disclaimer.

2. Redistributions in binary form must reproduce the above copyright
   notice, this list of conditions and the following disclaimer in the
   documentation and/or other materials provided with the distribution.

3. All advertising materials mentioning features or use of this software
   must display the following acknowledgement:
   This product includes software developed by the MikroElektonika.

4. Neither the name of the MikroElektonika nor the
   names of its contributors may be used to endorse or promote products
   derived from this software without specific prior written permission.

THIS SOFTWARE IS PROVIDED BY MIKROELEKTRONIKA ''AS IS'' AND ANY
EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
DISCLAIMED. IN NO EVENT SHALL MIKROELEKTRONIKA BE LIABLE FOR ANY
DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
(INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
(INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.

----------------------------------------------------------------------------- */