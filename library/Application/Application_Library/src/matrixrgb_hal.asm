_matrixrgb_hal_cs_high:
;matrixrgb_hal.c,80 :: 		void matrixrgb_hal_cs_high()
;matrixrgb_hal.c,82 :: 		MATRIXRGB_CS = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(MATRIXRGB_CS+0)
MOVT	R0, #hi_addr(MATRIXRGB_CS+0)
STR	R1, [R0, #0]
;matrixrgb_hal.c,83 :: 		}
L_end_matrixrgb_hal_cs_high:
BX	LR
; end of _matrixrgb_hal_cs_high
_matrixrgb_hal_cs_low:
;matrixrgb_hal.c,85 :: 		void matrixrgb_hal_cs_low()
;matrixrgb_hal.c,87 :: 		MATRIXRGB_CS = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(MATRIXRGB_CS+0)
MOVT	R0, #hi_addr(MATRIXRGB_CS+0)
STR	R1, [R0, #0]
;matrixrgb_hal.c,88 :: 		}
L_end_matrixrgb_hal_cs_low:
BX	LR
; end of _matrixrgb_hal_cs_low
_matrixrgb_hal_init:
;matrixrgb_hal.c,90 :: 		void matrixrgb_hal_init()
SUB	SP, SP, #4
STR	LR, [SP, #0]
;matrixrgb_hal.c,97 :: 		write_spi_p             = SPI_Wr_Ptr;
MOVW	R0, #lo_addr(_SPI_Wr_Ptr+0)
MOVT	R0, #hi_addr(_SPI_Wr_Ptr+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(matrixrgb_hal_write_spi_p+0)
MOVT	R0, #hi_addr(matrixrgb_hal_write_spi_p+0)
STR	R1, [R0, #0]
;matrixrgb_hal.c,98 :: 		read_spi_p              = SPI_Rd_Ptr;
MOVW	R0, #lo_addr(_SPI_Rd_Ptr+0)
MOVT	R0, #hi_addr(_SPI_Rd_Ptr+0)
LDR	R1, [R0, #0]
MOVW	R0, #lo_addr(matrixrgb_hal_read_spi_p+0)
MOVT	R0, #hi_addr(matrixrgb_hal_read_spi_p+0)
STR	R1, [R0, #0]
;matrixrgb_hal.c,111 :: 		matrixrgb_hal_cs_high();
BL	_matrixrgb_hal_cs_high+0
;matrixrgb_hal.c,113 :: 		}
L_end_matrixrgb_hal_init:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _matrixrgb_hal_init
_matrixrgb_hal_write:
;matrixrgb_hal.c,116 :: 		uint16_t count )
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #4]
STRH	R1, [SP, #8]
;matrixrgb_hal.c,119 :: 		while( MATRIXRGB_READY != 1 )
L_matrixrgb_hal_write0:
MOVW	R3, #lo_addr(MATRIXRGB_READY+0)
MOVT	R3, #hi_addr(MATRIXRGB_READY+0)
LDR	R2, [R3, #0]
CMP	R2, #0
IT	NE
BNE	L_matrixrgb_hal_write1
;matrixrgb_hal.c,122 :: 		}  //Wait till slave is ready
IT	AL
BAL	L_matrixrgb_hal_write0
L_matrixrgb_hal_write1:
;matrixrgb_hal.c,124 :: 		while( count-- )
L_matrixrgb_hal_write2:
LDRH	R3, [SP, #8]
LDRH	R2, [SP, #8]
SUBS	R2, R2, #1
STRH	R2, [SP, #8]
CMP	R3, #0
IT	EQ
BEQ	L_matrixrgb_hal_write3
;matrixrgb_hal.c,126 :: 		matrixrgb_hal_cs_low();
BL	_matrixrgb_hal_cs_low+0
;matrixrgb_hal.c,127 :: 		write_spi_p( *( buffer++ ) );
LDR	R2, [SP, #4]
LDRB	R2, [R2, #0]
UXTB	R4, R2
UXTH	R0, R4
MOVW	R4, #lo_addr(matrixrgb_hal_write_spi_p+0)
MOVT	R4, #hi_addr(matrixrgb_hal_write_spi_p+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R2, [SP, #4]
ADDS	R2, R2, #1
STR	R2, [SP, #4]
;matrixrgb_hal.c,128 :: 		matrixrgb_hal_cs_high();
BL	_matrixrgb_hal_cs_high+0
;matrixrgb_hal.c,129 :: 		}
IT	AL
BAL	L_matrixrgb_hal_write2
L_matrixrgb_hal_write3:
;matrixrgb_hal.c,131 :: 		}
L_end_matrixrgb_hal_write:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _matrixrgb_hal_write
_matrixrgb_hal_read:
;matrixrgb_hal.c,134 :: 		uint16_t count )
SUB	SP, SP, #12
STR	LR, [SP, #0]
STR	R0, [SP, #4]
STRH	R1, [SP, #8]
;matrixrgb_hal.c,136 :: 		while( count-- )
L_matrixrgb_hal_read4:
LDRH	R3, [SP, #8]
LDRH	R2, [SP, #8]
SUBS	R2, R2, #1
STRH	R2, [SP, #8]
CMP	R3, #0
IT	EQ
BEQ	L_matrixrgb_hal_read5
;matrixrgb_hal.c,137 :: 		*( buffer++ ) = read_spi_p( DUMMY_BYTE );
MOVS	R0, #0
MOVW	R4, #lo_addr(matrixrgb_hal_read_spi_p+0)
MOVT	R4, #hi_addr(matrixrgb_hal_read_spi_p+0)
LDR	R4, [R4, #0]
BLX	R4
LDR	R2, [SP, #4]
STRB	R0, [R2, #0]
LDR	R2, [SP, #4]
ADDS	R2, R2, #1
STR	R2, [SP, #4]
IT	AL
BAL	L_matrixrgb_hal_read4
L_matrixrgb_hal_read5:
;matrixrgb_hal.c,138 :: 		}
L_end_matrixrgb_hal_read:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _matrixrgb_hal_read
