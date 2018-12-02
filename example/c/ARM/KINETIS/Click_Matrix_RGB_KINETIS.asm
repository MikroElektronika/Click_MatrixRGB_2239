_systemInit:
;Click_Matrix_RGB_KINETIS.c,37 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Matrix_RGB_KINETIS.c,39 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Matrix_RGB_KINETIS.c,40 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Matrix_RGB_KINETIS.c,41 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Matrix_RGB_KINETIS.c,43 :: 		mikrobus_spiInit( _MIKROBUS1, &_MATRIXRGB_SPI_CFG[0] );
MOVW	R0, #lo_addr(__MATRIXRGB_SPI_CFG+0)
MOVT	R0, #hi_addr(__MATRIXRGB_SPI_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_spiInit+0
;Click_Matrix_RGB_KINETIS.c,45 :: 		Delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,46 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_Matrix_RGB_KINETIS.c,48 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Matrix_RGB_KINETIS.c,50 :: 		matrixrgb_spiDriverInit( (T_MATRIXRGB_P)&_MIKROBUS1_GPIO, (T_MATRIXRGB_P)&_MIKROBUS1_SPI );
MOVW	R1, #lo_addr(__MIKROBUS1_SPI+0)
MOVT	R1, #hi_addr(__MIKROBUS1_SPI+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_matrixrgb_spiDriverInit+0
;Click_Matrix_RGB_KINETIS.c,51 :: 		matrixrgb_deviceReset();
BL	_matrixrgb_deviceReset+0
;Click_Matrix_RGB_KINETIS.c,53 :: 		matrixrgb_deviceInit( _MATRIXRGB_PATTERN_1_MAP_5MM );
MOVS	R0, __MATRIXRGB_PATTERN_1_MAP_5MM
BL	_matrixrgb_deviceInit+0
;Click_Matrix_RGB_KINETIS.c,54 :: 		matrixrgb_setPower( 1 );
MOVS	R0, #1
BL	_matrixrgb_setPower+0
;Click_Matrix_RGB_KINETIS.c,55 :: 		Delay_ms( 1000 );
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_applicationInit2:
SUBS	R7, R7, #1
BNE	L_applicationInit2
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,57 :: 		matrixrgb_setFont( &Arial9x9[0], 0xFFFF, _MATRIXRGB_FONT_HORIZONTAL );
MOVS	R2, __MATRIXRGB_FONT_HORIZONTAL
MOVW	R1, #65535
MOVW	R0, #lo_addr(Click_Matrix_RGB_KINETIS_Arial9x9+0)
MOVT	R0, #hi_addr(Click_Matrix_RGB_KINETIS_Arial9x9+0)
BL	_matrixrgb_setFont+0
;Click_Matrix_RGB_KINETIS.c,58 :: 		matrixrgb_fillScreen( 0xFFFF );
MOVW	R0, #65535
BL	_matrixrgb_fillScreen+0
;Click_Matrix_RGB_KINETIS.c,59 :: 		Delay_ms( 1000 );
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_applicationInit4:
SUBS	R7, R7, #1
BNE	L_applicationInit4
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,60 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_Matrix_RGB_KINETIS.c,62 :: 		void applicationTask()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Click_Matrix_RGB_KINETIS.c,67 :: 		for (test = 5; test < 50; test++)
; test start address is: 4 (R1)
MOVS	R1, #5
; test end address is: 4 (R1)
L_applicationTask6:
; test start address is: 4 (R1)
CMP	R1, #50
IT	CS
BCS	L_applicationTask7
;Click_Matrix_RGB_KINETIS.c,69 :: 		matrixrgb_setBrightness( test );
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_matrixrgb_setBrightness+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_KINETIS.c,70 :: 		Delay_ms( 50 );
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_applicationTask9:
SUBS	R7, R7, #1
BNE	L_applicationTask9
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,67 :: 		for (test = 5; test < 50; test++)
ADDS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_KINETIS.c,71 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask6
L_applicationTask7:
;Click_Matrix_RGB_KINETIS.c,73 :: 		for (test = 50; test > 5; test--)
; test start address is: 4 (R1)
MOVS	R1, #50
; test end address is: 4 (R1)
L_applicationTask11:
; test start address is: 4 (R1)
CMP	R1, #5
IT	LS
BLS	L_applicationTask12
;Click_Matrix_RGB_KINETIS.c,75 :: 		matrixrgb_setBrightness( test );
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_matrixrgb_setBrightness+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_KINETIS.c,76 :: 		Delay_ms( 50 );
MOVW	R7, #33918
MOVT	R7, #30
NOP
NOP
L_applicationTask14:
SUBS	R7, R7, #1
BNE	L_applicationTask14
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,73 :: 		for (test = 50; test > 5; test--)
SUBS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_KINETIS.c,77 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask11
L_applicationTask12:
;Click_Matrix_RGB_KINETIS.c,80 :: 		matrixrgb_fillScreen( 0x0000 );
MOVS	R0, #0
BL	_matrixrgb_fillScreen+0
;Click_Matrix_RGB_KINETIS.c,81 :: 		for (test = 0; test < 32; test++)
; test start address is: 4 (R1)
MOVS	R1, #0
; test end address is: 4 (R1)
L_applicationTask16:
; test start address is: 4 (R1)
CMP	R1, #32
IT	CS
BCS	L_applicationTask17
;Click_Matrix_RGB_KINETIS.c,83 :: 		matrixrgb_writePixel( test, test, 0xF100 );
STRH	R1, [SP, #4]
MOVW	R2, #61696
UXTH	R0, R1
BL	_matrixrgb_writePixel+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_KINETIS.c,84 :: 		Delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_applicationTask19:
SUBS	R7, R7, #1
BNE	L_applicationTask19
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,81 :: 		for (test = 0; test < 32; test++)
ADDS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_KINETIS.c,85 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask16
L_applicationTask17:
;Click_Matrix_RGB_KINETIS.c,86 :: 		for (test = 32; test > 0; test--)
; test start address is: 4 (R1)
MOVS	R1, #32
; test end address is: 4 (R1)
L_applicationTask21:
; test start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_applicationTask22
;Click_Matrix_RGB_KINETIS.c,88 :: 		matrixrgb_writePixel( 31 - test, test, 0xF100 );
RSB	R0, R1, #31
STRH	R1, [SP, #4]
MOVW	R2, #61696
BL	_matrixrgb_writePixel+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_KINETIS.c,89 :: 		Delay_ms( 100 );
MOVW	R7, #2302
MOVT	R7, #61
NOP
NOP
L_applicationTask24:
SUBS	R7, R7, #1
BNE	L_applicationTask24
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,86 :: 		for (test = 32; test > 0; test--)
SUBS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_KINETIS.c,90 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask21
L_applicationTask22:
;Click_Matrix_RGB_KINETIS.c,93 :: 		matrixrgb_fillScreen( 0x0000 );
MOVS	R0, #0
BL	_matrixrgb_fillScreen+0
;Click_Matrix_RGB_KINETIS.c,94 :: 		matrixrgb_writeText( "RGB", 6, 5 );
MOVW	R0, #lo_addr(?lstr1_Click_Matrix_RGB_KINETIS+0)
MOVT	R0, #hi_addr(?lstr1_Click_Matrix_RGB_KINETIS+0)
MOVS	R2, #5
MOVS	R1, #6
BL	_matrixrgb_writeText+0
;Click_Matrix_RGB_KINETIS.c,95 :: 		matrixrgb_writeText( "Demo", 4, 20 );
MOVW	R0, #lo_addr(?lstr2_Click_Matrix_RGB_KINETIS+0)
MOVT	R0, #hi_addr(?lstr2_Click_Matrix_RGB_KINETIS+0)
MOVS	R2, #20
MOVS	R1, #4
BL	_matrixrgb_writeText+0
;Click_Matrix_RGB_KINETIS.c,96 :: 		Delay_ms( 2000 );
MOVW	R7, #46078
MOVT	R7, #1220
NOP
NOP
L_applicationTask26:
SUBS	R7, R7, #1
BNE	L_applicationTask26
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,99 :: 		matrixrgb_drawImage( mikroe_logo_64x32_bmp );
MOVW	R0, #lo_addr(Click_Matrix_RGB_KINETIS_mikroe_logo_64x32_bmp+0)
MOVT	R0, #hi_addr(Click_Matrix_RGB_KINETIS_mikroe_logo_64x32_bmp+0)
BL	_matrixrgb_drawImage+0
;Click_Matrix_RGB_KINETIS.c,100 :: 		Delay_ms( 1000 );
MOVW	R7, #23038
MOVT	R7, #610
NOP
NOP
L_applicationTask28:
SUBS	R7, R7, #1
BNE	L_applicationTask28
NOP
NOP
NOP
;Click_Matrix_RGB_KINETIS.c,101 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _applicationTask
_main:
;Click_Matrix_RGB_KINETIS.c,103 :: 		void main()
;Click_Matrix_RGB_KINETIS.c,105 :: 		systemInit();
BL	_systemInit+0
;Click_Matrix_RGB_KINETIS.c,106 :: 		applicationInit();
BL	_applicationInit+0
;Click_Matrix_RGB_KINETIS.c,108 :: 		while (1)
L_main30:
;Click_Matrix_RGB_KINETIS.c,110 :: 		applicationTask();
BL	_applicationTask+0
;Click_Matrix_RGB_KINETIS.c,111 :: 		}
IT	AL
BAL	L_main30
;Click_Matrix_RGB_KINETIS.c,112 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
