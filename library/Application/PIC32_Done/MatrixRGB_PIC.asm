_main:
;MatrixRGB_PIC.c,14 :: 		void main()
ADDIU	SP, SP, -4
;MatrixRGB_PIC.c,17 :: 		uint8_t count = 3;
;MatrixRGB_PIC.c,18 :: 		uint8_t i     = 0;
;MatrixRGB_PIC.c,19 :: 		system_setup( 2, 1 );
ORI	R26, R0, 1
ORI	R25, R0, 2
JAL	_system_setup+0
NOP	
;MatrixRGB_PIC.c,21 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 40 );
ORI	R28, R0, 40
ORI	R27, R0, 16
ORI	R26, R0, 64
LUI	R25, hi_addr(_MikroeBITMAP_bmp+0)
ORI	R25, R25, lo_addr(_MikroeBITMAP_bmp+0)
JAL	_matrixrgb_scroll_img_right+0
NOP	
;MatrixRGB_PIC.c,22 :: 		matrixrgb_scroll_off_scrn_down( 30 );
ORI	R25, R0, 30
JAL	_matrixrgb_scroll_off_scrn_down+0
NOP	
;MatrixRGB_PIC.c,23 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
ORI	R27, R0, 1
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,24 :: 		matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
ORI	R27, R0, 10
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr1_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr1_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,25 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADDIU	R2, SP, 0
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,26 :: 		matrixrgb_scroll_text_left( "R", my_color, 17, 1 );
ORI	R27, R0, 1
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr2_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr2_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,27 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
ADDIU	R2, SP, 0
MOVZ	R28, R0, R0
ORI	R27, R0, 1
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,28 :: 		matrixrgb_scroll_text_left( "G", my_color, 17, 1 );
ORI	R27, R0, 1
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr3_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr3_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,29 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,30 :: 		matrixrgb_scroll_text_left( "B ", my_color, 17, 1 );
ORI	R27, R0, 1
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr4_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr4_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,31 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
ORI	R27, R0, 1
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,32 :: 		matrixrgb_scroll_off_scrn_up( 30 );
ORI	R25, R0, 30
JAL	_matrixrgb_scroll_off_scrn_up+0
NOP	
;MatrixRGB_PIC.c,33 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADDIU	R2, SP, 0
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,34 :: 		matrixrgb_scroll_text_left( "By: ", my_color, 17, 4 );
ORI	R27, R0, 4
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr5_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr5_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,35 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
ORI	R27, R0, 1
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,36 :: 		matrixrgb_scroll_text_left( "Corey ", my_color, 17, 6 );
ORI	R27, R0, 6
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr6_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr6_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,37 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,38 :: 		matrixrgb_scroll_text_left( "Lakey ", my_color, 17, 6 );
ORI	R27, R0, 6
ORI	R26, R0, 17
LUI	R25, hi_addr(?lstr7_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr7_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,39 :: 		matrixrgb_scroll_off_scrn_left( 17 );
ORI	R25, R0, 17
JAL	_matrixrgb_scroll_off_scrn_left+0
NOP	
;MatrixRGB_PIC.c,40 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 25 );
ORI	R28, R0, 25
ORI	R27, R0, 16
ORI	R26, R0, 64
LUI	R25, hi_addr(_MikroeBITMAP_bmp+0)
ORI	R25, R25, lo_addr(_MikroeBITMAP_bmp+0)
JAL	_matrixrgb_scroll_img_right+0
NOP	
;MatrixRGB_PIC.c,41 :: 		matrixrgb_scroll_off_scrn_right( 10 );
ORI	R25, R0, 10
JAL	_matrixrgb_scroll_off_scrn_right+0
NOP	
;MatrixRGB_PIC.c,43 :: 		while(1)
L_main0:
;MatrixRGB_PIC.c,45 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
ORI	R27, R0, 1
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,46 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
ORI	R27, R0, 10
ORI	R26, R0, 20
LUI	R25, hi_addr(?lstr8_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr8_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,47 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADDIU	R2, SP, 0
MOVZ	R28, R0, R0
MOVZ	R27, R0, R0
ORI	R26, R0, 1
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,48 :: 		matrixrgb_scroll_text_left( "R", my_color, 20, 1 );
ORI	R27, R0, 1
ORI	R26, R0, 20
LUI	R25, hi_addr(?lstr9_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr9_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,49 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
ADDIU	R2, SP, 0
MOVZ	R28, R0, R0
ORI	R27, R0, 1
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,50 :: 		matrixrgb_scroll_text_left( "G", my_color, 20, 1 );
ORI	R27, R0, 1
ORI	R26, R0, 20
LUI	R25, hi_addr(?lstr10_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr10_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,51 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADDIU	R2, SP, 0
ORI	R28, R0, 1
MOVZ	R27, R0, R0
MOVZ	R26, R0, R0
MOVZ	R25, R2, R0
JAL	_matrixrgb_set_color+0
NOP	
;MatrixRGB_PIC.c,52 :: 		matrixrgb_scroll_text_left( "B", my_color, 20, 1 );
ORI	R27, R0, 1
ORI	R26, R0, 20
LUI	R25, hi_addr(?lstr11_MatrixRGB_PIC+0)
ORI	R25, R25, lo_addr(?lstr11_MatrixRGB_PIC+0)
ADDIU	SP, SP, -4
ADDIU	R24, SP, 4
ADDIU	R23, SP, 0
ADDIU	R22, R23, 3
JAL	___CC2DW+0
NOP	
JAL	_matrixrgb_scroll_text_left+0
NOP	
ADDIU	SP, SP, 4
;MatrixRGB_PIC.c,53 :: 		matrixrgb_refresh();
JAL	_matrixrgb_refresh+0
NOP	
;MatrixRGB_PIC.c,54 :: 		}
J	L_main0
NOP	
;MatrixRGB_PIC.c,55 :: 		}
L_end_main:
L__main_end_loop:
J	L__main_end_loop
NOP	
; end of _main
_system_setup:
;MatrixRGB_PIC.c,57 :: 		void system_setup( uint8_t width, uint8_t height )
ADDIU	SP, SP, -16
SW	RA, 0(SP)
;MatrixRGB_PIC.c,59 :: 		MATRIXRGB_CS_DIR = 0;
SW	R27, 4(SP)
SW	R28, 8(SP)
LUI	R2, BitMask(TRISC2_bit+0)
ORI	R2, R2, BitMask(TRISC2_bit+0)
_SX	
;MatrixRGB_PIC.c,60 :: 		MATRIXRGB_READY_DIR = 1;
LUI	R2, BitMask(TRISE8_bit+0)
ORI	R2, R2, BitMask(TRISE8_bit+0)
_SX	
;MatrixRGB_PIC.c,61 :: 		MATRIXRGB_RST_DIR = 0;
LUI	R2, BitMask(TRISC1_bit+0)
ORI	R2, R2, BitMask(TRISC1_bit+0)
_SX	
;MatrixRGB_PIC.c,64 :: 		SPI3_Init_Advanced( _SPI_MASTER, _SPI_8_BIT, 2, _SPI_SS_DISABLE,
SB	R26, 12(SP)
SB	R25, 13(SP)
MOVZ	R28, R0, R0
ORI	R27, R0, 2
MOVZ	R26, R0, R0
ORI	R25, R0, 32
;MatrixRGB_PIC.c,66 :: 		_SPI_IDLE_2_ACTIVE );
ORI	R2, R0, 256
ADDIU	SP, SP, -8
SH	R2, 4(SP)
;MatrixRGB_PIC.c,65 :: 		_SPI_DATA_SAMPLE_END, _SPI_CLK_IDLE_LOW,
SH	R0, 2(SP)
ORI	R2, R0, 512
SH	R2, 0(SP)
;MatrixRGB_PIC.c,66 :: 		_SPI_IDLE_2_ACTIVE );
JAL	_SPI3_Init_Advanced+0
NOP	
ADDIU	SP, SP, 8
;MatrixRGB_PIC.c,64 :: 		SPI3_Init_Advanced( _SPI_MASTER, _SPI_8_BIT, 2, _SPI_SS_DISABLE,
LBU	R25, 13(SP)
LBU	R26, 12(SP)
;MatrixRGB_PIC.c,68 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
LUI	R2, BitMask(RC1_bit+0)
ORI	R2, R2, BitMask(RC1_bit+0)
_SX	
;MatrixRGB_PIC.c,69 :: 		MATRIXRGB_RST = 1;
LUI	R2, BitMask(RC1_bit+0)
ORI	R2, R2, BitMask(RC1_bit+0)
_SX	
;MatrixRGB_PIC.c,70 :: 		Delay_ms(200);
LUI	R24, 8
ORI	R24, R24, 9044
L_system_setup2:
ADDIU	R24, R24, -1
BNE	R24, R0, L_system_setup2
NOP	
NOP	
NOP	
;MatrixRGB_PIC.c,72 :: 		matrixrgb_init( width, height );
JAL	_matrixrgb_init+0
NOP	
;MatrixRGB_PIC.c,73 :: 		Delay_ms(200);
LUI	R24, 8
ORI	R24, R24, 9044
L_system_setup4:
ADDIU	R24, R24, -1
BNE	R24, R0, L_system_setup4
NOP	
NOP	
NOP	
;MatrixRGB_PIC.c,75 :: 		}
L_end_system_setup:
LW	R28, 8(SP)
LW	R27, 4(SP)
LW	RA, 0(SP)
ADDIU	SP, SP, 16
JR	RA
NOP	
; end of _system_setup
