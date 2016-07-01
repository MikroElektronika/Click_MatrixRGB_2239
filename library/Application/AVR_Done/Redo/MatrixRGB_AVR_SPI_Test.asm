
_main:
	LDI        R27, 255
	OUT        SPL+0, R27
	LDI        R27, 0
	OUT        SPL+1, R27

;MatrixRGB_AVR_SPI_Test.c,13 :: 		void main()
;MatrixRGB_AVR_SPI_Test.c,15 :: 		uint8_t count = 3;
	PUSH       R2
	PUSH       R3
	PUSH       R4
;MatrixRGB_AVR_SPI_Test.c,16 :: 		uint8_t i     = 0;
;MatrixRGB_AVR_SPI_Test.c,19 :: 		system_setup( 100, 2, 1 );
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 2
	MOV        R3, R27
	LDI        R27, 100
	MOV        R2, R27
	CALL       _system_setup+0
;MatrixRGB_AVR_SPI_Test.c,22 :: 		while(1)
L_main0:
;MatrixRGB_AVR_SPI_Test.c,25 :: 		}
	JMP        L_main0
;MatrixRGB_AVR_SPI_Test.c,26 :: 		}
L_end_main:
	POP        R4
	POP        R3
	POP        R2
L__main_end_loop:
	JMP        L__main_end_loop
; end of _main

_system_setup:
	PUSH       R28
	PUSH       R29
	IN         R28, SPL+0
	IN         R29, SPL+1
	SBIW       R28, 6
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	ADIW       R28, 1

;MatrixRGB_AVR_SPI_Test.c,28 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
;MatrixRGB_AVR_SPI_Test.c,30 :: 		uint8_t buffer[6] = { 0 };
	PUSH       R2
	PUSH       R3
	PUSH       R4
	PUSH       R5
	LDI        R27, 0
	STD        Y+0, R27
	LDI        R27, 0
	STD        Y+1, R27
	LDI        R27, 0
	STD        Y+2, R27
	LDI        R27, 0
	STD        Y+3, R27
	LDI        R27, 0
	STD        Y+4, R27
	LDI        R27, 0
	STD        Y+5, R27
;MatrixRGB_AVR_SPI_Test.c,32 :: 		MATRIXRGB_CS_DIR    = 1;
	IN         R27, DDB4_bit+0
	SBR        R27, BitMask(DDB4_bit+0)
	OUT        DDB4_bit+0, R27
;MatrixRGB_AVR_SPI_Test.c,34 :: 		MATRIXRGB_READY_DIR = 0;
	IN         R27, DDB2_bit+0
	CBR        R27, BitMask(DDB2_bit+0)
	OUT        DDB2_bit+0, R27
;MatrixRGB_AVR_SPI_Test.c,36 :: 		SPI1_Init_Advanced( _SPI_MASTER, _SPI_FCY_DIV128, _SPI_CLK_LO_LEADING );
	CLR        R4
	LDI        R27, 3
	MOV        R3, R27
	LDI        R27, 16
	MOV        R2, R27
	CALL       _SPI1_Init_Advanced+0
;MatrixRGB_AVR_SPI_Test.c,40 :: 		Delay_ms(200);
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
;MatrixRGB_AVR_SPI_Test.c,41 :: 		matrixrgb_hal_init();
	CALL       _matrixrgb_hal_init+0
;MatrixRGB_AVR_SPI_Test.c,44 :: 		buffer[0] = 0x01;
	MOVW       R30, R28
	LDI        R27, 1
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,45 :: 		matrixrgb_hal_write( &buffer, 1 );
	MOVW       R16, R28
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _matrixrgb_hal_write+0
;MatrixRGB_AVR_SPI_Test.c,46 :: 		buffer[0] = 100;
	MOVW       R30, R28
	LDI        R27, 100
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,47 :: 		buffer[1] = 2;
	MOVW       R16, R28
	MOVW       R30, R16
	ADIW       R30, 1
	LDI        R27, 2
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,48 :: 		buffer[2] = 1;
	MOVW       R16, R28
	MOVW       R30, R16
	ADIW       R30, 2
	LDI        R27, 1
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,49 :: 		matrixrgb_hal_write( &buffer, 3 );
	MOVW       R16, R28
	LDI        R27, 3
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _matrixrgb_hal_write+0
;MatrixRGB_AVR_SPI_Test.c,50 :: 		buffer[0] = 5;
	MOVW       R30, R28
	LDI        R27, 5
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,51 :: 		matrixrgb_hal_write( &buffer, 1 );
	MOVW       R16, R28
	LDI        R27, 1
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _matrixrgb_hal_write+0
;MatrixRGB_AVR_SPI_Test.c,52 :: 		buffer[0] = 3;     //row
	MOVW       R30, R28
	LDI        R27, 3
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,53 :: 		buffer[1] = 3;     //column
	MOVW       R16, R28
	MOVW       R30, R16
	ADIW       R30, 1
	LDI        R27, 3
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,54 :: 		buffer[2] = 1;     //red
	MOVW       R16, R28
	MOVW       R30, R16
	ADIW       R30, 2
	LDI        R27, 1
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,55 :: 		buffer[3] = 0;     //green
	MOVW       R16, R28
	MOVW       R30, R16
	ADIW       R30, 3
	LDI        R27, 0
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,56 :: 		buffer[4] = 0;     //blue
	MOVW       R16, R28
	MOVW       R30, R16
	ADIW       R30, 4
	LDI        R27, 0
	ST         Z, R27
;MatrixRGB_AVR_SPI_Test.c,57 :: 		matrixrgb_hal_write( &buffer, 5 );
	MOVW       R16, R28
	LDI        R27, 5
	MOV        R4, R27
	LDI        R27, 0
	MOV        R5, R27
	MOVW       R2, R16
	CALL       _matrixrgb_hal_write+0
;MatrixRGB_AVR_SPI_Test.c,59 :: 		}
L_end_system_setup:
	POP        R5
	POP        R4
	POP        R3
	POP        R2
	ADIW       R28, 5
	OUT        SPL+0, R28
	OUT        SPL+1, R29
	POP        R29
	POP        R28
	RET
; end of _system_setup
