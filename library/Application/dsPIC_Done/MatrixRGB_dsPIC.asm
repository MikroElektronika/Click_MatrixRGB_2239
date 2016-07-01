
_main:
	MOV	#2048, W15
	MOV	#6142, W0
	MOV	WREG, 32
	MOV	#1, W0
	MOV	WREG, 52
	MOV	#4, W0
	IOR	68
	LNK	#4

;MatrixRGB_dsPIC.c,13 :: 		void main()
;MatrixRGB_dsPIC.c,15 :: 		uint8_t count = 3;
	PUSH	W10
	PUSH	W11
	PUSH	W12
	PUSH	W13
;MatrixRGB_dsPIC.c,16 :: 		uint8_t i     = 0;
;MatrixRGB_dsPIC.c,19 :: 		system_setup( 100, 2, 1 );
	MOV.B	#1, W12
	MOV.B	#2, W11
	MOV.B	#100, W10
	CALL	_system_setup
;MatrixRGB_dsPIC.c,21 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 40 );
	MOV.B	#40, W13
	MOV.B	#16, W12
	MOV.B	#64, W11
	MOV	#lo_addr(_MikroeBITMAP_bmp), W10
	CALL	_matrixrgb_scroll_img_right
;MatrixRGB_dsPIC.c,22 :: 		matrixrgb_scroll_off_scrn_down( 30 );
	MOV.B	#30, W10
	CALL	_matrixrgb_scroll_off_scrn_down
;MatrixRGB_dsPIC.c,23 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,24 :: 		matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
	MOV.B	#10, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr1_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,25 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	ADD	W14, #0, W0
	CLR	W13
	CLR	W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,26 :: 		matrixrgb_scroll_text_left( "R", my_color, 17, 1 );
	MOV.B	#1, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr2_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,27 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#1, W12
	CLR	W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,28 :: 		matrixrgb_scroll_text_left( "G", my_color, 17, 1 );
	MOV.B	#1, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr3_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,29 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,30 :: 		matrixrgb_scroll_text_left( "B ", my_color, 17, 1 );
	MOV.B	#1, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr4_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,31 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,32 :: 		matrixrgb_scroll_off_scrn_up( 30 );
	MOV.B	#30, W10
	CALL	_matrixrgb_scroll_off_scrn_up
;MatrixRGB_dsPIC.c,33 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	ADD	W14, #0, W0
	CLR	W13
	CLR	W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,34 :: 		matrixrgb_scroll_text_left( "By: ", my_color, 17, 4 );
	MOV.B	#4, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr5_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,35 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,36 :: 		matrixrgb_scroll_text_left( "Corey ", my_color, 17, 6 );
	MOV.B	#6, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr6_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,37 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,38 :: 		matrixrgb_scroll_text_left( "Lakey ", my_color, 17, 6 );
	MOV.B	#6, W12
	MOV.B	#17, W11
	MOV	#lo_addr(?lstr7_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,39 :: 		matrixrgb_scroll_off_scrn_left( 17 );
	MOV.B	#17, W10
	CALL	_matrixrgb_scroll_off_scrn_left
;MatrixRGB_dsPIC.c,40 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 25 );
	MOV.B	#25, W13
	MOV.B	#16, W12
	MOV.B	#64, W11
	MOV	#lo_addr(_MikroeBITMAP_bmp), W10
	CALL	_matrixrgb_scroll_img_right
;MatrixRGB_dsPIC.c,41 :: 		matrixrgb_scroll_off_scrn_right( 10 );
	MOV.B	#10, W10
	CALL	_matrixrgb_scroll_off_scrn_right
