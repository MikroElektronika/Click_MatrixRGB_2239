_main:
;MatrixRGB_Click_Application.c,10 :: 		void main()
SUB	SP, SP, #4
;MatrixRGB_Click_Application.c,12 :: 		uint16_t count = 0;
;MatrixRGB_Click_Application.c,13 :: 		uint16_t i, j  = 0;
;MatrixRGB_Click_Application.c,16 :: 		system_setup( 6, 1 );
MOVS	R1, #1
MOVS	R0, #6
BL	_system_setup+0
;MatrixRGB_Click_Application.c,17 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
ADD	R0, SP, #0
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Click_Application.c,18 :: 		matrixrgb_scroll_text_left( "Scrolling", my_color, 10,20 );
MOVW	R0, #lo_addr(?lstr1_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr1_MatrixRGB_Click_Application+0)
MOVS	R2, #20
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,157 :: 		while(1)
L_main0:
;MatrixRGB_Click_Application.c,168 :: 		matrixrgb_scroll_text_left( "Text Scrolling Across Screen", my_color, 10, 28 );
MOVW	R0, #lo_addr(?lstr2_MatrixRGB_Click_Application+0)
MOVT	R0, #hi_addr(?lstr2_MatrixRGB_Click_Application+0)
MOVS	R2, #28
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #4
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_scroll_text_left+0
ADD	SP, SP, #4
;MatrixRGB_Click_Application.c,176 :: 		}
IT	AL
BAL	L_main0
;MatrixRGB_Click_Application.c,177 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_system_setup:
;MatrixRGB_Click_Application.c,179 :: 		void system_setup( uint8_t width, uint8_t height )
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
;MatrixRGB_Click_Application.c,182 :: 		GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13); // Set Chip Select pin as output
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MatrixRGB_Click_Application.c,183 :: 		GPIO_Digital_Output( &GPIOC_BASE, _GPIO_PINMASK_2 ); // Set Reset pin to output
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;MatrixRGB_Click_Application.c,184 :: 		GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10);  // Set Ready to input
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;MatrixRGB_Click_Application.c,190 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;MatrixRGB_Click_Application.c,189 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_DISABLE | _SPI_SSI_1,
MOVW	R1, #260
;MatrixRGB_Click_Application.c,187 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |
MOVS	R0, #0
;MatrixRGB_Click_Application.c,190 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;MatrixRGB_Click_Application.c,192 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
MOVS	R3, #0
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;MatrixRGB_Click_Application.c,193 :: 		Delay_ms(20);
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
;MatrixRGB_Click_Application.c,194 :: 		MATRIXRGB_RST = 1;
MOVS	R3, #1
SXTB	R3, R3
MOVW	R2, #lo_addr(GPIOC_ODR+0)
MOVT	R2, #hi_addr(GPIOC_ODR+0)
STR	R3, [R2, #0]
;MatrixRGB_Click_Application.c,195 :: 		Delay_ms(200);
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
;MatrixRGB_Click_Application.c,197 :: 		matrixrgb_init( width, height );
UXTB	R1, R12
; height end address is: 48 (R12)
UXTB	R0, R11
; width end address is: 44 (R11)
BL	_matrixrgb_init+0
;MatrixRGB_Click_Application.c,198 :: 		Delay_ms(200);
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
;MatrixRGB_Click_Application.c,200 :: 		}
L_end_system_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _system_setup
