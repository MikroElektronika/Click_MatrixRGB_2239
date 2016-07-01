_main:
;MatrixRGB_Click_Application.c,10 :: 		void main()
SUB	SP, SP, #4
;MatrixRGB_Click_Application.c,12 :: 		uint16_t count = 0;
;MatrixRGB_Click_Application.c,13 :: 		uint8_t i     = 0;
;MatrixRGB_Click_Application.c,16 :: 		system_setup( 2, 2 );
MOVS	R1, #2
MOVS	R0, #2
BL	_system_setup+0
;MatrixRGB_Click_Application.c,18 :: 		matrixrgb_scroll_img_left( MikroE_Sign_bmp, 32, 32, 25 );
MOVS	R3, #25
MOVS	R2, #32
MOVS	R1, #32
MOVW	R0, #lo_addr(_MikroE_Sign_bmp+0)
MOVT	R0, #hi_addr(_MikroE_Sign_bmp+0)
BL	_matrixrgb_scroll_img_left+0
;MatrixRGB_Click_Application.c,19 :: 		matrixrgb_scroll_off_scrn_down( 25 );
MOVS	R0, #25
BL	_matrixrgb_scroll_off_scrn_down+0
;MatrixRGB_Click_Application.c,20 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,21 :: 		matrixrgb_scroll_text_right( "Matrix ", my_color, 17, 10 );
MOVW	R0, #lo_addr(?lstr1_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr1_MatrixRGB_Click_Application+0)
MOVS	R2, #10
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_right+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,22 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD	R0, SP, #0
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,23 :: 		matrixrgb_scroll_text_left( "R", my_color, 17, 1 );
MOVW	R0, #lo_addr(?lstr2_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr2_MatrixRGB_Click_Application+0)
MOVS	R2, #1
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,24 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
ADD	R0, SP, #0
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,25 :: 		matrixrgb_scroll_text_left( "G", my_color, 17, 1 );
MOVW	R0, #lo_addr(?lstr3_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr3_MatrixRGB_Click_Application+0)
MOVS	R2, #1
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,26 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,27 :: 		matrixrgb_scroll_text_left( "B ", my_color, 17, 1 );
MOVW	R0, #lo_addr(?lstr4_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr4_MatrixRGB_Click_Application+0)
MOVS	R2, #1
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,28 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,29 :: 		matrixrgb_scroll_off_scrn_up( 30 );
MOVS	R0, #30
BL	_matrixrgb_scroll_off_scrn_up+0
;MatrixRGB_Click_Application.c,30 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD	R0, SP, #0
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,31 :: 		matrixrgb_scroll_text_left( "By: ", my_color, 17, 4 );
MOVW	R0, #lo_addr(?lstr5_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr5_MatrixRGB_Click_Application+0)
MOVS	R2, #4
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,32 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,33 :: 		matrixrgb_scroll_text_left( "Corey ", my_color, 17, 6 );
MOVW	R0, #lo_addr(?lstr6_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr6_MatrixRGB_Click_Application+0)
MOVS	R2, #6
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,34 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,35 :: 		matrixrgb_scroll_text_left( "Lakey ", my_color, 17, 6 );
MOVW	R0, #lo_addr(?lstr7_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr7_MatrixRGB_Click_Application+0)
MOVS	R2, #6
MOVS	R1, #17
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,36 :: 		matrixrgb_scroll_off_scrn_left( 17 );
MOVS	R0, #17
BL	_matrixrgb_scroll_off_scrn_left+0
;MatrixRGB_Click_Application.c,37 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 25 );
MOVS	R3, #25
MOVS	R2, #16
MOVS	R1, #64
MOVW	R0, #lo_addr(_MikroeBITMAP_bmp+0)
MOVT	R0, #hi_addr(_MikroeBITMAP_bmp+0)
BL	_matrixrgb_scroll_img_right+0
;MatrixRGB_Click_Application.c,38 :: 		matrixrgb_scroll_off_scrn_right( 10 );
MOVS	R0, #10
BL	_matrixrgb_scroll_off_scrn_right+0
;MatrixRGB_Click_Application.c,40 :: 		while(1)
L_main0:
;MatrixRGB_Click_Application.c,49 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,50 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 10, 10 );
MOVW	R0, #lo_addr(?lstr8_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr8_MatrixRGB_Click_Application+0)
MOVS	R2, #10
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,51 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD	R0, SP, #0
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,52 :: 		matrixrgb_scroll_text_left( "R", my_color, 10, 1 );
MOVW	R0, #lo_addr(?lstr9_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr9_MatrixRGB_Click_Application+0)
MOVS	R2, #1
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,53 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
ADD	R0, SP, #0
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,54 :: 		matrixrgb_scroll_text_left( "G", my_color, 10, 1 );
MOVW	R0, #lo_addr(?lstr10_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr10_MatrixRGB_Click_Application+0)
MOVS	R2, #1
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,55 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,56 :: 		matrixrgb_scroll_text_left( "B", my_color, 10, 1 );
MOVW	R0, #lo_addr(?lstr11_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr11_MatrixRGB_Click_Application+0)
MOVS	R2, #1
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,57 :: 		}
IT	AL
BAL	L_main0
;MatrixRGB_Click_Application.c,58 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_system_setup:
;MatrixRGB_Click_Application.c,60 :: 		void system_setup( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
UXTB	R11, R0
UXTB	R12, R1
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 44 (R11)
; height start address is: 48 (R12)
;MatrixRGB_Click_Application.c,63 :: 		GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13); // Set Chip Select pin as output
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MatrixRGB_Click_Application.c,64 :: 		GPIO_Digital_Output( &GPIOC_BASE, _GPIO_PINMASK_2 ); // Set Reset pin to output
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;MatrixRGB_Click_Application.c,65 :: 		GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10);  // Set Ready to input
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;MatrixRGB_Click_Application.c,71 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;MatrixRGB_Click_Application.c,70 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_DISABLE | _SPI_SSI_1,
MOVW	R1, #260
;MatrixRGB_Click_Application.c,68 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;MatrixRGB_Click_Application.c,71 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;MatrixRGB_Click_Application.c,73 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;MatrixRGB_Click_Application.c,74 :: 		Delay_ms(20);
MOVW	R7, #43391
MOVT	R7, #3
NOP
NOP
L_system_setup2:
SUBS	R7, R7, #1
BNE	L_system_setup2
NOP
NOP
NOP
;MatrixRGB_Click_Application.c,75 :: 		MATRIXRGB_RST = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;MatrixRGB_Click_Application.c,76 :: 		Delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_system_setup4:
SUBS	R7, R7, #1
BNE	L_system_setup4
NOP
NOP
NOP
;MatrixRGB_Click_Application.c,78 :: 		matrixrgb_init( width, height );
UXTB	R1, R12
; height end address is: 48 (R12)
UXTB	R0, R11
; width end address is: 44 (R11)
BL	_matrixrgb_init+0
;MatrixRGB_Click_Application.c,79 :: 		Delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_system_setup6:
SUBS	R7, R7, #1
BNE	L_system_setup6
NOP
NOP
NOP
;MatrixRGB_Click_Application.c,81 :: 		}
L_end_system_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_setup