;MatrixRGB_dsPIC.c,43 :: 		while(1)
L_main0:
;MatrixRGB_dsPIC.c,45 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	MOV.B	#1, W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,46 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
	MOV.B	#10, W12
	MOV.B	#20, W11
	MOV	#lo_addr(?lstr8_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,47 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	ADD	W14, #0, W0
	CLR	W13
	CLR	W12
	MOV.B	#1, W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,48 :: 		matrixrgb_scroll_text_left( "R", my_color, 20, 1 );
	MOV.B	#1, W12
	MOV.B	#20, W11
	MOV	#lo_addr(?lstr9_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,49 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
	ADD	W14, #0, W0
	CLR	W13
	MOV.B	#1, W12
	CLR	W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,50 :: 		matrixrgb_scroll_text_left( "G", my_color, 20, 1 );
	MOV.B	#1, W12
	MOV.B	#20, W11
	MOV	#lo_addr(?lstr10_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,51 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
	ADD	W14, #0, W0
	MOV.B	#1, W13
	CLR	W12
	CLR	W11
	MOV	W0, W10
	CALL	_matrixrgb_set_color
;MatrixRGB_dsPIC.c,52 :: 		matrixrgb_scroll_text_left( "B", my_color, 20, 1 );
	MOV.B	#1, W12
	MOV.B	#20, W11
	MOV	#lo_addr(?lstr11_MatrixRGB_dsPIC), W10
	ADD	W14, #0, W0
	REPEAT	#1
	PUSH	[W0++]
	CALL	_matrixrgb_scroll_text_left
	SUB	#4, W15
;MatrixRGB_dsPIC.c,53 :: 		matrixrgb_refresh();
	CALL	_matrixrgb_refresh
;MatrixRGB_dsPIC.c,54 :: 		}
	GOTO	L_main0
;MatrixRGB_dsPIC.c,55 :: 		}
L_end_main:
	POP	W13
	POP	W12
	POP	W11
	POP	W10
	ULNK
L__main_end_loop:
	BRA	L__main_end_loop
; end of _main

_system_setup:

;MatrixRGB_dsPIC.c,57 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
;MatrixRGB_dsPIC.c,59 :: 		MATRIXRGB_CS_DIR = 0;
	PUSH	W13
	BCLR	TRISC2_bit, BitPos(TRISC2_bit+0)
;MatrixRGB_dsPIC.c,60 :: 		MATRIXRGB_READY_DIR = 1;
	BSET	TRISE7_bit, BitPos(TRISE7_bit+0)
;MatrixRGB_dsPIC.c,61 :: 		MATRIXRGB_RST_DIR = 0;
	BCLR	TRISC1_bit, BitPos(TRISC1_bit+0)
;MatrixRGB_dsPIC.c,65 :: 		_SPI_DATA_SAMPLE_MIDDLE, _SPI_CLK_IDLE_HIGH, _SPI_ACTIVE_2_IDLE);
	PUSH	W12
	PUSH.D	W10
	MOV	#3, W13
	MOV	#28, W12
	MOV	#1024, W11
	MOV	#32, W10
	CLR	W0
	PUSH	W0
	MOV	#64, W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CLR	W0
	PUSH	W0
	CALL	_SPI1_Init_Advanced
	SUB	#8, W15
	POP.D	W10
	POP	W12
;MatrixRGB_dsPIC.c,68 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
	BCLR	RC1_bit, BitPos(RC1_bit+0)
;MatrixRGB_dsPIC.c,69 :: 		MATRIXRGB_RST = 1;
	BSET	RC1_bit, BitPos(RC1_bit+0)
;MatrixRGB_dsPIC.c,70 :: 		Delay_ms(200);
	MOV	#5, W8
	MOV	#4523, W7
L_system_setup2:
	DEC	W7
	BRA NZ	L_system_setup2
	DEC	W8
	BRA NZ	L_system_setup2
;MatrixRGB_dsPIC.c,72 :: 		matrixrgb_init( brightness, width, height );
	CALL	_matrixrgb_init
;MatrixRGB_dsPIC.c,73 :: 		Delay_ms(200);
	MOV	#5, W8
	MOV	#4523, W7
L_system_setup4:
	DEC	W7
	BRA NZ	L_system_setup4
	DEC	W8
	BRA NZ	L_system_setup4
;MatrixRGB_dsPIC.c,75 :: 		}
L_end_system_setup:
	POP	W13
	RETURN
; end of _system_setup
