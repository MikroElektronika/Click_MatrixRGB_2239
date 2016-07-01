
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 3
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MatrixRGB_AVR.c,15 :: 		void main()
;MatrixRGB_AVR.c,17 :: 		uint8_t count = 3;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
;MatrixRGB_AVR.c,18 :: 		uint8_t i     = 0;
;MatrixRGB_AVR.c,20 :: 		char brightness  = 100;
; brightness start address is: 16 (R16)
	LDI        R16, 100
;MatrixRGB_AVR.c,21 :: 		uint8_t width    = 2;
; width start address is: 17 (R17)
	LDI        R17, 2
;MatrixRGB_AVR.c,22 :: 		uint8_t height   = 1;
; height start address is: 18 (R18)
	LDI        R18, 1
;MatrixRGB_AVR.c,24 :: 		system_setup( brightness, width, height );
	MOV        R4, R18
; height end address is: 18 (R18)
	MOV        R3, R17
; width end address is: 17 (R17)
	MOV        R2, R16
; brightness end address is: 16 (R16)
	CALL       _system_setup+0
;MatrixRGB_AVR.c,26 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVW       R16, R28
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _matrixrgb_set_color+0
;MatrixRGB_AVR.c,27 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 17, 10 );
	LDI        R27, 10
	MOV        R5, R27
	LDI        R27, 17
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_MatrixRGB_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_MatrixRGB_AVR+0)
	MOV        R3, R27
	LDD        R27, Y+2
	PUSH       R27
	LDD        R27, Y+1
	PUSH       R27
	LDD        R27, Y+0
	PUSH       R27
	CALL       _matrixrgb_scroll_text_left+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 3
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MatrixRGB_AVR.c,31 :: 		while(1)
L_main0:
;MatrixRGB_AVR.c,33 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	MOVW       R16, R28
	CLR        R6
	CLR        R5
	LDI        R27, 1
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _matrixrgb_set_color+0
;MatrixRGB_AVR.c,34 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 17, 10 );
	LDI        R27, 10
	MOV        R5, R27
	LDI        R27, 17
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_MatrixRGB_AVR+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_MatrixRGB_AVR+0)
	MOV        R3, R27
	LDD        R27, Y+2
	PUSH       R27
	LDD        R27, Y+1
	PUSH       R27
	LDD        R27, Y+0
	PUSH       R27
	CALL       _matrixrgb_scroll_text_left+0
	IN         R26, SPL+0
	IN         R27, SPL+1
	ADIW       R26, 3
	OUT        SPL+0, R26
	OUT        SPL+1, R27
;MatrixRGB_AVR.c,35 :: 		}
	JMP        L_main0
;MatrixRGB_AVR.c,36 :: 		}
L_end_main:
	POP        R6
	POP        R5
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_system_setup:

;MatrixRGB_AVR.c,38 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
;MatrixRGB_AVR.c,40 :: 		CS_DIR    = 1;
	LDS        R27, PORTD_DIR+0
	SBR        R27, 1
	STS        PORTD_DIR+0, R27
;MatrixRGB_AVR.c,41 :: 		RST_DIR   = 1;
	LDS        R27, PORTA_DIR+0
	SBR        R27, 1
	STS        PORTA_DIR+0, R27
;MatrixRGB_AVR.c,42 :: 		READY_DIR = 0;
	LDS        R27, PORTD_DIR+0
	CBR        R27, 1
	STS        PORTD_DIR+0, R27
;MatrixRGB_AVR.c,44 :: 		SPIC_Init();
	CALL       _SPIC_Init+0
;MatrixRGB_AVR.c,46 :: 		Delay_ms(300);
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_system_setup2:
	DEC        R16
	BRNE       L_system_setup2
	DEC        R17
	BRNE       L_system_setup2
	DEC        R18
	BRNE       L_system_setup2
	NOP
	NOP
;MatrixRGB_AVR.c,48 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
	LDS        R27, PORTA_PIN6CTRL+0
	CBR        R27, 1
	STS        PORTA_PIN6CTRL+0, R27
;MatrixRGB_AVR.c,49 :: 		Delay_ms(20);
	LDI        R17, 208
	LDI        R16, 202
L_system_setup4:
	DEC        R16
	BRNE       L_system_setup4
	DEC        R17
	BRNE       L_system_setup4
	NOP
;MatrixRGB_AVR.c,50 :: 		MATRIXRGB_RST = 1;
	LDS        R27, PORTA_PIN6CTRL+0
	SBR        R27, 1
	STS        PORTA_PIN6CTRL+0, R27
;MatrixRGB_AVR.c,51 :: 		Delay_ms(1000);
	LDI        R18, 41
	LDI        R17, 150
	LDI        R16, 128
L_system_setup6:
	DEC        R16
	BRNE       L_system_setup6
	DEC        R17
	BRNE       L_system_setup6
	DEC        R18
	BRNE       L_system_setup6
;MatrixRGB_AVR.c,54 :: 		matrixrgb_init( brightness, width, height );
	CALL       _matrixrgb_init+0
;MatrixRGB_AVR.c,55 :: 		Delay_ms(200);
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_system_setup8:
	DEC        R16
	BRNE       L_system_setup8
	DEC        R17
	BRNE       L_system_setup8
	DEC        R18
	BRNE       L_system_setup8
	NOP
;MatrixRGB_AVR.c,57 :: 		}
L_end_system_setup:
	RET
; end of _system_setup
