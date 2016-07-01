_main:
;MatrixRGB_FT90.c,10 :: 		void main()
LDK.L	SP, #43605
LINK	LR, #4
;MatrixRGB_FT90.c,12 :: 		uint8_t count = 3;
;MatrixRGB_FT90.c,13 :: 		uint8_t i     = 0;
;MatrixRGB_FT90.c,16 :: 		system_setup( 100, 2, 1 );
LDK.L	R2, #1
LDK.L	R1, #2
LDK.L	R0, #100
CALL	_system_setup+0
;MatrixRGB_FT90.c,18 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 40 );
LDK.L	R3, #40
LDK.L	R2, #16
LDK.L	R1, #64
LDK.L	R0, #_MikroeBITMAP_bmp+0
CALL	_matrixrgb_scroll_img_right+0
;MatrixRGB_FT90.c,19 :: 		matrixrgb_scroll_off_scrn_down( 30 );
LDK.L	R0, #30
CALL	_matrixrgb_scroll_off_scrn_down+0
;MatrixRGB_FT90.c,20 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #1
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,21 :: 		matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
LDK.L	R0, #?lstr1_MatrixRGB_FT90+0
LDK.L	R2, #10
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,22 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD.L	R0, SP, #0
LDK.L	R3, #0
LDK.L	R2, #0
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,23 :: 		matrixrgb_scroll_text_left( "R", my_color, 17, 1 );
LDK.L	R0, #?lstr2_MatrixRGB_FT90+0
LDK.L	R2, #1
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,24 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
ADD.L	R0, SP, #0
LDK.L	R3, #0
LDK.L	R2, #1
LDK.L	R1, #0
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,25 :: 		matrixrgb_scroll_text_left( "G", my_color, 17, 1 );
LDK.L	R0, #?lstr3_MatrixRGB_FT90+0
LDK.L	R2, #1
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,26 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,27 :: 		matrixrgb_scroll_text_left( "B ", my_color, 17, 1 );
LDK.L	R0, #?lstr4_MatrixRGB_FT90+0
LDK.L	R2, #1
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,28 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #1
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,29 :: 		matrixrgb_scroll_off_scrn_up( 30 );
LDK.L	R0, #30
CALL	_matrixrgb_scroll_off_scrn_up+0
;MatrixRGB_FT90.c,30 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD.L	R0, SP, #0
LDK.L	R3, #0
LDK.L	R2, #0
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,31 :: 		matrixrgb_scroll_text_left( "By: ", my_color, 17, 4 );
LDK.L	R0, #?lstr5_MatrixRGB_FT90+0
LDK.L	R2, #4
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,32 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #1
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,33 :: 		matrixrgb_scroll_text_left( "Corey ", my_color, 17, 6 );
LDK.L	R0, #?lstr6_MatrixRGB_FT90+0
LDK.L	R2, #6
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,34 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,35 :: 		matrixrgb_scroll_text_left( "Lakey ", my_color, 17, 6 );
LDK.L	R0, #?lstr7_MatrixRGB_FT90+0
LDK.L	R2, #6
LDK.L	R1, #17
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,36 :: 		matrixrgb_scroll_off_scrn_left( 17 );
LDK.L	R0, #17
CALL	_matrixrgb_scroll_off_scrn_left+0
;MatrixRGB_FT90.c,37 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 25 );
LDK.L	R3, #25
LDK.L	R2, #16
LDK.L	R1, #64
LDK.L	R0, #_MikroeBITMAP_bmp+0
CALL	_matrixrgb_scroll_img_right+0
;MatrixRGB_FT90.c,38 :: 		matrixrgb_scroll_off_scrn_right( 10 );
LDK.L	R0, #10
CALL	_matrixrgb_scroll_off_scrn_right+0
;MatrixRGB_FT90.c,40 :: 		while(1)
L_main0:
;MatrixRGB_FT90.c,42 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #1
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,43 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
LDK.L	R0, #?lstr8_MatrixRGB_FT90+0
LDK.L	R2, #10
LDK.L	R1, #20
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,44 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD.L	R0, SP, #0
LDK.L	R3, #0
LDK.L	R2, #0
LDK.L	R1, #1
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,45 :: 		matrixrgb_scroll_text_left( "R", my_color, 20, 1 );
LDK.L	R0, #?lstr9_MatrixRGB_FT90+0
LDK.L	R2, #1
LDK.L	R1, #20
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,46 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
ADD.L	R0, SP, #0
LDK.L	R3, #0
LDK.L	R2, #1
LDK.L	R1, #0
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,47 :: 		matrixrgb_scroll_text_left( "G", my_color, 20, 1 );
LDK.L	R0, #?lstr10_MatrixRGB_FT90+0
LDK.L	R2, #1
LDK.L	R1, #20
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,48 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD.L	R0, SP, #0
LDK.L	R3, #1
LDK.L	R2, #0
LDK.L	R1, #0
CALL	_matrixrgb_set_color+0
;MatrixRGB_FT90.c,49 :: 		matrixrgb_scroll_text_left( "B", my_color, 20, 1 );
LDK.L	R0, #?lstr11_MatrixRGB_FT90+0
LDK.L	R2, #1
LDK.L	R1, #20
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_matrixrgb_scroll_text_left+0
ADD.L	SP, SP, #4
;MatrixRGB_FT90.c,50 :: 		}
JMP	L_main0
;MatrixRGB_FT90.c,51 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
_system_setup:
;MatrixRGB_FT90.c,53 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; brightness start address is: 0 (R0)
BEXTU.L	R12, R0, #256
BEXTU.L	R13, R1, #256
BEXTU.L	R14, R2, #256
; height end address is: 8 (R2)
; width end address is: 4 (R1)
; brightness end address is: 0 (R0)
; brightness start address is: 48 (R12)
; width start address is: 52 (R13)
; height start address is: 56 (R14)
;MatrixRGB_FT90.c,56 :: 		GPIO_Digital_Input(&GPIO_PORT_00_07, _GPIO_PINMASK_3 );
LDK.L	R1, #8
LDK.L	R0, #GPIO_PORT_00_07+0
CALL	_GPIO_Digital_Input+0
;MatrixRGB_FT90.c,57 :: 		GPIO_Digital_Output(&GPIO_PORT_00_07, _GPIO_PINMASK_1 );
LDK.L	R1, #2
LDK.L	R0, #GPIO_PORT_00_07+0
CALL	_GPIO_Digital_Output+0
;MatrixRGB_FT90.c,58 :: 		GPIO_Digital_Output(&GPIO_PORT_24_31, _GPIO_PINMASK_4 );
LDK.L	R1, #16
LDK.L	R0, #GPIO_PORT_24_31+0
CALL	_GPIO_Digital_Output+0
;MatrixRGB_FT90.c,63 :: 		_SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );
LDK.L	R2, #0
LDK.L	R1, #102
;MatrixRGB_FT90.c,61 :: 		SPIM1_Init_Advanced( _SPI_MASTER_CLK_RATIO_2, _SPI_CFG_PHASE_CAPTURE_FALLING |
LDK.L	R0, #16
;MatrixRGB_FT90.c,63 :: 		_SPI_CFG_FIFO_DISABLE, _SPI_SS_LINE_NONE );
CALL	_SPIM1_Init_Advanced+0
;MatrixRGB_FT90.c,65 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
LDA.x	R3, #AlignedAddress(GPIO_PIN1_bit+0)
BINS.L	R3, R3, #BitPos(GPIO_PIN1_bit+0)=0
STI.x	GPIO_PIN1_bit+0, #AlignedAddress(R3)
;MatrixRGB_FT90.c,66 :: 		MATRIXRGB_RST = 1;
LDA.x	R3, #AlignedAddress(GPIO_PIN1_bit+0)
BINS.L	R3, R3, #BitPos(GPIO_PIN1_bit+0)=1
STI.x	GPIO_PIN1_bit+0, #AlignedAddress(R3)
;MatrixRGB_FT90.c,67 :: 		Delay_ms(200);
LPM.L	R28, #6666665
NOP	
L_system_setup2:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup2
JMP	$+8
	#6666665
;MatrixRGB_FT90.c,69 :: 		matrixrgb_init( brightness, width, height );
BEXTU.L	R2, R14, #256
; height end address is: 56 (R14)
BEXTU.L	R1, R13, #256
; width end address is: 52 (R13)
BEXTU.L	R0, R12, #256
; brightness end address is: 48 (R12)
CALL	_matrixrgb_init+0
;MatrixRGB_FT90.c,70 :: 		Delay_ms(200);
LPM.L	R28, #6666665
NOP	
L_system_setup4:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup4
JMP	$+8
	#6666665
;MatrixRGB_FT90.c,72 :: 		}
L_end_system_setup:
RETURN	
; end of _system_setup
