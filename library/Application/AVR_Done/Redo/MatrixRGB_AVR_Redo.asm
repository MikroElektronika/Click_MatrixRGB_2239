
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

;MatrixRGB_AVR_Redo.c,13 :: 		void main()
;MatrixRGB_AVR_Redo.c,15 :: 		uint8_t count = 3;
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	PUSH       R6
;MatrixRGB_AVR_Redo.c,16 :: 		uint8_t i     = 0;
;MatrixRGB_AVR_Redo.c,19 :: 		system_setup( 100, 2, 1 );
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _system_setup+0
;MatrixRGB_AVR_Redo.c,23 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVW       R16, R28
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _matrixrgb_set_color+0
;MatrixRGB_AVR_Redo.c,24 :: 		matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
	LDI        R27, 10
	MOV        R5, R27
	LDI        R27, 17
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr1_MatrixRGB_AVR_Redo+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr1_MatrixRGB_AVR_Redo+0)
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
;MatrixRGB_AVR_Redo.c,43 :: 		while(1)
L_main0:
;MatrixRGB_AVR_Redo.c,45 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVW       R16, R28
	LDI        R27, 1
	MOV        R6, R27
	LDI        R27, 1
	MOV        R5, R27
	LDI        R27, 1
	MOV        R4, R27
	MOVW       R2, R16
	CALL       _matrixrgb_set_color+0
;MatrixRGB_AVR_Redo.c,46 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
	LDI        R27, 10
	MOV        R5, R27
	LDI        R27, 20
	MOV        R4, R27
	LDI        R27, #lo_addr(?lstr2_MatrixRGB_AVR_Redo+0)
	MOV        R2, R27
	LDI        R27, hi_addr(?lstr2_MatrixRGB_AVR_Redo+0)
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
;MatrixRGB_AVR_Redo.c,53 :: 		}
	JMP        L_main0
;MatrixRGB_AVR_Redo.c,54 :: 		}
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

;MatrixRGB_AVR_Redo.c,56 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
;MatrixRGB_AVR_Redo.c,58 :: 		MATRIXRGB_CS_DIR    = 1;
	IN         R27, DDA5_bit+0
	SBR        R27, BitMask(DDA5_bit+0)
	OUT        DDA5_bit+0, R27
;MatrixRGB_AVR_Redo.c,59 :: 		MATRIXRGB_RST_DIR   = 1;
	IN         R27, DDA6_bit+0
	SBR        R27, BitMask(DDA6_bit+0)
	OUT        DDA6_bit+0, R27
;MatrixRGB_AVR_Redo.c,60 :: 		MATRIXRGB_READY_DIR = 0;
	IN         R27, DDD2_bit+0
	CBR        R27, BitMask(DDD2_bit+0)
	OUT        DDD2_bit+0, R27
;MatrixRGB_AVR_Redo.c,62 :: 		SPI1_Init_Advanced( _SPI_MASTER, _SPI_FCY_DIV32, _SPI_CLK_LO_LEADING );
	PUSH       R4
	PUSH       R3
	PUSH       R2
	CLR        R4
	LDI        R27, 6
	MOV        R3, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _SPI1_Init_Advanced+0
	POP        R2
	POP        R3
	POP        R4
;MatrixRGB_AVR_Redo.c,64 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
	IN         R27, PORTA6_bit+0
	CBR        R27, BitMask(PORTA6_bit+0)
	OUT        PORTA6_bit+0, R27
;MatrixRGB_AVR_Redo.c,65 :: 		Delay_ms(200);
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_system_setup2:
	DEC        R16
	BRNE       L_system_setup2
	DEC        R17
	BRNE       L_system_setup2
	DEC        R18
	BRNE       L_system_setup2
	NOP
;MatrixRGB_AVR_Redo.c,66 :: 		MATRIXRGB_RST = 1;
	IN         R27, PORTA6_bit+0
	SBR        R27, BitMask(PORTA6_bit+0)
	OUT        PORTA6_bit+0, R27
;MatrixRGB_AVR_Redo.c,67 :: 		Delay_ms(300);
	LDI        R18, 13
	LDI        R17, 45
	LDI        R16, 216
L_system_setup4:
	DEC        R16
	BRNE       L_system_setup4
	DEC        R17
	BRNE       L_system_setup4
	DEC        R18
	BRNE       L_system_setup4
	NOP
	NOP
;MatrixRGB_AVR_Redo.c,69 :: 		matrixrgb_init( brightness, width, height );
	CALL       _matrixrgb_init+0
;MatrixRGB_AVR_Redo.c,70 :: 		Delay_ms(200);
	LDI        R18, 9
	LDI        R17, 30
	LDI        R16, 229
L_system_setup6:
	DEC        R16
	BRNE       L_system_setup6
	DEC        R17
	BRNE       L_system_setup6
	DEC        R18
	BRNE       L_system_setup6
	NOP
;MatrixRGB_AVR_Redo.c,72 :: 		}
L_end_system_setup:
	RET
; end of _system_setup
