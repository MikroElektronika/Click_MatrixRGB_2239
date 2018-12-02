_systemInit:
;Click_Matrix_RGB_STM.c,36 :: 		void systemInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Matrix_RGB_STM.c,38 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_INT_PIN, _GPIO_INPUT );
MOVS	R2, #1
MOVS	R1, #7
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Matrix_RGB_STM.c,39 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_CS_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #2
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Matrix_RGB_STM.c,40 :: 		mikrobus_gpioInit( _MIKROBUS1, _MIKROBUS_RST_PIN, _GPIO_OUTPUT );
MOVS	R2, #0
MOVS	R1, #1
MOVS	R0, #0
BL	_mikrobus_gpioInit+0
;Click_Matrix_RGB_STM.c,42 :: 		mikrobus_spiInit( _MIKROBUS1, &_MATRIXRGB_SPI_CFG[0] );
MOVW	R0, #lo_addr(__MATRIXRGB_SPI_CFG+0)
MOVT	R0, #hi_addr(__MATRIXRGB_SPI_CFG+0)
MOV	R1, R0
MOVS	R0, #0
BL	_mikrobus_spiInit+0
;Click_Matrix_RGB_STM.c,44 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_systemInit0:
SUBS	R7, R7, #1
BNE	L_systemInit0
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,45 :: 		}
L_end_systemInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _systemInit
_applicationInit:
;Click_Matrix_RGB_STM.c,47 :: 		void applicationInit()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;Click_Matrix_RGB_STM.c,49 :: 		matrixrgb_spiDriverInit( (T_MATRIXRGB_P)&_MIKROBUS1_GPIO, (T_MATRIXRGB_P)&_MIKROBUS1_SPI );
MOVW	R1, #lo_addr(__MIKROBUS1_SPI+0)
MOVT	R1, #hi_addr(__MIKROBUS1_SPI+0)
MOVW	R0, #lo_addr(__MIKROBUS1_GPIO+0)
MOVT	R0, #hi_addr(__MIKROBUS1_GPIO+0)
BL	_matrixrgb_spiDriverInit+0
;Click_Matrix_RGB_STM.c,50 :: 		matrixrgb_deviceReset();
BL	_matrixrgb_deviceReset+0
;Click_Matrix_RGB_STM.c,52 :: 		matrixrgb_deviceInit( _MATRIXRGB_PATTERN_1_MAP_5MM );
MOVS	R0, __MATRIXRGB_PATTERN_1_MAP_5MM
BL	_matrixrgb_deviceInit+0
;Click_Matrix_RGB_STM.c,53 :: 		matrixrgb_setPower( 1 );
MOVS	R0, #1
BL	_matrixrgb_setPower+0
;Click_Matrix_RGB_STM.c,54 :: 		Delay_ms( 1000 );
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_applicationInit2:
SUBS	R7, R7, #1
BNE	L_applicationInit2
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,56 :: 		matrixrgb_setFont( &Arial9x9[0], 0xFFFF, _MATRIXRGB_FONT_HORIZONTAL );
MOVS	R2, __MATRIXRGB_FONT_HORIZONTAL
MOVW	R1, #65535
MOVW	R0, #lo_addr(Click_Matrix_RGB_STM_Arial9x9+0)
MOVT	R0, #hi_addr(Click_Matrix_RGB_STM_Arial9x9+0)
BL	_matrixrgb_setFont+0
;Click_Matrix_RGB_STM.c,57 :: 		matrixrgb_fillScreen( 0xFFFF );
MOVW	R0, #65535
BL	_matrixrgb_fillScreen+0
;Click_Matrix_RGB_STM.c,58 :: 		Delay_ms( 1000 );
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_applicationInit4:
SUBS	R7, R7, #1
BNE	L_applicationInit4
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,59 :: 		}
L_end_applicationInit:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _applicationInit
_applicationTask:
;Click_Matrix_RGB_STM.c,61 :: 		void applicationTask()
SUB	SP, SP, #8
STR	LR, [SP, #0]
;Click_Matrix_RGB_STM.c,66 :: 		for (test = 5; test < 50; test++)
; test start address is: 4 (R1)
MOVS	R1, #5
; test end address is: 4 (R1)
L_applicationTask6:
; test start address is: 4 (R1)
CMP	R1, #50
IT	CS
BCS	L_applicationTask7
;Click_Matrix_RGB_STM.c,68 :: 		matrixrgb_setBrightness( test );
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_matrixrgb_setBrightness+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_STM.c,69 :: 		Delay_ms( 50 );
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_applicationTask9:
SUBS	R7, R7, #1
BNE	L_applicationTask9
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,66 :: 		for (test = 5; test < 50; test++)
ADDS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_STM.c,70 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask6
L_applicationTask7:
;Click_Matrix_RGB_STM.c,72 :: 		for (test = 50; test > 5; test--)
; test start address is: 4 (R1)
MOVS	R1, #50
; test end address is: 4 (R1)
L_applicationTask11:
; test start address is: 4 (R1)
CMP	R1, #5
IT	LS
BLS	L_applicationTask12
;Click_Matrix_RGB_STM.c,74 :: 		matrixrgb_setBrightness( test );
STRH	R1, [SP, #4]
UXTB	R0, R1
BL	_matrixrgb_setBrightness+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_STM.c,75 :: 		Delay_ms( 50 );
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_applicationTask14:
SUBS	R7, R7, #1
BNE	L_applicationTask14
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,72 :: 		for (test = 50; test > 5; test--)
SUBS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_STM.c,76 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask11
L_applicationTask12:
;Click_Matrix_RGB_STM.c,79 :: 		matrixrgb_fillScreen( 0x0000 );
MOVS	R0, #0
BL	_matrixrgb_fillScreen+0
;Click_Matrix_RGB_STM.c,80 :: 		for (test = 0; test < 32; test++)
; test start address is: 4 (R1)
MOVS	R1, #0
; test end address is: 4 (R1)
L_applicationTask16:
; test start address is: 4 (R1)
CMP	R1, #32
IT	CS
BCS	L_applicationTask17
;Click_Matrix_RGB_STM.c,82 :: 		matrixrgb_writePixel( test, test, 0xF100 );
STRH	R1, [SP, #4]
MOVW	R2, #61696
UXTH	R0, R1
BL	_matrixrgb_writePixel+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_STM.c,83 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_applicationTask19:
SUBS	R7, R7, #1
BNE	L_applicationTask19
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,80 :: 		for (test = 0; test < 32; test++)
ADDS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_STM.c,84 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask16
L_applicationTask17:
;Click_Matrix_RGB_STM.c,85 :: 		for (test = 32; test > 0; test--)
; test start address is: 4 (R1)
MOVS	R1, #32
; test end address is: 4 (R1)
L_applicationTask21:
; test start address is: 4 (R1)
CMP	R1, #0
IT	LS
BLS	L_applicationTask22
;Click_Matrix_RGB_STM.c,87 :: 		matrixrgb_writePixel( 31 - test, test, 0xF100 );
RSB	R0, R1, #31
STRH	R1, [SP, #4]
MOVW	R2, #61696
BL	_matrixrgb_writePixel+0
LDRH	R1, [SP, #4]
;Click_Matrix_RGB_STM.c,88 :: 		Delay_ms( 100 );
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_applicationTask24:
SUBS	R7, R7, #1
BNE	L_applicationTask24
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,85 :: 		for (test = 32; test > 0; test--)
SUBS	R1, R1, #1
UXTH	R1, R1
;Click_Matrix_RGB_STM.c,89 :: 		}
; test end address is: 4 (R1)
IT	AL
BAL	L_applicationTask21
L_applicationTask22:
;Click_Matrix_RGB_STM.c,92 :: 		matrixrgb_fillScreen( 0x0000 );
MOVS	R0, #0
BL	_matrixrgb_fillScreen+0
;Click_Matrix_RGB_STM.c,93 :: 		matrixrgb_writeText( "RGB", 6, 5 );
MOVW	R0, #lo_addr(?lstr1_Click_Matrix_RGB_STM+0)
MOVT	R0, #hi_addr(?lstr1_Click_Matrix_RGB_STM+0)
MOVS	R2, #5
MOVS	R1, #6
BL	_matrixrgb_writeText+0
;Click_Matrix_RGB_STM.c,94 :: 		matrixrgb_writeText( "Demo", 4, 20 );
MOVW	R0, #lo_addr(?lstr2_Click_Matrix_RGB_STM+0)
MOVT	R0, #hi_addr(?lstr2_Click_Matrix_RGB_STM+0)
MOVS	R2, #20
MOVS	R1, #4
BL	_matrixrgb_writeText+0
;Click_Matrix_RGB_STM.c,95 :: 		Delay_ms( 2000 );
MOVW	R7, #13823
MOVT	R7, #366
NOP
NOP
L_applicationTask26:
SUBS	R7, R7, #1
BNE	L_applicationTask26
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,98 :: 		matrixrgb_drawImage( mikroe_logo_32x32_bmp );
MOVW	R0, #lo_addr(Click_Matrix_RGB_STM_mikroe_logo_32x32_bmp+0)
MOVT	R0, #hi_addr(Click_Matrix_RGB_STM_mikroe_logo_32x32_bmp+0)
BL	_matrixrgb_drawImage+0
;Click_Matrix_RGB_STM.c,99 :: 		Delay_ms( 1000 );
MOVW	R7, #6911
MOVT	R7, #183
NOP
NOP
L_applicationTask28:
SUBS	R7, R7, #1
BNE	L_applicationTask28
NOP
NOP
NOP
;Click_Matrix_RGB_STM.c,100 :: 		}
L_end_applicationTask:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _applicationTask
_main:
;Click_Matrix_RGB_STM.c,102 :: 		void main()
;Click_Matrix_RGB_STM.c,104 :: 		systemInit();
BL	_systemInit+0
;Click_Matrix_RGB_STM.c,105 :: 		applicationInit();
BL	_applicationInit+0
;Click_Matrix_RGB_STM.c,107 :: 		while (1)
L_main30:
;Click_Matrix_RGB_STM.c,109 :: 		applicationTask();
BL	_applicationTask+0
;Click_Matrix_RGB_STM.c,110 :: 		}
IT	AL
BAL	L_main30
;Click_Matrix_RGB_STM.c,111 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
