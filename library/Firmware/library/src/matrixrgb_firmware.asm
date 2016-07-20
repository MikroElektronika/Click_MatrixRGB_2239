matrixrgb_firmware_get_coord_index:
;matrixrgb_firmware.c,97 :: 		static uint16_t get_coord_index( uint16_t row, uint16_t col )
; col start address is: 4 (R1)
; row start address is: 0 (R0)
LINK	LR, #4
STI.S	SP, #0, R1
BEXTU.L	R1, R0, #0
LDI.S	R0, SP, #0
; col end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 4 (R1)
; col start address is: 0 (R0)
;matrixrgb_firmware.c,99 :: 		uint16_t incrementer = 0;
;matrixrgb_firmware.c,100 :: 		uint16_t starter     = 0;
;matrixrgb_firmware.c,101 :: 		uint16_t buffer      = 0;
;matrixrgb_firmware.c,102 :: 		uint16_t new         = 0;
;matrixrgb_firmware.c,103 :: 		uint16_t mult        = 0;
;matrixrgb_firmware.c,104 :: 		uint16_t new_col     = 0;
;matrixrgb_firmware.c,107 :: 		if ( row >= 32 )
CMP.S	R1, #32
JMPC	R30, C, #1, L_matrixrgb_firmware_get_coord_index290
;matrixrgb_firmware.c,109 :: 		new_col = row / 32;
BEXTU.L	R2, R1, #0
LSHR.L	R3, R2, #5
BEXTU.L	R3, R3, #0
;matrixrgb_firmware.c,110 :: 		new_col *= ( pan_width * 32 );
LDA.B	R2, _pan_width+0
ASHL.L	R2, R2, #5
BEXTS.L	R2, R2, #0
MUL.L	R3, R3, R2
BEXTU.L	R3, R3, #0
;matrixrgb_firmware.c,111 :: 		row = row % 32;
AND.L	R1, R1, #31
BEXTU.L	R1, R1, #0
;matrixrgb_firmware.c,112 :: 		col += new_col;
ADD.L	R0, R0, R3
BEXTU.L	R0, R0, #0
; col end address is: 0 (R0)
; row end address is: 4 (R1)
;matrixrgb_firmware.c,113 :: 		}
JMP	L_matrixrgb_firmware_get_coord_index0
L_matrixrgb_firmware_get_coord_index290:
;matrixrgb_firmware.c,107 :: 		if ( row >= 32 )
;matrixrgb_firmware.c,113 :: 		}
L_matrixrgb_firmware_get_coord_index0:
;matrixrgb_firmware.c,114 :: 		incrementer = ( row / 8 );
; col start address is: 0 (R0)
; row start address is: 4 (R1)
BEXTU.L	R2, R1, #0
LSHR.L	R2, R2, #3
BEXTU.L	R2, R2, #0
; incrementer start address is: 12 (R3)
BEXTU.L	R3, R2, #0
;matrixrgb_firmware.c,115 :: 		if ( ( ( incrementer % 2 ) == 0 ) || incrementer == 0 )
AND.L	R2, R2, #1
CMP.S	R2, #0
JMPC	R30, Z, #1, L_matrixrgb_firmware_get_coord_index289
CMP.S	R3, #0
JMPC	R30, Z, #1, L_matrixrgb_firmware_get_coord_index288
; incrementer end address is: 12 (R3)
JMP	L_matrixrgb_firmware_get_coord_index3
L_matrixrgb_firmware_get_coord_index289:
L_matrixrgb_firmware_get_coord_index288:
;matrixrgb_firmware.c,116 :: 		incrementer = 32;
; incrementer start address is: 16 (R4)
LDK.L	R4, #32
; incrementer end address is: 16 (R4)
JMP	L_matrixrgb_firmware_get_coord_index4
L_matrixrgb_firmware_get_coord_index3:
;matrixrgb_firmware.c,118 :: 		incrementer = 0;
; incrementer start address is: 16 (R4)
LDK.L	R4, #0
; incrementer end address is: 16 (R4)
L_matrixrgb_firmware_get_coord_index4:
;matrixrgb_firmware.c,119 :: 		starter = ( col / 32 ) * 32;
; incrementer start address is: 16 (R4)
BEXTU.L	R2, R0, #0
LSHR.L	R2, R2, #5
BEXTU.L	R2, R2, #0
ASHL.L	R2, R2, #5
; starter start address is: 20 (R5)
BEXTU.L	R5, R2, #0
;matrixrgb_firmware.c,120 :: 		if ( row < 16 )
CMP.S	R1, #16
JMPC	R30, C, #0, L_matrixrgb_firmware_get_coord_index5
;matrixrgb_firmware.c,121 :: 		new = 0;
; new start address is: 24 (R6)
LDK.L	R6, #0
; new end address is: 24 (R6)
JMP	L_matrixrgb_firmware_get_coord_index6
L_matrixrgb_firmware_get_coord_index5:
;matrixrgb_firmware.c,123 :: 		new = shift_reg * 8;
LDA.L	R2, _shift_reg+0
ASHL.L	R2, R2, #3
; new start address is: 24 (R6)
BEXTU.L	R6, R2, #0
; new end address is: 24 (R6)
L_matrixrgb_firmware_get_coord_index6:
;matrixrgb_firmware.c,124 :: 		mult = ( row % 8 ) * shift_reg;
; new start address is: 24 (R6)
AND.L	R3, R1, #7
BEXTU.L	R3, R3, #0
; row end address is: 4 (R1)
LDA.L	R2, _shift_reg+0
MUL.L	R2, R3, R2
;matrixrgb_firmware.c,125 :: 		buffer = incrementer + mult + new + starter + col;
BEXTU.L	R2, R2, #0
ADD.L	R2, R4, R2
BEXTU.L	R2, R2, #0
; incrementer end address is: 16 (R4)
ADD.L	R2, R2, R6
BEXTU.L	R2, R2, #0
; new end address is: 24 (R6)
ADD.L	R2, R2, R5
BEXTU.L	R2, R2, #0
; starter end address is: 20 (R5)
ADD.L	R2, R2, R0
; col end address is: 0 (R0)
;matrixrgb_firmware.c,127 :: 		return buffer;
BEXTU.L	R0, R2, #0
;matrixrgb_firmware.c,128 :: 		}
L_end_get_coord_index:
UNLINK	LR
RETURN	
; end of matrixrgb_firmware_get_coord_index
_setup_command:
;matrixrgb_firmware.c,130 :: 		void setup_command( void )
;matrixrgb_firmware.c,132 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,133 :: 		system_setup( firm_buffer[0], firm_buffer[1] );
LDA.B	R1, _firm_buffer+1
LDA.B	R0, _firm_buffer+0
CALL	_system_setup+0
;matrixrgb_firmware.c,134 :: 		}
L_end_setup_command:
RETURN	
; end of _setup_command
_write_text_command:
;matrixrgb_firmware.c,136 :: 		void write_text_command( void )
LINK	LR, #260
;matrixrgb_firmware.c,138 :: 		uint8_t text[256] = { 0 };
ADD.L	R27, SP, #3
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSwrite_text_command_text_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,139 :: 		char *ptr = text;
ADD.L	R0, SP, #3
; ptr start address is: 12 (R3)
MOVE.L	R3, R0
;matrixrgb_firmware.c,140 :: 		uint8_t i = 0;
;matrixrgb_firmware.c,141 :: 		uint8_t size = 0;
;matrixrgb_firmware.c,148 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,149 :: 		size = firm_buffer[0];
; size start address is: 16 (R4)
LDA.B	R4, _firm_buffer+0
;matrixrgb_firmware.c,150 :: 		receive_data( &firm_buffer, 3 );
LDK.L	R1, #3
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,151 :: 		my_color.red   = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	SP, #0, R0
;matrixrgb_firmware.c,152 :: 		my_color.green = firm_buffer[1];
LDA.B	R0, _firm_buffer+1
STI.B	SP, #1, R0
;matrixrgb_firmware.c,153 :: 		my_color.blue  = firm_buffer[2];
LDA.B	R0, _firm_buffer+2
STI.B	SP, #2, R0
;matrixrgb_firmware.c,154 :: 		receive_data( &firm_buffer, 4 );
LDK.L	R1, #4
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,159 :: 		start_col = col_hi;
; start_col start address is: 4 (R1)
LDA.B	R1, _firm_buffer+1
;matrixrgb_firmware.c,160 :: 		start_col = ( start_col << 8 ) | col_lo;
BEXTU.L	R0, R1, #0
; start_col end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
OR.L	R0, R1, R0
; start_col start address is: 8 (R2)
BEXTU.L	R2, R0, #0
;matrixrgb_firmware.c,161 :: 		start_row = row_hi;
; start_row start address is: 4 (R1)
LDA.B	R1, _firm_buffer+3
;matrixrgb_firmware.c,162 :: 		start_row = ( start_row << 8 ) | row_lo;
BEXTU.L	R0, R1, #0
; start_row end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+2
OR.L	R0, R1, R0
; start_row start address is: 0 (R0)
;matrixrgb_firmware.c,164 :: 		for ( i = 0; i < size; i++ )
; i start address is: 24 (R6)
LDK.L	R6, #0
; ptr end address is: 12 (R3)
; size end address is: 16 (R4)
; start_col end address is: 8 (R2)
; start_row end address is: 0 (R0)
; i end address is: 24 (R6)
MOVE.L	R7, R3
BEXTU.L	R3, R0, #0
BEXTU.L	R5, R4, #256
BEXTU.L	R4, R2, #0
L_write_text_command7:
; i start address is: 24 (R6)
; start_row start address is: 12 (R3)
; start_col start address is: 16 (R4)
; size start address is: 20 (R5)
; ptr start address is: 28 (R7)
CMP.B	R6, R5
JMPC	R30, C, #0, L_write_text_command8
;matrixrgb_firmware.c,166 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,167 :: 		*ptr++ = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	R7, #0, R0
ADD.L	R7, R7, #1
;matrixrgb_firmware.c,164 :: 		for ( i = 0; i < size; i++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,168 :: 		}
; size end address is: 20 (R5)
; ptr end address is: 28 (R7)
; i end address is: 24 (R6)
JMP	L_write_text_command7
L_write_text_command8:
;matrixrgb_firmware.c,169 :: 		write_text( text, my_color, start_row, start_col );
ADD.L	R0, SP, #3
BEXTU.L	R2, R4, #0
; start_col end address is: 16 (R4)
BEXTU.L	R1, R3, #0
; start_row end address is: 12 (R3)
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_write_text+0
ADD.L	SP, SP, #4
;matrixrgb_firmware.c,171 :: 		}
L_end_write_text_command:
UNLINK	LR
RETURN	
; end of _write_text_command
_my_img_load:
;matrixrgb_firmware.c,173 :: 		void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
; i start address is: 44 (R11)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
LINK	LR, #4
;matrixrgb_firmware.c,179 :: 		for ( i = 0; i < height; i++ )
;matrixrgb_firmware.c,173 :: 		void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
;matrixrgb_firmware.c,179 :: 		for ( i = 0; i < height; i++ )
;matrixrgb_firmware.c,173 :: 		void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
; i end address is: 44 (R11)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
; width start address is: 4 (R1)
; height start address is: 8 (R2)
;matrixrgb_firmware.c,179 :: 		for ( i = 0; i < height; i++ )
; i start address is: 44 (R11)
LDK.L	R11, #0
; width end address is: 4 (R1)
; height end address is: 8 (R2)
; i end address is: 44 (R11)
BEXTU.L	R8, R1, #256
BEXTU.L	R9, R2, #256
L_my_img_load10:
; i start address is: 44 (R11)
; height start address is: 36 (R9)
; width start address is: 32 (R8)
CMP.S	R11, R9
JMPC	R30, GTE, #1, L_my_img_load11
;matrixrgb_firmware.c,181 :: 		cnt = 0;
; cnt start address is: 40 (R10)
LDK.L	R10, #0
;matrixrgb_firmware.c,182 :: 		for ( j = 0; j < width; j++ )
; j start address is: 48 (R12)
LDK.L	R12, #0
; width end address is: 32 (R8)
; height end address is: 36 (R9)
; j end address is: 48 (R12)
; i end address is: 44 (R11)
L_my_img_load13:
; j start address is: 48 (R12)
; cnt start address is: 40 (R10)
; cnt end address is: 40 (R10)
; width start address is: 32 (R8)
; height start address is: 36 (R9)
; i start address is: 44 (R11)
CMP.S	R12, R8
JMPC	R30, GTE, #1, L_my_img_load14
; cnt end address is: 40 (R10)
;matrixrgb_firmware.c,184 :: 		tmpCol = firm_buffer[cnt] + (firm_buffer[cnt + 1] << 8);
; cnt start address is: 40 (R10)
LDK.L	R5, #_firm_buffer+0
ADD.L	R3, R5, R10
LDI.B	R4, R3, #0
ADD.L	R3, R10, #1
BEXTU.L	R3, R3, #0
ADD.L	R3, R5, R3
LDI.B	R3, R3, #0
ASHL.L	R3, R3, #8
BEXTU.L	R3, R3, #0
ADD.L	R6, R4, R3
BEXTU.L	R6, R6, #0
;matrixrgb_firmware.c,185 :: 		red = tmpCol >> 11;
BEXTU.L	R3, R6, #0
LSHR.L	R5, R3, #11
;matrixrgb_firmware.c,186 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R3, #2047
AND.L	R3, R6, R3
BEXTU.L	R3, R3, #0
LSHR.L	R4, R3, #5
;matrixrgb_firmware.c,187 :: 		blue = tmpCol & 0x1F;
AND.L	R3, R6, #31
;matrixrgb_firmware.c,189 :: 		write_pixel_img( i, j, red, green, blue);
STI.S	SP, #0, R4
BEXTU.L	R2, R5, #256
BEXTU.L	R1, R12, #0
BEXTU.L	R0, R11, #0
BEXTU.L	R4, R3, #256
LDI.B	R3, SP, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,182 :: 		for ( j = 0; j < width; j++ )
ADD.L	R12, R12, #1
BEXTS.L	R12, R12, #0
;matrixrgb_firmware.c,190 :: 		}
; cnt end address is: 40 (R10)
; j end address is: 48 (R12)
JMP	L_my_img_load13
L_my_img_load14:
;matrixrgb_firmware.c,179 :: 		for ( i = 0; i < height; i++ )
ADD.L	R11, R11, #1
BEXTS.L	R11, R11, #0
;matrixrgb_firmware.c,192 :: 		}
; width end address is: 32 (R8)
; height end address is: 36 (R9)
; i end address is: 44 (R11)
JMP	L_my_img_load10
L_my_img_load11:
;matrixrgb_firmware.c,194 :: 		}
L_end_my_img_load:
UNLINK	LR
RETURN	
; end of _my_img_load
_image_load_command:
;matrixrgb_firmware.c,196 :: 		void image_load_command( void )
;matrixrgb_firmware.c,205 :: 		receive_data( &firm_buffer, 4 );
LDK.L	R1, #4
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,210 :: 		wid = wid_hi;
; wid start address is: 4 (R1)
LDA.B	R1, _firm_buffer+1
;matrixrgb_firmware.c,211 :: 		wid = ( wid << 8 ) | wid_lo;
BEXTU.L	R0, R1, #0
; wid end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
OR.L	R0, R1, R0
; wid start address is: 8 (R2)
BEXTU.L	R2, R0, #0
;matrixrgb_firmware.c,212 :: 		hei = hei_hi;
; hei start address is: 4 (R1)
LDA.B	R1, _firm_buffer+3
;matrixrgb_firmware.c,213 :: 		hei = ( hei << 8 ) | hei_lo;
BEXTU.L	R0, R1, #0
; hei end address is: 4 (R1)
ASHL.L	R9, R0, #8
BEXTU.L	R9, R9, #0
LDA.B	R0, _firm_buffer+2
OR.L	R9, R9, R0
BEXTU.L	R9, R9, #0
; hei start address is: 36 (R9)
;matrixrgb_firmware.c,215 :: 		for ( i = 0; i < hei; i++ )
; i start address is: 0 (R0)
LDK.L	R0, #0
; wid end address is: 8 (R2)
; i end address is: 0 (R0)
; hei end address is: 36 (R9)
BEXTU.L	R8, R2, #0
BEXTU.L	R10, R0, #0
L_image_load_command16:
; i start address is: 40 (R10)
; hei start address is: 36 (R9)
; wid start address is: 32 (R8)
CMP.S	R10, R9
JMPC	R30, C, #0, L_image_load_command17
;matrixrgb_firmware.c,216 :: 		for ( j = 0; j < wid; j++ )
; j start address is: 44 (R11)
LDK.L	R11, #0
; wid end address is: 32 (R8)
; hei end address is: 36 (R9)
; j end address is: 44 (R11)
; i end address is: 40 (R10)
L_image_load_command19:
; j start address is: 44 (R11)
; wid start address is: 32 (R8)
; hei start address is: 36 (R9)
; i start address is: 40 (R10)
CMP.S	R11, R8
JMPC	R30, C, #0, L_image_load_command20
;matrixrgb_firmware.c,218 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,220 :: 		tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
LDA.B	R0, _firm_buffer+1
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
ADD.L	R3, R0, R1
BEXTU.L	R3, R3, #0
;matrixrgb_firmware.c,221 :: 		red = tmpCol >> 11;
BEXTU.L	R0, R3, #0
LSHR.L	R2, R0, #11
;matrixrgb_firmware.c,222 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R0, #2047
AND.L	R0, R3, R0
BEXTU.L	R0, R0, #0
LSHR.L	R1, R0, #5
;matrixrgb_firmware.c,223 :: 		blue = tmpCol & 0x1F;
AND.L	R0, R3, #31
;matrixrgb_firmware.c,225 :: 		write_pixel_img( i, j, red, green, blue);
BEXTU.L	R4, R0, #256
BEXTU.L	R3, R1, #256
BEXTU.L	R2, R2, #256
BEXTU.L	R1, R11, #0
BEXTU.L	R0, R10, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,216 :: 		for ( j = 0; j < wid; j++ )
ADD.L	R11, R11, #1
BEXTU.L	R11, R11, #0
;matrixrgb_firmware.c,226 :: 		}
; j end address is: 44 (R11)
JMP	L_image_load_command19
L_image_load_command20:
;matrixrgb_firmware.c,215 :: 		for ( i = 0; i < hei; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #0
;matrixrgb_firmware.c,226 :: 		}
; wid end address is: 32 (R8)
; hei end address is: 36 (R9)
; i end address is: 40 (R10)
JMP	L_image_load_command16
L_image_load_command17:
;matrixrgb_firmware.c,227 :: 		}
L_end_image_load_command:
RETURN	
; end of _image_load_command
_scroll_img_left_command:
;matrixrgb_firmware.c,229 :: 		void scroll_img_left_command( void )
LINK	LR, #4
;matrixrgb_firmware.c,235 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,236 :: 		uint8_t speed  = 0;
;matrixrgb_firmware.c,240 :: 		receive_data( &firm_buffer, 4 );
LDK.L	R1, #4
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,241 :: 		wid_lo  = firm_buffer[0];
; wid_lo start address is: 20 (R5)
LDA.B	R5, _firm_buffer+0
;matrixrgb_firmware.c,242 :: 		wid_hi  = firm_buffer[1];
; wid_hi start address is: 24 (R6)
LDA.B	R6, _firm_buffer+1
;matrixrgb_firmware.c,243 :: 		hei_lo  = firm_buffer[2];
; hei_lo start address is: 12 (R3)
LDA.B	R3, _firm_buffer+2
;matrixrgb_firmware.c,244 :: 		hei_hi  = firm_buffer[3];
; hei_hi start address is: 16 (R4)
LDA.B	R4, _firm_buffer+3
;matrixrgb_firmware.c,245 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,246 :: 		speed = firm_buffer[0];
; speed start address is: 40 (R10)
LDA.B	R10, _firm_buffer+0
;matrixrgb_firmware.c,247 :: 		img_w = wid_hi;
; img_w start address is: 4 (R1)
BEXTU.L	R1, R6, #256
; wid_hi end address is: 24 (R6)
;matrixrgb_firmware.c,248 :: 		img_w = ( img_w << 8 ) | wid_lo;
BEXTU.L	R0, R1, #0
; img_w end address is: 4 (R1)
ASHL.L	R0, R0, #8
BEXTU.L	R0, R0, #0
OR.L	R1, R0, R5
; wid_lo end address is: 20 (R5)
; img_w start address is: 44 (R11)
BEXTU.L	R11, R1, #0
;matrixrgb_firmware.c,249 :: 		img_h = hei_hi;
; img_h start address is: 8 (R2)
BEXTU.L	R2, R4, #256
; hei_hi end address is: 16 (R4)
;matrixrgb_firmware.c,250 :: 		img_h = ( img_h << 8 ) | hei_lo;
BEXTU.L	R0, R2, #0
; img_h end address is: 8 (R2)
ASHL.L	R0, R0, #8
BEXTU.L	R0, R0, #0
OR.L	R0, R0, R3
; hei_lo end address is: 12 (R3)
; img_h start address is: 48 (R12)
BEXTU.L	R12, R0, #0
;matrixrgb_firmware.c,251 :: 		allocate_image( img_w, img_h );
STI.S	SP, #0, R1
BEXTU.L	R1, R0, #256
LDI.B	R0, SP, #0
CALL	_allocate_image+0
;matrixrgb_firmware.c,253 :: 		for ( i = 0; i < img_h; i++ )
; i start address is: 24 (R6)
LDK.L	R6, #0
; speed end address is: 40 (R10)
; img_w end address is: 44 (R11)
; img_h end address is: 48 (R12)
; i end address is: 24 (R6)
BEXTU.L	R3, R10, #256
BEXTU.L	R15, R11, #0
BEXTU.L	R11, R12, #0
L_scroll_img_left_command22:
; i start address is: 24 (R6)
; img_h start address is: 44 (R11)
; img_w start address is: 60 (R15)
; speed start address is: 12 (R3)
CMP.S	R6, R11
JMPC	R30, C, #0, L_scroll_img_left_command23
;matrixrgb_firmware.c,254 :: 		for ( j = 0; j < img_w; j++ )
; j start address is: 28 (R7)
LDK.L	R7, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
; speed end address is: 12 (R3)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
BEXTU.L	R5, R11, #0
BEXTU.L	R4, R15, #0
L_scroll_img_left_command25:
; j start address is: 28 (R7)
; speed start address is: 12 (R3)
; img_w start address is: 16 (R4)
; img_h start address is: 20 (R5)
; i start address is: 24 (R6)
CMP.S	R7, R4
JMPC	R30, C, #0, L_scroll_img_left_command26
;matrixrgb_firmware.c,256 :: 		buffer = 0;
; buffer start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,257 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,259 :: 		tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
LDA.B	R0, _firm_buffer+1
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
ADD.L	R2, R0, R1
BEXTU.L	R2, R2, #0
;matrixrgb_firmware.c,260 :: 		red = tmpCol >> 11;
BEXTU.L	R0, R2, #0
LSHR.L	R1, R0, #11
;matrixrgb_firmware.c,261 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R0, #2047
AND.L	R0, R2, R0
BEXTU.L	R0, R0, #0
LSHR.L	R0, R0, #5
; green start address is: 36 (R9)
BEXTU.L	R9, R0, #256
;matrixrgb_firmware.c,262 :: 		blue = tmpCol & 0x1F;
AND.L	R0, R2, #31
; blue start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,263 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R0, R1, #256
AND.L	R0, R0, #24
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_left_command302
;matrixrgb_firmware.c,264 :: 		buffer |= 0x04;
OR.L	R1, R8, #4
BEXTU.L	R1, R1, #256
; buffer end address is: 32 (R8)
; buffer start address is: 4 (R1)
; buffer end address is: 4 (R1)
JMP	L_scroll_img_left_command28
L__scroll_img_left_command302:
;matrixrgb_firmware.c,263 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R1, R8, #256
;matrixrgb_firmware.c,264 :: 		buffer |= 0x04;
L_scroll_img_left_command28:
;matrixrgb_firmware.c,265 :: 		if ( ( green & 0x38 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R9, #56
; green end address is: 36 (R9)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_left_command303
;matrixrgb_firmware.c,266 :: 		buffer |= 0x02;
OR.L	R1, R1, #2
BEXTU.L	R1, R1, #256
; buffer end address is: 4 (R1)
JMP	L_scroll_img_left_command29
L__scroll_img_left_command303:
;matrixrgb_firmware.c,265 :: 		if ( ( green & 0x38 ) > 0 )
;matrixrgb_firmware.c,266 :: 		buffer |= 0x02;
L_scroll_img_left_command29:
;matrixrgb_firmware.c,267 :: 		if ( ( blue & 0x18 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R2, #24
; blue end address is: 8 (R2)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_left_command304
;matrixrgb_firmware.c,268 :: 		buffer |= 0x01;
OR.L	R2, R1, #1
BEXTU.L	R2, R2, #256
; buffer end address is: 4 (R1)
; buffer start address is: 8 (R2)
; buffer end address is: 8 (R2)
JMP	L_scroll_img_left_command30
L__scroll_img_left_command304:
;matrixrgb_firmware.c,267 :: 		if ( ( blue & 0x18 ) > 0 )
BEXTU.L	R2, R1, #256
;matrixrgb_firmware.c,268 :: 		buffer |= 0x01;
L_scroll_img_left_command30:
;matrixrgb_firmware.c,269 :: 		img[( i * img_w ) + j] = buffer;
; buffer start address is: 8 (R2)
MUL.L	R0, R6, R4
BEXTU.L	R0, R0, #0
ADD.L	R1, R0, R7
BEXTU.L	R1, R1, #0
LDA.L	R0, matrixrgb_firmware_img+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R2
; buffer end address is: 8 (R2)
;matrixrgb_firmware.c,254 :: 		for ( j = 0; j < img_w; j++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,270 :: 		}
; j end address is: 28 (R7)
JMP	L_scroll_img_left_command25
L_scroll_img_left_command26:
;matrixrgb_firmware.c,253 :: 		for ( i = 0; i < img_h; i++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #0
;matrixrgb_firmware.c,270 :: 		}
; img_w end address is: 16 (R4)
; img_h end address is: 20 (R5)
; i end address is: 24 (R6)
BEXTU.L	R15, R4, #0
BEXTU.L	R11, R5, #0
JMP	L_scroll_img_left_command22
L_scroll_img_left_command23:
;matrixrgb_firmware.c,271 :: 		scroll_image_onto_right( img, img_w, img_h, speed );
; img_w start address is: 60 (R15)
; img_h start address is: 44 (R11)
LDA.L	R0, matrixrgb_firmware_img+0
; speed end address is: 12 (R3)
BEXTU.L	R2, R11, #256
BEXTU.L	R1, R15, #256
CALL	_scroll_image_onto_right+0
;matrixrgb_firmware.c,274 :: 		Free( img, (img_w * img_h) );
MUL.L	R1, R15, R11
BEXTU.L	R1, R1, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
LDA.L	R0, matrixrgb_firmware_img+0
CALL	_Free+0
;matrixrgb_firmware.c,275 :: 		}
L_end_scroll_img_left_command:
UNLINK	LR
RETURN	
; end of _scroll_img_left_command
_scroll_img_right_command:
;matrixrgb_firmware.c,278 :: 		void scroll_img_right_command( void )
LINK	LR, #4
;matrixrgb_firmware.c,284 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,285 :: 		uint8_t speed  = 0;
;matrixrgb_firmware.c,289 :: 		receive_data( &firm_buffer, 4 );
LDK.L	R1, #4
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,290 :: 		wid_lo  = firm_buffer[0];
; wid_lo start address is: 20 (R5)
LDA.B	R5, _firm_buffer+0
;matrixrgb_firmware.c,291 :: 		wid_hi  = firm_buffer[1];
; wid_hi start address is: 24 (R6)
LDA.B	R6, _firm_buffer+1
;matrixrgb_firmware.c,292 :: 		hei_lo  = firm_buffer[2];
; hei_lo start address is: 12 (R3)
LDA.B	R3, _firm_buffer+2
;matrixrgb_firmware.c,293 :: 		hei_hi  = firm_buffer[3];
; hei_hi start address is: 16 (R4)
LDA.B	R4, _firm_buffer+3
;matrixrgb_firmware.c,294 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,295 :: 		speed = firm_buffer[0];
; speed start address is: 40 (R10)
LDA.B	R10, _firm_buffer+0
;matrixrgb_firmware.c,297 :: 		img_w = wid_hi;
; img_w start address is: 4 (R1)
BEXTU.L	R1, R6, #256
; wid_hi end address is: 24 (R6)
;matrixrgb_firmware.c,298 :: 		img_w = ( img_w << 8 ) | wid_lo;
BEXTU.L	R0, R1, #0
; img_w end address is: 4 (R1)
ASHL.L	R0, R0, #8
BEXTU.L	R0, R0, #0
OR.L	R1, R0, R5
; wid_lo end address is: 20 (R5)
; img_w start address is: 44 (R11)
BEXTU.L	R11, R1, #0
;matrixrgb_firmware.c,299 :: 		img_h = hei_hi;
; img_h start address is: 8 (R2)
BEXTU.L	R2, R4, #256
; hei_hi end address is: 16 (R4)
;matrixrgb_firmware.c,300 :: 		img_h = ( img_h << 8 ) | hei_lo;
BEXTU.L	R0, R2, #0
; img_h end address is: 8 (R2)
ASHL.L	R0, R0, #8
BEXTU.L	R0, R0, #0
OR.L	R0, R0, R3
; hei_lo end address is: 12 (R3)
; img_h start address is: 48 (R12)
BEXTU.L	R12, R0, #0
;matrixrgb_firmware.c,301 :: 		allocate_image( img_w, img_h );
STI.S	SP, #0, R1
BEXTU.L	R1, R0, #256
LDI.B	R0, SP, #0
CALL	_allocate_image+0
;matrixrgb_firmware.c,304 :: 		for ( i = 0; i < img_h; i++ )
; i start address is: 24 (R6)
LDK.L	R6, #0
; speed end address is: 40 (R10)
; img_w end address is: 44 (R11)
; img_h end address is: 48 (R12)
; i end address is: 24 (R6)
BEXTU.L	R3, R10, #256
BEXTU.L	R15, R11, #0
BEXTU.L	R11, R12, #0
L_scroll_img_right_command31:
; i start address is: 24 (R6)
; img_h start address is: 44 (R11)
; img_w start address is: 60 (R15)
; speed start address is: 12 (R3)
CMP.S	R6, R11
JMPC	R30, C, #0, L_scroll_img_right_command32
;matrixrgb_firmware.c,305 :: 		for ( j = 0; j < img_w; j++ )
; j start address is: 28 (R7)
LDK.L	R7, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
; speed end address is: 12 (R3)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
BEXTU.L	R5, R11, #0
BEXTU.L	R4, R15, #0
L_scroll_img_right_command34:
; j start address is: 28 (R7)
; speed start address is: 12 (R3)
; img_w start address is: 16 (R4)
; img_h start address is: 20 (R5)
; i start address is: 24 (R6)
CMP.S	R7, R4
JMPC	R30, C, #0, L_scroll_img_right_command35
;matrixrgb_firmware.c,307 :: 		buffer = 0;
; buffer start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,308 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,310 :: 		tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
LDA.B	R0, _firm_buffer+1
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
ADD.L	R2, R0, R1
BEXTU.L	R2, R2, #0
;matrixrgb_firmware.c,311 :: 		red = tmpCol >> 11;
BEXTU.L	R0, R2, #0
LSHR.L	R1, R0, #11
;matrixrgb_firmware.c,312 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R0, #2047
AND.L	R0, R2, R0
BEXTU.L	R0, R0, #0
LSHR.L	R0, R0, #5
; green start address is: 36 (R9)
BEXTU.L	R9, R0, #256
;matrixrgb_firmware.c,313 :: 		blue = tmpCol & 0x1F;
AND.L	R0, R2, #31
; blue start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,314 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R0, R1, #256
AND.L	R0, R0, #24
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_right_command305
;matrixrgb_firmware.c,315 :: 		buffer |= 0x04;
OR.L	R1, R8, #4
BEXTU.L	R1, R1, #256
; buffer end address is: 32 (R8)
; buffer start address is: 4 (R1)
; buffer end address is: 4 (R1)
JMP	L_scroll_img_right_command37
L__scroll_img_right_command305:
;matrixrgb_firmware.c,314 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R1, R8, #256
;matrixrgb_firmware.c,315 :: 		buffer |= 0x04;
L_scroll_img_right_command37:
;matrixrgb_firmware.c,316 :: 		if ( ( green & 0x38 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R9, #56
; green end address is: 36 (R9)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_right_command306
;matrixrgb_firmware.c,317 :: 		buffer |= 0x02;
OR.L	R1, R1, #2
BEXTU.L	R1, R1, #256
; buffer end address is: 4 (R1)
JMP	L_scroll_img_right_command38
L__scroll_img_right_command306:
;matrixrgb_firmware.c,316 :: 		if ( ( green & 0x38 ) > 0 )
;matrixrgb_firmware.c,317 :: 		buffer |= 0x02;
L_scroll_img_right_command38:
;matrixrgb_firmware.c,318 :: 		if ( ( blue & 0x18 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R2, #24
; blue end address is: 8 (R2)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_right_command307
;matrixrgb_firmware.c,319 :: 		buffer |= 0x01;
OR.L	R2, R1, #1
BEXTU.L	R2, R2, #256
; buffer end address is: 4 (R1)
; buffer start address is: 8 (R2)
; buffer end address is: 8 (R2)
JMP	L_scroll_img_right_command39
L__scroll_img_right_command307:
;matrixrgb_firmware.c,318 :: 		if ( ( blue & 0x18 ) > 0 )
BEXTU.L	R2, R1, #256
;matrixrgb_firmware.c,319 :: 		buffer |= 0x01;
L_scroll_img_right_command39:
;matrixrgb_firmware.c,320 :: 		img[( i * img_w ) + j] = buffer;
; buffer start address is: 8 (R2)
MUL.L	R0, R6, R4
BEXTU.L	R0, R0, #0
ADD.L	R1, R0, R7
BEXTU.L	R1, R1, #0
LDA.L	R0, matrixrgb_firmware_img+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R2
; buffer end address is: 8 (R2)
;matrixrgb_firmware.c,305 :: 		for ( j = 0; j < img_w; j++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,321 :: 		}
; j end address is: 28 (R7)
JMP	L_scroll_img_right_command34
L_scroll_img_right_command35:
;matrixrgb_firmware.c,304 :: 		for ( i = 0; i < img_h; i++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #0
;matrixrgb_firmware.c,321 :: 		}
; img_w end address is: 16 (R4)
; img_h end address is: 20 (R5)
; i end address is: 24 (R6)
BEXTU.L	R15, R4, #0
BEXTU.L	R11, R5, #0
JMP	L_scroll_img_right_command31
L_scroll_img_right_command32:
;matrixrgb_firmware.c,322 :: 		scroll_image_onto_left( img, img_w, img_h, speed );
; img_w start address is: 60 (R15)
; img_h start address is: 44 (R11)
LDA.L	R0, matrixrgb_firmware_img+0
; speed end address is: 12 (R3)
BEXTU.L	R2, R11, #256
BEXTU.L	R1, R15, #256
CALL	_scroll_image_onto_left+0
;matrixrgb_firmware.c,325 :: 		Free( img, (img_w * img_h) );
MUL.L	R1, R15, R11
BEXTU.L	R1, R1, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
LDA.L	R0, matrixrgb_firmware_img+0
CALL	_Free+0
;matrixrgb_firmware.c,326 :: 		}
L_end_scroll_img_right_command:
UNLINK	LR
RETURN	
; end of _scroll_img_right_command
_write_pxl_command:
;matrixrgb_firmware.c,328 :: 		void write_pxl_command( void )
LINK	LR, #8
;matrixrgb_firmware.c,334 :: 		receive_data( &firm_buffer, 7 );
LDK.L	R1, #7
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,335 :: 		row = firm_buffer[1];
; row start address is: 4 (R1)
LDA.B	R1, _firm_buffer+1
;matrixrgb_firmware.c,336 :: 		row = ( row << 8 ) | firm_buffer[0];
BEXTU.L	R0, R1, #0
; row end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
OR.L	R4, R1, R0
;matrixrgb_firmware.c,337 :: 		col = firm_buffer[3];
; col start address is: 4 (R1)
LDA.B	R1, _firm_buffer+3
;matrixrgb_firmware.c,338 :: 		col = ( col << 8 ) | firm_buffer[2];
BEXTU.L	R0, R1, #0
; col end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+2
OR.L	R3, R1, R0
;matrixrgb_firmware.c,339 :: 		write_pixel( row, col, firm_buffer[4], firm_buffer[5], firm_buffer[6] );
LDA.B	R2, _firm_buffer+6
LDA.B	R1, _firm_buffer+5
LDA.B	R0, _firm_buffer+4
STI.S	SP, #0, R3
STI.B	SP, #4, R0
BEXTU.L	R0, R4, #0
BEXTU.L	R4, R2, #256
LDI.B	R2, SP, #4
BEXTU.L	R3, R1, #256
LDI.S	R1, SP, #0
CALL	_write_pixel+0
;matrixrgb_firmware.c,340 :: 		}
L_end_write_pxl_command:
UNLINK	LR
RETURN	
; end of _write_pxl_command
_write_pxl_img_command:
;matrixrgb_firmware.c,343 :: 		void write_pxl_img_command( void )
LINK	LR, #8
;matrixrgb_firmware.c,348 :: 		receive_data( &firm_buffer, 7 );
LDK.L	R1, #7
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,349 :: 		row = firm_buffer[1];
; row start address is: 4 (R1)
LDA.B	R1, _firm_buffer+1
;matrixrgb_firmware.c,350 :: 		row = ( row << 8 ) | firm_buffer[0];
BEXTU.L	R0, R1, #0
; row end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
OR.L	R4, R1, R0
;matrixrgb_firmware.c,351 :: 		col = firm_buffer[3];
; col start address is: 4 (R1)
LDA.B	R1, _firm_buffer+3
;matrixrgb_firmware.c,352 :: 		col = ( col << 8 ) | firm_buffer[2];
BEXTU.L	R0, R1, #0
; col end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+2
OR.L	R3, R1, R0
;matrixrgb_firmware.c,353 :: 		write_pixel_img( row, col, firm_buffer[4], firm_buffer[5], firm_buffer[6] );
LDA.B	R2, _firm_buffer+6
LDA.B	R1, _firm_buffer+5
LDA.B	R0, _firm_buffer+4
STI.S	SP, #0, R3
STI.B	SP, #4, R0
BEXTU.L	R0, R4, #0
BEXTU.L	R4, R2, #256
LDI.B	R2, SP, #4
BEXTU.L	R3, R1, #256
LDI.S	R1, SP, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,354 :: 		}
L_end_write_pxl_img_command:
UNLINK	LR
RETURN	
; end of _write_pxl_img_command
_erase_pxl_command:
;matrixrgb_firmware.c,357 :: 		void erase_pxl_command( void )
;matrixrgb_firmware.c,362 :: 		receive_data( &firm_buffer, 4 );
LDK.L	R1, #4
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,363 :: 		row = firm_buffer[1];
; row start address is: 4 (R1)
LDA.B	R1, _firm_buffer+1
;matrixrgb_firmware.c,364 :: 		row = ( row << 8 ) | firm_buffer[0];
BEXTU.L	R0, R1, #0
; row end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
OR.L	R2, R1, R0
;matrixrgb_firmware.c,365 :: 		col = firm_buffer[3];
; col start address is: 4 (R1)
LDA.B	R1, _firm_buffer+3
;matrixrgb_firmware.c,366 :: 		col = ( col << 8 ) | firm_buffer[2];
BEXTU.L	R0, R1, #0
; col end address is: 4 (R1)
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+2
OR.L	R0, R1, R0
;matrixrgb_firmware.c,367 :: 		erase_pixel( row, col );
BEXTU.L	R1, R0, #0
BEXTU.L	R0, R2, #0
CALL	_erase_pixel+0
;matrixrgb_firmware.c,368 :: 		}
L_end_erase_pxl_command:
RETURN	
; end of _erase_pxl_command
_scroll_text_left_command:
;matrixrgb_firmware.c,370 :: 		void scroll_text_left_command( void )
LINK	LR, #260
;matrixrgb_firmware.c,372 :: 		uint8_t text[256] = { 0 };
ADD.L	R27, SP, #3
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_left_command_text_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,373 :: 		char *ptr = text;
ADD.L	R6, SP, #3
; ptr start address is: 24 (R6)
;matrixrgb_firmware.c,374 :: 		uint8_t i = 0;
;matrixrgb_firmware.c,375 :: 		uint8_t size = 0;
;matrixrgb_firmware.c,377 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,379 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,380 :: 		size = firm_buffer[0];
; size start address is: 16 (R4)
LDA.B	R4, _firm_buffer+0
;matrixrgb_firmware.c,381 :: 		receive_data( &firm_buffer, 3 );
LDK.L	R1, #3
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,382 :: 		my_color.red   = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	SP, #0, R0
;matrixrgb_firmware.c,383 :: 		my_color.green = firm_buffer[1];
LDA.B	R0, _firm_buffer+1
STI.B	SP, #1, R0
;matrixrgb_firmware.c,384 :: 		my_color.blue  = firm_buffer[2];
LDA.B	R0, _firm_buffer+2
STI.B	SP, #2, R0
;matrixrgb_firmware.c,385 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,386 :: 		speed = firm_buffer[0];
; speed start address is: 12 (R3)
LDA.B	R3, _firm_buffer+0
;matrixrgb_firmware.c,388 :: 		for ( i = 0; i < size; i++ )
; i start address is: 20 (R5)
LDK.L	R5, #0
; speed end address is: 12 (R3)
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
L_scroll_text_left_command40:
; i start address is: 20 (R5)
; speed start address is: 12 (R3)
; size start address is: 16 (R4)
; ptr start address is: 24 (R6)
CMP.B	R5, R4
JMPC	R30, C, #0, L_scroll_text_left_command41
;matrixrgb_firmware.c,390 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,391 :: 		*ptr++ = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	R6, #0, R0
ADD.L	R6, R6, #1
;matrixrgb_firmware.c,388 :: 		for ( i = 0; i < size; i++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,392 :: 		}
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
JMP	L_scroll_text_left_command40
L_scroll_text_left_command41:
;matrixrgb_firmware.c,394 :: 		scroll_text_left( text, my_color, speed );
ADD.L	R0, SP, #3
BEXTU.L	R1, R3, #256
; speed end address is: 12 (R3)
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_scroll_text_left+0
ADD.L	SP, SP, #4
;matrixrgb_firmware.c,395 :: 		}
L_end_scroll_text_left_command:
UNLINK	LR
RETURN	
; end of _scroll_text_left_command
_scroll_text_right_command:
;matrixrgb_firmware.c,398 :: 		void scroll_text_right_command( void )
LINK	LR, #260
;matrixrgb_firmware.c,401 :: 		char text[256] = { 0 };
ADD.L	R27, SP, #3
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_right_command_text_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,402 :: 		char *ptr = text;
ADD.L	R6, SP, #3
; ptr start address is: 24 (R6)
;matrixrgb_firmware.c,403 :: 		uint8_t i = 0;
;matrixrgb_firmware.c,404 :: 		uint8_t size = 0;
;matrixrgb_firmware.c,406 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,408 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,409 :: 		size = firm_buffer[0];
; size start address is: 16 (R4)
LDA.B	R4, _firm_buffer+0
;matrixrgb_firmware.c,410 :: 		receive_data( &firm_buffer, 3 );
LDK.L	R1, #3
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,411 :: 		my_color.red   = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	SP, #0, R0
;matrixrgb_firmware.c,412 :: 		my_color.green = firm_buffer[1];
LDA.B	R0, _firm_buffer+1
STI.B	SP, #1, R0
;matrixrgb_firmware.c,413 :: 		my_color.blue  = firm_buffer[2];
LDA.B	R0, _firm_buffer+2
STI.B	SP, #2, R0
;matrixrgb_firmware.c,414 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,415 :: 		speed = firm_buffer[0];
; speed start address is: 12 (R3)
LDA.B	R3, _firm_buffer+0
;matrixrgb_firmware.c,418 :: 		for ( i = 0; i < size; i++ )
; i start address is: 20 (R5)
LDK.L	R5, #0
; speed end address is: 12 (R3)
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
L_scroll_text_right_command43:
; i start address is: 20 (R5)
; speed start address is: 12 (R3)
; size start address is: 16 (R4)
; ptr start address is: 24 (R6)
CMP.B	R5, R4
JMPC	R30, C, #0, L_scroll_text_right_command44
;matrixrgb_firmware.c,420 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,421 :: 		*ptr++ = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	R6, #0, R0
ADD.L	R6, R6, #1
;matrixrgb_firmware.c,418 :: 		for ( i = 0; i < size; i++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,422 :: 		}
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
JMP	L_scroll_text_right_command43
L_scroll_text_right_command44:
;matrixrgb_firmware.c,424 :: 		scroll_text_right( text, my_color, speed );
ADD.L	R0, SP, #3
BEXTU.L	R1, R3, #256
; speed end address is: 12 (R3)
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_scroll_text_right+0
ADD.L	SP, SP, #4
;matrixrgb_firmware.c,426 :: 		}
L_end_scroll_text_right_command:
UNLINK	LR
RETURN	
; end of _scroll_text_right_command
_display_shift_up_command:
;matrixrgb_firmware.c,429 :: 		void display_shift_up_command( void )
;matrixrgb_firmware.c,431 :: 		display_shift_up();
CALL	_display_shift_up+0
;matrixrgb_firmware.c,432 :: 		}
L_end_display_shift_up_command:
RETURN	
; end of _display_shift_up_command
_display_shift_down_command:
;matrixrgb_firmware.c,435 :: 		void display_shift_down_command( void )
;matrixrgb_firmware.c,437 :: 		display_shift_down();
CALL	_display_shift_down+0
;matrixrgb_firmware.c,438 :: 		}
L_end_display_shift_down_command:
RETURN	
; end of _display_shift_down_command
_display_shift_right_command:
;matrixrgb_firmware.c,441 :: 		void display_shift_right_command( void )
;matrixrgb_firmware.c,443 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,444 :: 		}
L_end_display_shift_right_command:
RETURN	
; end of _display_shift_right_command
_display_shift_left_command:
;matrixrgb_firmware.c,447 :: 		void display_shift_left_command( void )
;matrixrgb_firmware.c,449 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,450 :: 		}
L_end_display_shift_left_command:
RETURN	
; end of _display_shift_left_command
_display_scroll_off_scrn_up_command:
;matrixrgb_firmware.c,453 :: 		void display_scroll_off_scrn_up_command( void )
;matrixrgb_firmware.c,455 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,457 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,459 :: 		scroll_off_screen_up( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_up+0
;matrixrgb_firmware.c,460 :: 		}
L_end_display_scroll_off_scrn_up_command:
RETURN	
; end of _display_scroll_off_scrn_up_command
_display_scroll_off_scrn_down_command:
;matrixrgb_firmware.c,463 :: 		void display_scroll_off_scrn_down_command( void )
;matrixrgb_firmware.c,465 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,467 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,469 :: 		scroll_off_screen_down( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_down+0
;matrixrgb_firmware.c,470 :: 		}
L_end_display_scroll_off_scrn_down_command:
RETURN	
; end of _display_scroll_off_scrn_down_command
_display_scroll_off_scrn_left_command:
;matrixrgb_firmware.c,473 :: 		void display_scroll_off_scrn_left_command( void )
;matrixrgb_firmware.c,475 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,477 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,479 :: 		scroll_off_screen_left( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_left+0
;matrixrgb_firmware.c,480 :: 		}
L_end_display_scroll_off_scrn_left_command:
RETURN	
; end of _display_scroll_off_scrn_left_command
_display_scroll_off_scrn_right_command:
;matrixrgb_firmware.c,483 :: 		void display_scroll_off_scrn_right_command( void )
;matrixrgb_firmware.c,485 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,487 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,489 :: 		scroll_off_screen_right( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_right+0
;matrixrgb_firmware.c,490 :: 		}
L_end_display_scroll_off_scrn_right_command:
RETURN	
; end of _display_scroll_off_scrn_right_command
_refresh_command:
;matrixrgb_firmware.c,492 :: 		void refresh_command( void )
;matrixrgb_firmware.c,494 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,495 :: 		}
L_end_refresh_command:
RETURN	
; end of _refresh_command
_clear_screen_command:
;matrixrgb_firmware.c,497 :: 		void clear_screen_command( void )
;matrixrgb_firmware.c,499 :: 		clear_frame_buffer();
CALL	_clear_frame_buffer+0
;matrixrgb_firmware.c,500 :: 		}
L_end_clear_screen_command:
RETURN	
; end of _clear_screen_command
_allocate_image:
;matrixrgb_firmware.c,502 :: 		void allocate_image( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 0 (R0)
; height start address is: 4 (R1)
;matrixrgb_firmware.c,504 :: 		uint16_t size = width * height;
MUL.L	R2, R0, R1
; width end address is: 0 (R0)
; height end address is: 4 (R1)
; size start address is: 36 (R9)
BEXTU.L	R9, R2, #0
;matrixrgb_firmware.c,505 :: 		uint16_t i = 0;
;matrixrgb_firmware.c,507 :: 		img = Malloc( sizeof( uint8_t ) * size );
BEXTU.L	R0, R9, #0
CALL	_Malloc+0
STA.L	matrixrgb_firmware_img+0, R0
;matrixrgb_firmware.c,508 :: 		for ( i = 0; i < size; i++ )
; i start address is: 0 (R0)
LDK.L	R0, #0
; size end address is: 36 (R9)
; i end address is: 0 (R0)
BEXTU.L	R1, R9, #0
L_allocate_image46:
; i start address is: 0 (R0)
; size start address is: 4 (R1)
CMP.S	R0, R1
JMPC	R30, C, #0, L_allocate_image47
;matrixrgb_firmware.c,509 :: 		img[i] = 0x00;
LDA.L	R2, matrixrgb_firmware_img+0
ADD.L	R3, R2, R0
LDK.L	R2, #0
STI.B	R3, #0, R2
;matrixrgb_firmware.c,508 :: 		for ( i = 0; i < size; i++ )
ADD.L	R0, R0, #1
BEXTU.L	R0, R0, #0
;matrixrgb_firmware.c,509 :: 		img[i] = 0x00;
; size end address is: 4 (R1)
; i end address is: 0 (R0)
JMP	L_allocate_image46
L_allocate_image47:
;matrixrgb_firmware.c,511 :: 		}
L_end_allocate_image:
RETURN	
; end of _allocate_image
_receive_data:
;matrixrgb_firmware.c,513 :: 		void receive_data(uint8_t* dataPtr, uint16_t dataSize)
; dataSize start address is: 4 (R1)
; dataPtr start address is: 0 (R0)
LINK	LR, #4
; dataSize end address is: 4 (R1)
; dataPtr end address is: 0 (R0)
; dataPtr start address is: 0 (R0)
; dataSize start address is: 4 (R1)
;matrixrgb_firmware.c,516 :: 		SetReady();
LDA.x	R2, #AlignedAddress(GPIO_PIN17_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN17_bit+0)=1
STI.x	GPIO_PIN17_bit+0, #AlignedAddress(R2)
; dataPtr end address is: 0 (R0)
; dataSize end address is: 4 (R1)
STI.S	SP, #0, R1
MOVE.L	R1, R0
LDI.S	R0, SP, #0
;matrixrgb_firmware.c,518 :: 		while (SPIS1_RX_FIFO_COUNT < dataSize) ;
L_receive_data49:
; dataSize start address is: 0 (R0)
; dataPtr start address is: 4 (R1)
LDA.L	R2, SPIS1_RX_FIFO_COUNT+0
CMP.L	R2, R0
JMPC	R30, C, #0, L_receive_data50
JMP	L_receive_data49
L_receive_data50:
;matrixrgb_firmware.c,520 :: 		STREAMIN_B(dataPtr, &SPIS1_DATA, dataSize);
MOVE.L	R26, R1
; dataPtr end address is: 4 (R1)
LDK.L	R27, #SPIS1_DATA+0
MOVE.L	R28, R0
; dataSize end address is: 0 (R0)
STREAMIN.B	R26, R27, R28
;matrixrgb_firmware.c,522 :: 		SetNotReady();
LDA.x	R2, #AlignedAddress(GPIO_PIN17_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN17_bit+0)=0
STI.x	GPIO_PIN17_bit+0, #AlignedAddress(R2)
;matrixrgb_firmware.c,525 :: 		}
L_end_receive_data:
UNLINK	LR
RETURN	
; end of _receive_data
_spi_bus_init:
;matrixrgb_firmware.c,527 :: 		void spi_bus_init()
LINK	LR, #8
;matrixrgb_firmware.c,535 :: 		};
LDK.L	R0, #36
STI.B	SP, #0, R0
LDK.L	R0, #37
STI.B	SP, #1, R0
LDK.L	R0, #38
STI.B	SP, #2, R0
LDK.L	R0, #39
STI.B	SP, #3, R0
LDK.L	R0, #18
STI.B	SP, #4, R0
LDK.L	R0, #17
STI.B	SP, #5, R0
LDK.L	R0, #50
STI.B	SP, #6, R0
;matrixrgb_firmware.c,539 :: 		};
;matrixrgb_firmware.c,544 :: 		for ( i = 0; i < sizeof( output_pins ); i++ )
; i start address is: 32 (R8)
LDK.L	R8, #0
; i end address is: 32 (R8)
L_spi_bus_init51:
; i start address is: 32 (R8)
CMP.S	R8, #3
JMPC	R30, GTE, #1, L_spi_bus_init52
;matrixrgb_firmware.c,546 :: 		GPIO_Pin_Config( output_pins[i],
ADD.L	R0, SP, #4
ADD.L	R0, R0, R8
LDI.B	R0, R0, #0
;matrixrgb_firmware.c,552 :: 		_GPIO_CFG_SPEC_NONE );
LDK.L	R2, #3414053
LDL.L	R2, R2, #3414053
;matrixrgb_firmware.c,547 :: 		_GPIO_DIR_OUTPUT,
LDK.L	R1, #4
;matrixrgb_firmware.c,546 :: 		GPIO_Pin_Config( output_pins[i],
;matrixrgb_firmware.c,552 :: 		_GPIO_CFG_SPEC_NONE );
CALL	_GPIO_Pin_Config+0
;matrixrgb_firmware.c,544 :: 		for ( i = 0; i < sizeof( output_pins ); i++ )
ADD.L	R8, R8, #1
BEXTS.L	R8, R8, #0
;matrixrgb_firmware.c,553 :: 		}
; i end address is: 32 (R8)
JMP	L_spi_bus_init51
L_spi_bus_init52:
;matrixrgb_firmware.c,555 :: 		PWR_EnableModule( _PWR_CLK_SPIS0 );
LDK.L	R0, #64
CALL	_PWR_EnableModule+0
;matrixrgb_firmware.c,557 :: 		for ( i = 0; i < sizeof( slave_pins ); i++ )
; i start address is: 32 (R8)
LDK.L	R8, #0
; i end address is: 32 (R8)
L_spi_bus_init54:
; i start address is: 32 (R8)
CMP.S	R8, #4
JMPC	R30, GTE, #1, L_spi_bus_init55
;matrixrgb_firmware.c,560 :: 		( i == _GPIO_PIN_NUM_39 ) ? _GPIO_DIR_OUTPUT : _GPIO_DIR_INPUT,
CMP.S	R8, #39
JMPC	R30, Z, #0, L_spi_bus_init57
; ?FLOC___spi_bus_init?T270 start address is: 4 (R1)
LDK.L	R1, #4
; ?FLOC___spi_bus_init?T270 end address is: 4 (R1)
JMP	L_spi_bus_init58
L_spi_bus_init57:
; ?FLOC___spi_bus_init?T270 start address is: 4 (R1)
LDK.L	R1, #0
; ?FLOC___spi_bus_init?T270 end address is: 4 (R1)
L_spi_bus_init58:
;matrixrgb_firmware.c,559 :: 		GPIO_Pin_Config( slave_pins[i],
; ?FLOC___spi_bus_init?T270 start address is: 4 (R1)
ADD.L	R0, SP, #0
ADD.L	R0, R0, R8
LDI.B	R0, R0, #0
;matrixrgb_firmware.c,565 :: 		_GPIO_CFG_SPEC_FUNC_1 );
LDK.L	R2, #7350293
LDL.L	R2, R2, #7350293
;matrixrgb_firmware.c,560 :: 		( i == _GPIO_PIN_NUM_39 ) ? _GPIO_DIR_OUTPUT : _GPIO_DIR_INPUT,
; ?FLOC___spi_bus_init?T270 end address is: 4 (R1)
;matrixrgb_firmware.c,559 :: 		GPIO_Pin_Config( slave_pins[i],
;matrixrgb_firmware.c,565 :: 		_GPIO_CFG_SPEC_FUNC_1 );
CALL	_GPIO_Pin_Config+0
;matrixrgb_firmware.c,557 :: 		for ( i = 0; i < sizeof( slave_pins ); i++ )
ADD.L	R8, R8, #1
BEXTS.L	R8, R8, #0
;matrixrgb_firmware.c,566 :: 		}
; i end address is: 32 (R8)
JMP	L_spi_bus_init54
L_spi_bus_init55:
;matrixrgb_firmware.c,567 :: 		GPIO_Pin_Digital_Input( _GPIO_PIN_NUM_37 );
LDK.L	R0, #37
CALL	_GPIO_Pin_Digital_Input+0
;matrixrgb_firmware.c,574 :: 		( 1 << SP_R2 );
LDK.L	R0, #227
STA.L	SPIS1_CNTL+0, R0
;matrixrgb_firmware.c,576 :: 		SPIS1_CNTL &= ~( 1 << CLK_POL );
LDA.L	R0, SPIS1_CNTL+0
AND.L	R0, R0, #-9
STA.L	SPIS1_CNTL+0, R0
;matrixrgb_firmware.c,582 :: 		( 1 << FIFO_EN );      // FIFO Enable
LDK.L	R0, #39
STA.L	SPIS1_FIFO_CNTL+0, R0
;matrixrgb_firmware.c,586 :: 		SPIS1_TNSFR_FRMT_CNTL |= ( 1 << MULTI_REC );    // Allow continuous reception of data
LDA.L	R0, SPIS1_TNSFR_FRMT_CNTL+0
OR.L	R0, R0, #32
STA.L	SPIS1_TNSFR_FRMT_CNTL+0, R0
;matrixrgb_firmware.c,589 :: 		}
L_end_spi_bus_init:
UNLINK	LR
RETURN	
; end of _spi_bus_init
_system_setup:
;matrixrgb_firmware.c,591 :: 		void system_setup( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
BEXTU.L	R12, R0, #256
BEXTU.L	R13, R1, #256
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 48 (R12)
; height start address is: 52 (R13)
;matrixrgb_firmware.c,594 :: 		uint8_t currRow = 0;
;matrixrgb_firmware.c,597 :: 		GPIO_Digital_Output(&GPIO_PORT_08_15, _GPIO_PINMASK_ALL);
LDK.L	R1, #255
LDK.L	R0, #GPIO_PORT_08_15+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,599 :: 		_GPIO_PINMASK_2 | _GPIO_PINMASK_3 );
LDK.L	R1, #15
LDK.L	R0, #GPIO_PORT_32_39+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,600 :: 		GPIO_Digital_Output(&GPIO_PORT_40_47, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 );
LDK.L	R1, #48
LDK.L	R0, #GPIO_PORT_40_47+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,602 :: 		GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );         // OE Pin
LDK.L	R1, #16
LDK.L	R0, #GPIO_PORT_48_55+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,605 :: 		Led_Matrix_Data = 0; asm nop;
LDK.L	R2, #0
STA.B	GPIO_PORT_08_15+0, R2
NOP	
;matrixrgb_firmware.c,606 :: 		Led_Matrix_A = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN32_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN32_bit+0)=0
STI.x	GPIO_PIN32_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,607 :: 		Led_Matrix_B = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN33_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN33_bit+0)=0
STI.x	GPIO_PIN33_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,608 :: 		Led_Matrix_C = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN34_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN34_bit+0)=0
STI.x	GPIO_PIN34_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,609 :: 		Led_Matrix_D = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN35_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN35_bit+0)=0
STI.x	GPIO_PIN35_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,610 :: 		Led_Matrix_CLK = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN45_bit+0)=0
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,611 :: 		Led_Matrix_STB = 1; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN44_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN44_bit+0)=1
STI.x	GPIO_PIN44_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,612 :: 		Led_Matrix_OE  = 1; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN52_bit+0)=1
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,613 :: 		Delay_ms(100);
LPM.L	R28, #3333331
NOP	
L_system_setup59:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup59
JMP	$+8
	#3333331
NOP	
NOP	
;matrixrgb_firmware.c,619 :: 		init_parameters( width, height );
BEXTU.L	R1, R13, #256
; height end address is: 52 (R13)
BEXTU.L	R0, R12, #256
; width end address is: 48 (R12)
CALL	_init_parameters+0
;matrixrgb_firmware.c,622 :: 		create_frame_buffer();
CALL	_create_frame_buffer+0
;matrixrgb_firmware.c,627 :: 		}
L_end_system_setup:
RETURN	
; end of _system_setup
_set_brightness:
;matrixrgb_firmware.c,629 :: 		void set_brightness( char brightness )
; brightness start address is: 0 (R0)
LINK	LR, #4
BEXTU.L	R4, R0, #256
; brightness end address is: 0 (R0)
; brightness start address is: 16 (R4)
;matrixrgb_firmware.c,635 :: 		pwm_period = PWM_Init(_LED_GLOBAL_DIMMER_FREQ);
LDK.L	R0, #200000
CALL	_PWM_Init+0
; pwm_period start address is: 0 (R0)
;matrixrgb_firmware.c,636 :: 		tmpPwmInitState = _PWM_INIT_STATE_0;
; tmpPwmInitState start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,638 :: 		if (brightness == 0)
CMP.B	R4, #0
JMPC	R30, Z, #0, L_set_brightness61
; brightness end address is: 16 (R4)
; pwm_period end address is: 0 (R0)
; tmpPwmInitState end address is: 8 (R2)
;matrixrgb_firmware.c,640 :: 		tmpPwmInitState = _PWM_INIT_STATE_1;
; tmpPwmInitState start address is: 4 (R1)
LDK.L	R1, #1
;matrixrgb_firmware.c,641 :: 		PWM_DisableOutput();
CALL	_PWM_DisableOutput+0
;matrixrgb_firmware.c,642 :: 		}
BEXTU.L	R0, R1, #256
; tmpPwmInitState end address is: 4 (R1)
JMP	L_set_brightness62
L_set_brightness61:
;matrixrgb_firmware.c,643 :: 		else if (brightness == 100)
; tmpPwmInitState start address is: 8 (R2)
; pwm_period start address is: 0 (R0)
; brightness start address is: 16 (R4)
CMP.B	R4, #100
JMPC	R30, Z, #0, L_set_brightness63
; brightness end address is: 16 (R4)
; pwm_period end address is: 0 (R0)
;matrixrgb_firmware.c,645 :: 		PWM_DisableOutput();
CALL	_PWM_DisableOutput+0
;matrixrgb_firmware.c,646 :: 		}
JMP	L_set_brightness64
L_set_brightness63:
;matrixrgb_firmware.c,649 :: 		current_duty  = ((unsigned long)pwm_period * brightness) / 100;              // initial value for current_duty
; pwm_period start address is: 0 (R0)
; brightness start address is: 16 (R4)
BEXTU.L	R1, R0, #0
; pwm_period end address is: 0 (R0)
MUL.L	R1, R1, R4
; brightness end address is: 16 (R4)
UDIV.L	R1, R1, #100
STI.S	SP, #0, R1
;matrixrgb_firmware.c,650 :: 		PWM_EnableOutput();
CALL	_PWM_EnableOutput+0
;matrixrgb_firmware.c,651 :: 		}
L_set_brightness64:
BEXTU.L	R0, R2, #256
; tmpPwmInitState end address is: 8 (R2)
L_set_brightness62:
;matrixrgb_firmware.c,652 :: 		PWM_ConfigChannel(current_duty, tmpPwmInitState, _PWM_CHANNEL_4);                // PWM output on P52 pin
; tmpPwmInitState start address is: 0 (R0)
LDK.L	R2, #4
BEXTU.L	R1, R0, #256
; tmpPwmInitState end address is: 0 (R0)
LDI.S	R0, SP, #0
CALL	_PWM_ConfigChannel+0
;matrixrgb_firmware.c,654 :: 		GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );
LDK.L	R1, #16
LDK.L	R0, #GPIO_PORT_48_55+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,655 :: 		}
L_end_set_brightness:
UNLINK	LR
RETURN	
; end of _set_brightness
_init_parameters:
;matrixrgb_firmware.c,657 :: 		void init_parameters( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 0 (R0)
; height start address is: 4 (R1)
;matrixrgb_firmware.c,659 :: 		pan_width  = width;
STA.B	_pan_width+0, R0
;matrixrgb_firmware.c,660 :: 		pan_height = height;
STA.B	_pan_height+0, R1
;matrixrgb_firmware.c,661 :: 		p_height = height * 32;
BEXTU.L	R2, R1, #256
ASHL.L	R2, R2, #5
STA.S	_p_height+0, R2
;matrixrgb_firmware.c,662 :: 		p_width  = width * 32;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #5
STA.S	_p_width+0, R2
;matrixrgb_firmware.c,663 :: 		shift_reg = 64 * ( width * height );
MUL.L	R2, R0, R1
BEXTS.L	R2, R2, #0
; width end address is: 0 (R0)
; height end address is: 4 (R1)
ASHL.L	R2, R2, #6
BEXTS.L	R2, R2, #0
STA.L	_shift_reg+0, R2
;matrixrgb_firmware.c,665 :: 		}
L_end_init_parameters:
RETURN	
; end of _init_parameters
_create_frame_buffer:
;matrixrgb_firmware.c,667 :: 		void create_frame_buffer( void )
;matrixrgb_firmware.c,669 :: 		uint16_t size = p_width * p_height;
LDA.S	R1, _p_height+0
LDA.S	R0, _p_width+0
MUL.L	R0, R0, R1
; size start address is: 36 (R9)
BEXTU.L	R9, R0, #0
;matrixrgb_firmware.c,671 :: 		MM_Init();
CALL	_MM_Init+0
;matrixrgb_firmware.c,672 :: 		FB = Malloc( sizeof( uint8_t ) * size );
BEXTU.L	R0, R9, #0
CALL	_Malloc+0
STA.L	_FB+0, R0
;matrixrgb_firmware.c,673 :: 		memset( FB, 0, size );
BEXTS.L	R2, R9, #0
; size end address is: 36 (R9)
LDK.L	R1, #0
CALL	_memset+0
;matrixrgb_firmware.c,674 :: 		}
L_end_create_frame_buffer:
RETURN	
; end of _create_frame_buffer
_refresh:
;matrixrgb_firmware.c,676 :: 		void refresh( void )
;matrixrgb_firmware.c,681 :: 		reset_row();
CALL	_reset_row+0
;matrixrgb_firmware.c,682 :: 		for ( i = 0, j = 8; i < 8; i++, j++ )
; i start address is: 28 (R7)
LDK.L	R7, #0
; j start address is: 24 (R6)
LDK.L	R6, #8
; i end address is: 28 (R7)
; j end address is: 24 (R6)
L_refresh65:
; j start address is: 24 (R6)
; i start address is: 28 (R7)
CMP.B	R7, #8
JMPC	R30, C, #0, L_refresh66
;matrixrgb_firmware.c,684 :: 		Latch_Off();
LDA.x	R0, #AlignedAddress(GPIO_PIN44_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN44_bit+0)=0
STI.x	GPIO_PIN44_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,685 :: 		for ( p = 0; p < shift_reg; p++ )
; p start address is: 32 (R8)
LDK.L	R8, #0
; p end address is: 32 (R8)
; i end address is: 28 (R7)
; j end address is: 24 (R6)
L_refresh68:
; p start address is: 32 (R8)
; i start address is: 28 (R7)
; j start address is: 24 (R6)
LDA.L	R0, _shift_reg+0
CMP.L	R8, R0
JMPC	R30, C, #0, L_refresh69
;matrixrgb_firmware.c,687 :: 		Led_Matrix_Data = 0;
LDK.L	R0, #0
STA.B	GPIO_PORT_08_15+0, R0
;matrixrgb_firmware.c,688 :: 		Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 4 ) << 1;
LDA.L	R5, _shift_reg+0
MUL.L	R0, R5, R6
ADD.L	R0, R0, R8
LDA.L	R4, _FB+0
ADD.L	R3, R4, R0
LDI.B	R0, R3, #0
AND.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R2, R0, #1
STA.B	GPIO_PORT_08_15+0, R2
;matrixrgb_firmware.c,689 :: 		Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 2 ) << 3;
LDI.B	R0, R3, #0
AND.L	R0, R0, #2
BEXTU.L	R0, R0, #256
ASHL.L	R1, R0, #3
BEXTU.L	R1, R1, #0
BEXTU.L	R0, R2, #256
OR.L	R2, R0, R1
STA.B	GPIO_PORT_08_15+0, R2
;matrixrgb_firmware.c,690 :: 		Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 1 ) << 5;
LDI.B	R0, R3, #0
AND.L	R0, R0, #1
BEXTU.L	R0, R0, #256
ASHL.L	R1, R0, #5
BEXTU.L	R1, R1, #0
BEXTU.L	R0, R2, #256
OR.L	R3, R0, R1
STA.B	GPIO_PORT_08_15+0, R3
;matrixrgb_firmware.c,691 :: 		Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 4 ) >> 2;
MUL.L	R0, R5, R7
ADD.L	R0, R0, R8
ADD.L	R2, R4, R0
LDI.B	R0, R2, #0
AND.L	R0, R0, #4
BEXTU.L	R0, R0, #256
LSHR.L	R1, R0, #2
BEXTU.L	R1, R1, #256
BEXTU.L	R0, R3, #256
OR.L	R1, R0, R1
BEXTU.L	R1, R1, #256
STA.B	GPIO_PORT_08_15+0, R1
;matrixrgb_firmware.c,692 :: 		Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 2 );
LDI.B	R0, R2, #0
AND.L	R0, R0, #2
BEXTU.L	R0, R0, #256
OR.L	R1, R1, R0
BEXTU.L	R1, R1, #256
STA.B	GPIO_PORT_08_15+0, R1
;matrixrgb_firmware.c,693 :: 		Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 1 ) << 2;
LDI.B	R0, R2, #0
AND.L	R0, R0, #1
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #2
BEXTU.L	R0, R0, #0
OR.L	R0, R1, R0
STA.B	GPIO_PORT_08_15+0, R0
;matrixrgb_firmware.c,694 :: 		Clk_Toggle();
LPM.L	R28, #31
NOP	
L_refresh71:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_refresh71
JMP	$+8
	#31
NOP	
NOP	
LDA.x	R0, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN45_bit+0)=1
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R0)
NOP	
NOP	
NOP	
LPM.L	R28, #31
NOP	
L_refresh73:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_refresh73
JMP	$+8
	#31
NOP	
NOP	
LDA.x	R0, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN45_bit+0)=0
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,685 :: 		for ( p = 0; p < shift_reg; p++ )
ADD.L	R8, R8, #1
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,695 :: 		}
; p end address is: 32 (R8)
JMP	L_refresh68
L_refresh69:
;matrixrgb_firmware.c,696 :: 		inc_row();
CALL	_inc_row+0
;matrixrgb_firmware.c,697 :: 		Latch_On();
LDA.x	R0, #AlignedAddress(GPIO_PIN44_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN44_bit+0)=1
STI.x	GPIO_PIN44_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,682 :: 		for ( i = 0, j = 8; i < 8; i++, j++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #256
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,698 :: 		}
; i end address is: 28 (R7)
; j end address is: 24 (R6)
JMP	L_refresh65
L_refresh66:
;matrixrgb_firmware.c,699 :: 		}
L_end_refresh:
RETURN	
; end of _refresh
_inc_row:
;matrixrgb_firmware.c,701 :: 		void inc_row( void )
;matrixrgb_firmware.c,704 :: 		if (currRow == ROW_EIGHT )
LDA.B	R0, _currRow+0
CMP.B	R0, #8
JMPC	R30, Z, #0, L_inc_row75
;matrixrgb_firmware.c,705 :: 		currRow = ROW_ONE;
LDK.L	R0, #15
STA.B	_currRow+0, R0
JMP	L_inc_row76
L_inc_row75:
;matrixrgb_firmware.c,707 :: 		currRow++;
LDA.B	R0, _currRow+0
ADD.L	R0, R0, #1
STA.B	_currRow+0, R0
L_inc_row76:
;matrixrgb_firmware.c,711 :: 		Led_Matrix_OE = 1;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=1
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,712 :: 		Led_Matrix_A = currRow;
LDA.B	R2, _currRow+0
LDA.x	R0, #AlignedAddress(GPIO_PIN32_bit+0)
LDL.L	R30, R2, #BitPos(GPIO_PIN32_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN32_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,713 :: 		Led_Matrix_B = currRow >> 1;
LSHR.L	R1, R2, #1
LDA.x	R0, #AlignedAddress(GPIO_PIN33_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN33_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN33_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,714 :: 		Led_Matrix_C = currRow >> 2;
LSHR.L	R1, R2, #2
LDA.x	R0, #AlignedAddress(GPIO_PIN34_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN34_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN34_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,715 :: 		Led_Matrix_D = currRow >> 3;
LSHR.L	R1, R2, #3
LDA.x	R0, #AlignedAddress(GPIO_PIN35_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN35_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN35_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,720 :: 		Led_Matrix_OE = 0;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=0
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,723 :: 		}
L_end_inc_row:
RETURN	
; end of _inc_row
_reset_row:
;matrixrgb_firmware.c,725 :: 		void reset_row( void )
;matrixrgb_firmware.c,727 :: 		currRow = ROW_ONE;
LDK.L	R0, #15
STA.B	_currRow+0, R0
;matrixrgb_firmware.c,729 :: 		Led_Matrix_OE = 1;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=1
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,730 :: 		Led_Matrix_A = currRow;
LDA.x	R0, #AlignedAddress(GPIO_PIN32_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN32_bit+0)=15
STI.x	GPIO_PIN32_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,731 :: 		Led_Matrix_B = currRow >> 1;
LDA.B	R2, _currRow+0
LSHR.L	R1, R2, #1
LDA.x	R0, #AlignedAddress(GPIO_PIN33_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN33_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN33_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,732 :: 		Led_Matrix_C = currRow >> 2;
LSHR.L	R1, R2, #2
LDA.x	R0, #AlignedAddress(GPIO_PIN34_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN34_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN34_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,733 :: 		Led_Matrix_D = currRow >> 3;
LSHR.L	R1, R2, #3
LDA.x	R0, #AlignedAddress(GPIO_PIN35_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN35_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN35_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,738 :: 		Led_Matrix_OE = 0;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=0
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,741 :: 		}
L_end_reset_row:
RETURN	
; end of _reset_row
_clear_frame_buffer:
;matrixrgb_firmware.c,743 :: 		void clear_frame_buffer( void )
;matrixrgb_firmware.c,746 :: 		uint8_t *ptr = FB;
; ptr start address is: 12 (R3)
LDA.L	R3, _FB+0
;matrixrgb_firmware.c,747 :: 		uint8_t zero = 0x00;
; zero start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,749 :: 		for ( i = 0; i < ( p_width * p_height ); i++ )
; i start address is: 16 (R4)
LDK.L	R4, #0
; i end address is: 16 (R4)
L_clear_frame_buffer77:
; i start address is: 16 (R4)
; zero start address is: 8 (R2)
; zero end address is: 8 (R2)
; ptr start address is: 12 (R3)
; ptr end address is: 12 (R3)
LDA.S	R1, _p_height+0
LDA.S	R0, _p_width+0
MUL.L	R0, R0, R1
CMP.S	R4, R0
JMPC	R30, C, #0, L_clear_frame_buffer78
; zero end address is: 8 (R2)
; ptr end address is: 12 (R3)
;matrixrgb_firmware.c,750 :: 		ptr[i] = zero;
; ptr start address is: 12 (R3)
; zero start address is: 8 (R2)
ADD.L	R0, R3, R4
STI.B	R0, #0, R2
;matrixrgb_firmware.c,749 :: 		for ( i = 0; i < ( p_width * p_height ); i++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #0
;matrixrgb_firmware.c,750 :: 		ptr[i] = zero;
; zero end address is: 8 (R2)
; ptr end address is: 12 (R3)
; i end address is: 16 (R4)
JMP	L_clear_frame_buffer77
L_clear_frame_buffer78:
;matrixrgb_firmware.c,751 :: 		}
L_end_clear_frame_buffer:
RETURN	
; end of _clear_frame_buffer
_write_text:
;matrixrgb_firmware.c,753 :: 		void write_text( uint8_t *text, color_t color, uint16_t start_row, uint16_t start_col )
; start_col start address is: 8 (R2)
; start_row start address is: 4 (R1)
; text start address is: 0 (R0)
LINK	LR, #256
BEXTU.L	R3, R1, #0
MOVE.L	R1, R0
; start_col end address is: 8 (R2)
; start_row end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 4 (R1)
; start_row start address is: 12 (R3)
; start_col start address is: 8 (R2)
;matrixrgb_firmware.c,755 :: 		char *ptr = text;
; ptr start address is: 0 (R0)
MOVE.L	R0, R1
; text end address is: 4 (R1)
;matrixrgb_firmware.c,756 :: 		uint8_t text_frame[256] = { 0 };
ADD.L	R27, SP, #0
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSwrite_text_text_frame_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,759 :: 		uint8_t cnt = 0;
;matrixrgb_firmware.c,761 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 20 (R5)
LDK.L	R5, #0
;matrixrgb_firmware.c,762 :: 		uint16_t curr_row = start_row;    //Current row and column are top left of letter
; curr_row start address is: 4 (R1)
BEXTU.L	R1, R3, #0
; start_row end address is: 12 (R3)
;matrixrgb_firmware.c,763 :: 		uint16_t curr_col = start_col;
; curr_col start address is: 16 (R4)
BEXTU.L	R4, R2, #0
;matrixrgb_firmware.c,765 :: 		if ( ptr == NULL )          //Sanity check
CMP.L	R0, #0
JMPC	R30, Z, #0, L_write_text80
; start_col end address is: 8 (R2)
; ptr end address is: 0 (R0)
; curr_col end address is: 16 (R4)
; color_buffer end address is: 20 (R5)
; curr_row end address is: 4 (R1)
;matrixrgb_firmware.c,766 :: 		return;
JMP	L_end_write_text
L_write_text80:
;matrixrgb_firmware.c,768 :: 		if ( color.red  > 0 )       //Create color for frame
; curr_row start address is: 4 (R1)
; color_buffer start address is: 20 (R5)
; curr_col start address is: 16 (R4)
; ptr start address is: 0 (R0)
; start_col start address is: 8 (R2)
ADD.L	R3, SP, #264
LDI.B	R3, R3, #0
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_text294
;matrixrgb_firmware.c,769 :: 		color_buffer |= 0x04;
OR.L	R5, R5, #4
BEXTU.L	R5, R5, #256
; color_buffer end address is: 20 (R5)
JMP	L_write_text81
L__write_text294:
;matrixrgb_firmware.c,768 :: 		if ( color.red  > 0 )       //Create color for frame
;matrixrgb_firmware.c,769 :: 		color_buffer |= 0x04;
L_write_text81:
;matrixrgb_firmware.c,770 :: 		if ( color.green > 0 )
; color_buffer start address is: 20 (R5)
ADD.L	R3, SP, #265
LDI.B	R3, R3, #0
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_text295
;matrixrgb_firmware.c,771 :: 		color_buffer |= 0x02;
OR.L	R5, R5, #2
BEXTU.L	R5, R5, #256
; color_buffer end address is: 20 (R5)
JMP	L_write_text82
L__write_text295:
;matrixrgb_firmware.c,770 :: 		if ( color.green > 0 )
;matrixrgb_firmware.c,771 :: 		color_buffer |= 0x02;
L_write_text82:
;matrixrgb_firmware.c,772 :: 		if ( color.blue > 0 )
; color_buffer start address is: 20 (R5)
ADD.L	R3, SP, #266
LDI.B	R3, R3, #0
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_text296
;matrixrgb_firmware.c,773 :: 		color_buffer |= 0x01;
OR.L	R3, R5, #1
BEXTU.L	R5, R3, #256
; color_buffer end address is: 20 (R5)
BEXTU.L	R17, R5, #256
JMP	L_write_text83
L__write_text296:
;matrixrgb_firmware.c,772 :: 		if ( color.blue > 0 )
BEXTU.L	R17, R5, #256
;matrixrgb_firmware.c,773 :: 		color_buffer |= 0x01;
L_write_text83:
;matrixrgb_firmware.c,775 :: 		while ( *ptr != NULL )
; color_buffer start address is: 68 (R17)
BEXTU.L	R15, R2, #0
; start_col end address is: 8 (R2)
; ptr end address is: 0 (R0)
; curr_col end address is: 16 (R4)
; color_buffer end address is: 68 (R17)
; curr_row end address is: 4 (R1)
MOVE.L	R16, R0
BEXTU.L	R8, R1, #0
BEXTU.L	R7, R4, #0
L_write_text84:
; color_buffer start address is: 68 (R17)
; curr_col start address is: 28 (R7)
; curr_row start address is: 32 (R8)
; ptr start address is: 64 (R16)
; start_col start address is: 60 (R15)
LDI.B	R3, R16, #0
CMP.B	R3, #0
JMPC	R30, Z, #1, L_write_text85
;matrixrgb_firmware.c,777 :: 		cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,778 :: 		for ( k = 0; k < 16; k++ )
; k start address is: 44 (R11)
LDK.L	R11, #0
; cnt end address is: 0 (R0)
; start_col end address is: 60 (R15)
; curr_row end address is: 32 (R8)
; curr_col end address is: 28 (R7)
; color_buffer end address is: 68 (R17)
; k end address is: 44 (R11)
; ptr end address is: 64 (R16)
L_write_text86:
; k start address is: 44 (R11)
; cnt start address is: 0 (R0)
; start_col start address is: 60 (R15)
; ptr start address is: 64 (R16)
; curr_row start address is: 32 (R8)
; curr_col start address is: 28 (R7)
; color_buffer start address is: 68 (R17)
CMP.B	R11, #16
JMPC	R30, C, #0, L_write_text87
;matrixrgb_firmware.c,780 :: 		temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
LDI.B	R3, R16, #0
ASHL.L	R4, R3, #5
BEXTS.L	R4, R4, #0
LDK.L	R3, #1024
SUB.L	R3, R4, R3
BEXTS.L	R3, R3, #0
ADD.L	R5, R3, R0
BEXTS.L	R5, R5, #0
LDK.L	R4, #_Dejavu18_Bitmaps+0
ADD.L	R3, R4, R5
LPMI.B	R6, R3, #0
; temp start address is: 24 (R6)
;matrixrgb_firmware.c,781 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
ADD.L	R3, R5, #1
BEXTS.L	R3, R3, #0
ADD.L	R3, R4, R3
LPMI.B	R1, R3, #0
; temp_2 start address is: 4 (R1)
;matrixrgb_firmware.c,782 :: 		for ( j = 0; j < 8; j++ )
; j start address is: 20 (R5)
LDK.L	R5, #0
; temp_2 end address is: 4 (R1)
; cnt end address is: 0 (R0)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
; start_col end address is: 60 (R15)
; curr_row end address is: 32 (R8)
; curr_col end address is: 28 (R7)
; color_buffer end address is: 68 (R17)
; k end address is: 44 (R11)
; ptr end address is: 64 (R16)
BEXTU.L	R10, R15, #0
MOVE.L	R9, R16
BEXTU.L	R2, R17, #256
L_write_text89:
; j start address is: 20 (R5)
; temp_2 start address is: 4 (R1)
; temp start address is: 24 (R6)
; color_buffer start address is: 8 (R2)
; curr_col start address is: 28 (R7)
; curr_row start address is: 32 (R8)
; ptr start address is: 36 (R9)
; start_col start address is: 40 (R10)
; cnt start address is: 0 (R0)
; k start address is: 44 (R11)
CMP.B	R5, #8
JMPC	R30, C, #0, L_write_text90
;matrixrgb_firmware.c,784 :: 		if ( ( temp & 0x80 ) > 0x00 )
AND.L	R3, R6, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_write_text92
;matrixrgb_firmware.c,785 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R3, R11, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R3, R3, R4
STI.B	R3, #0, R2
JMP	L_write_text93
L_write_text92:
;matrixrgb_firmware.c,787 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R3, R11, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_write_text93:
;matrixrgb_firmware.c,788 :: 		temp = ( temp << 1 );
BEXTU.L	R3, R6, #256
; temp end address is: 24 (R6)
ASHL.L	R3, R3, #1
; temp start address is: 24 (R6)
BEXTU.L	R6, R3, #256
;matrixrgb_firmware.c,782 :: 		for ( j = 0; j < 8; j++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,789 :: 		}
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
JMP	L_write_text89
L_write_text90:
;matrixrgb_firmware.c,790 :: 		for ( j = 8; j < 16; j++ )
; j start address is: 12 (R3)
LDK.L	R3, #8
; temp_2 end address is: 4 (R1)
; color_buffer end address is: 8 (R2)
; ptr end address is: 36 (R9)
; start_col end address is: 40 (R10)
; cnt end address is: 0 (R0)
; j end address is: 12 (R3)
; curr_row end address is: 32 (R8)
; curr_col end address is: 28 (R7)
; k end address is: 44 (R11)
BEXTU.L	R5, R1, #256
BEXTU.L	R1, R0, #256
BEXTU.L	R0, R11, #256
BEXTU.L	R17, R2, #256
BEXTU.L	R2, R3, #256
MOVE.L	R16, R9
BEXTU.L	R15, R10, #0
L_write_text94:
; j start address is: 8 (R2)
; k start address is: 0 (R0)
; cnt start address is: 4 (R1)
; start_col start address is: 60 (R15)
; ptr start address is: 64 (R16)
; curr_row start address is: 32 (R8)
; curr_col start address is: 28 (R7)
; color_buffer start address is: 68 (R17)
; temp_2 start address is: 20 (R5)
CMP.B	R2, #16
JMPC	R30, C, #0, L_write_text95
;matrixrgb_firmware.c,792 :: 		if ( ( temp_2 & 0x80 ) > 0x00 )
AND.L	R3, R5, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_write_text97
;matrixrgb_firmware.c,793 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R3, R0, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R3, R3, R4
STI.B	R3, #0, R17
JMP	L_write_text98
L_write_text97:
;matrixrgb_firmware.c,795 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R3, R0, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_write_text98:
;matrixrgb_firmware.c,796 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R3, R5, #256
; temp_2 end address is: 20 (R5)
ASHL.L	R3, R3, #1
; temp_2 start address is: 20 (R5)
BEXTU.L	R5, R3, #256
;matrixrgb_firmware.c,790 :: 		for ( j = 8; j < 16; j++ )
ADD.L	R2, R2, #1
BEXTU.L	R2, R2, #256
;matrixrgb_firmware.c,797 :: 		}
; temp_2 end address is: 20 (R5)
; j end address is: 8 (R2)
JMP	L_write_text94
L_write_text95:
;matrixrgb_firmware.c,798 :: 		cnt += 2;
ADD.L	R3, R1, #2
BEXTU.L	R1, R3, #256
;matrixrgb_firmware.c,778 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R3, R0, #1
; k end address is: 0 (R0)
; k start address is: 44 (R11)
BEXTU.L	R11, R3, #256
;matrixrgb_firmware.c,799 :: 		}
; cnt end address is: 4 (R1)
; k end address is: 44 (R11)
BEXTU.L	R0, R1, #256
JMP	L_write_text86
L_write_text87:
;matrixrgb_firmware.c,801 :: 		font_width = Dejavu18_Widths[ *ptr - 32 ];
LDI.B	R3, R16, #0
SUB.L	R4, R3, #32
BEXTS.L	R4, R4, #0
LDK.L	R3, #_Dejavu18_Widths+0
ADD.L	R3, R3, R4
LDI.B	R3, R3, #0
; font_width start address is: 72 (R18)
BEXTU.L	R18, R3, #256
;matrixrgb_firmware.c,802 :: 		if ( ( curr_col + font_width ) >= p_width )
ADD.L	R4, R7, R3
LDA.S	R3, _p_width+0
CMP.S	R4, R3
JMPC	R30, C, #1, L__write_text297
; curr_col end address is: 28 (R7)
;matrixrgb_firmware.c,804 :: 		curr_row += 16;
ADD.L	R19, R8, #16
BEXTU.L	R19, R19, #0
; curr_row end address is: 32 (R8)
; curr_row start address is: 76 (R19)
;matrixrgb_firmware.c,805 :: 		curr_col = start_col;
; curr_col start address is: 80 (R20)
BEXTU.L	R20, R15, #0
; curr_col end address is: 80 (R20)
; curr_row end address is: 76 (R19)
;matrixrgb_firmware.c,806 :: 		}
JMP	L_write_text99
L__write_text297:
;matrixrgb_firmware.c,802 :: 		if ( ( curr_col + font_width ) >= p_width )
BEXTU.L	R20, R7, #0
BEXTU.L	R19, R8, #0
;matrixrgb_firmware.c,806 :: 		}
L_write_text99:
;matrixrgb_firmware.c,807 :: 		write_letter( text_frame, font_width, curr_row, curr_col );
; curr_col start address is: 80 (R20)
; curr_row start address is: 76 (R19)
ADD.L	R3, SP, #0
BEXTU.L	R2, R19, #0
BEXTU.L	R1, R18, #256
MOVE.L	R0, R3
BEXTU.L	R3, R20, #0
CALL	_write_letter+0
;matrixrgb_firmware.c,808 :: 		curr_col += font_width;
ADD.L	R4, R20, R18
BEXTU.L	R4, R4, #0
; font_width end address is: 72 (R18)
; curr_col end address is: 80 (R20)
; curr_col start address is: 0 (R0)
BEXTU.L	R0, R4, #0
;matrixrgb_firmware.c,810 :: 		if ( curr_col >= shift_reg )
LDA.L	R3, _shift_reg+0
CMP.L	R4, R3
JMPC	R30, C, #1, L__write_text298
; curr_col end address is: 0 (R0)
;matrixrgb_firmware.c,812 :: 		curr_row += 16;
ADD.L	R1, R19, #16
BEXTU.L	R1, R1, #0
; curr_row end address is: 76 (R19)
; curr_row start address is: 4 (R1)
;matrixrgb_firmware.c,813 :: 		curr_col = start_col;
; curr_col start address is: 0 (R0)
BEXTU.L	R0, R15, #0
; curr_col end address is: 0 (R0)
; curr_row end address is: 4 (R1)
;matrixrgb_firmware.c,814 :: 		}
JMP	L_write_text100
L__write_text298:
;matrixrgb_firmware.c,810 :: 		if ( curr_col >= shift_reg )
BEXTU.L	R1, R19, #0
;matrixrgb_firmware.c,814 :: 		}
L_write_text100:
;matrixrgb_firmware.c,815 :: 		ptr++;
; curr_col start address is: 0 (R0)
; curr_row start address is: 4 (R1)
ADD.L	R16, R16, #1
;matrixrgb_firmware.c,816 :: 		}
; start_col end address is: 60 (R15)
; color_buffer end address is: 68 (R17)
; curr_col end address is: 0 (R0)
; curr_row end address is: 4 (R1)
; ptr end address is: 64 (R16)
BEXTU.L	R8, R1, #0
BEXTU.L	R7, R0, #0
JMP	L_write_text84
L_write_text85:
;matrixrgb_firmware.c,818 :: 		}
L_end_write_text:
UNLINK	LR
RETURN	
; end of _write_text
_write_letter:
;matrixrgb_firmware.c,820 :: 		void write_letter( uint8_t *text_frame, uint8_t width, uint16_t current_row, uint16_t current_col )
; current_col start address is: 12 (R3)
; current_row start address is: 8 (R2)
; width start address is: 4 (R1)
; text_frame start address is: 0 (R0)
LINK	LR, #4
BEXTU.L	R4, R2, #0
; current_col end address is: 12 (R3)
; current_row end address is: 8 (R2)
; width end address is: 4 (R1)
; text_frame end address is: 0 (R0)
; text_frame start address is: 0 (R0)
; width start address is: 4 (R1)
; current_row start address is: 16 (R4)
; current_col start address is: 12 (R3)
;matrixrgb_firmware.c,824 :: 		uint8_t row = current_row;
; row start address is: 8 (R2)
BEXTU.L	R2, R4, #256
; current_row end address is: 16 (R4)
;matrixrgb_firmware.c,825 :: 		uint8_t col = current_col;
; col start address is: 16 (R4)
BEXTU.L	R4, R3, #256
; current_col end address is: 12 (R3)
;matrixrgb_firmware.c,833 :: 		for ( m = 0; m < width; m++ )
; m start address is: 12 (R3)
LDK.L	R3, #0
; text_frame end address is: 0 (R0)
; width end address is: 4 (R1)
; row end address is: 8 (R2)
; col end address is: 16 (R4)
; m end address is: 12 (R3)
MOVE.L	R9, R0
BEXTU.L	R10, R1, #256
BEXTU.L	R11, R2, #256
BEXTU.L	R12, R4, #256
BEXTU.L	R13, R3, #256
L_write_letter101:
; m start address is: 52 (R13)
; col start address is: 48 (R12)
; row start address is: 44 (R11)
; width start address is: 40 (R10)
; text_frame start address is: 36 (R9)
CMP.B	R13, R10
JMPC	R30, C, #0, L_write_letter102
;matrixrgb_firmware.c,836 :: 		for ( k = 0; k < 16; k++ )
; k start address is: 56 (R14)
LDK.L	R14, #0
; text_frame end address is: 36 (R9)
; width end address is: 40 (R10)
; row end address is: 44 (R11)
; col end address is: 48 (R12)
; k end address is: 56 (R14)
; m end address is: 52 (R13)
L_write_letter104:
; k start address is: 56 (R14)
; text_frame start address is: 36 (R9)
; width start address is: 40 (R10)
; row start address is: 44 (R11)
; col start address is: 48 (R12)
; m start address is: 52 (R13)
CMP.B	R14, #16
JMPC	R30, C, #0, L_write_letter105
;matrixrgb_firmware.c,838 :: 		red = text_frame[( k * 16 + m )] & 0x04;
BEXTU.L	R4, R14, #256
ASHL.L	R4, R4, #4
BEXTS.L	R4, R4, #0
ADD.L	R4, R4, R13
BEXTS.L	R4, R4, #0
ADD.L	R4, R9, R4
LDI.B	R4, R4, #0
AND.L	R8, R4, #4
;matrixrgb_firmware.c,839 :: 		green = text_frame[( k * 16 + m )] & 0x02;
AND.L	R7, R4, #2
;matrixrgb_firmware.c,840 :: 		blue = text_frame[( k * 16 + m )] & 0x01;
AND.L	R6, R4, #1
;matrixrgb_firmware.c,841 :: 		write_pixel( row + k, col + m, red, green, blue );
ADD.L	R5, R12, R13
ADD.L	R4, R11, R14
BEXTU.L	R3, R7, #256
BEXTU.L	R2, R8, #256
BEXTU.L	R1, R5, #0
BEXTU.L	R0, R4, #0
BEXTU.L	R4, R6, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,836 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R14, R14, #1
BEXTU.L	R14, R14, #256
;matrixrgb_firmware.c,842 :: 		}
; k end address is: 56 (R14)
JMP	L_write_letter104
L_write_letter105:
;matrixrgb_firmware.c,833 :: 		for ( m = 0; m < width; m++ )
ADD.L	R13, R13, #1
BEXTU.L	R13, R13, #256
;matrixrgb_firmware.c,844 :: 		}
; text_frame end address is: 36 (R9)
; width end address is: 40 (R10)
; row end address is: 44 (R11)
; col end address is: 48 (R12)
; m end address is: 52 (R13)
JMP	L_write_letter101
L_write_letter102:
;matrixrgb_firmware.c,847 :: 		}
L_end_write_letter:
UNLINK	LR
RETURN	
; end of _write_letter
_image_load:
;matrixrgb_firmware.c,849 :: 		void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
; cnt start address is: 44 (R11)
; bmp start address is: 0 (R0)
LINK	LR, #4
;matrixrgb_firmware.c,854 :: 		cnt = 0;
;matrixrgb_firmware.c,849 :: 		void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
;matrixrgb_firmware.c,854 :: 		cnt = 0;
;matrixrgb_firmware.c,849 :: 		void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
MOVE.L	R1, R0
; cnt end address is: 44 (R11)
; bmp end address is: 0 (R0)
; bmp start address is: 4 (R1)
;matrixrgb_firmware.c,854 :: 		cnt = 0;
; cnt start address is: 44 (R11)
LDK.L	R11, #0
;matrixrgb_firmware.c,856 :: 		for (row = 0; row < 16; row++)
; row start address is: 0 (R0)
LDK.L	R0, #0
; bmp end address is: 4 (R1)
; row end address is: 0 (R0)
; cnt end address is: 44 (R11)
MOVE.L	R8, R1
BEXTS.L	R9, R0, #0
L_image_load107:
; row start address is: 36 (R9)
; cnt start address is: 44 (R11)
; bmp start address is: 32 (R8)
CMP.S	R9, #16
JMPC	R30, GTE, #1, L_image_load108
;matrixrgb_firmware.c,857 :: 		for (column = 0; column < 64; column++)
; column start address is: 40 (R10)
LDK.L	R10, #0
; bmp end address is: 32 (R8)
; cnt end address is: 44 (R11)
; column end address is: 40 (R10)
; row end address is: 36 (R9)
L_image_load110:
; column start address is: 40 (R10)
; bmp start address is: 32 (R8)
; cnt start address is: 44 (R11)
; row start address is: 36 (R9)
CMP.S	R10, #64
JMPC	R30, GTE, #1, L_image_load111
;matrixrgb_firmware.c,859 :: 		tmpCol = bmp[cnt] + (bmp[cnt + 1] << 8);
ADD.L	R3, R8, R11
LDI.B	R4, R3, #0
ADD.L	R3, R11, #1
BEXTU.L	R3, R3, #0
ADD.L	R3, R8, R3
LDI.B	R3, R3, #0
ASHL.L	R3, R3, #8
BEXTU.L	R3, R3, #0
ADD.L	R3, R4, R3
; tmpCol start address is: 0 (R0)
BEXTU.L	R0, R3, #0
;matrixrgb_firmware.c,861 :: 		if (tmpCol != 0)
CMP.S	R3, #0
JMPC	R30, Z, #1, L_image_load113
;matrixrgb_firmware.c,862 :: 		asm nop;
NOP	
L_image_load113:
;matrixrgb_firmware.c,864 :: 		red = tmpCol >> 11;
BEXTU.L	R3, R0, #0
LSHR.L	R5, R3, #11
;matrixrgb_firmware.c,865 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R3, #2047
AND.L	R3, R0, R3
BEXTU.L	R3, R3, #0
LSHR.L	R4, R3, #5
;matrixrgb_firmware.c,866 :: 		blue = tmpCol & 0x1F;
AND.L	R3, R0, #31
; tmpCol end address is: 0 (R0)
;matrixrgb_firmware.c,867 :: 		write_pixel_img(row, column, red, green, blue);
STI.S	SP, #0, R4
BEXTU.L	R2, R5, #256
BEXTU.L	R1, R10, #0
BEXTU.L	R0, R9, #0
BEXTU.L	R4, R3, #256
LDI.B	R3, SP, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,868 :: 		cnt += 2;
ADD.L	R11, R11, #2
BEXTU.L	R11, R11, #0
;matrixrgb_firmware.c,857 :: 		for (column = 0; column < 64; column++)
ADD.L	R10, R10, #1
BEXTS.L	R10, R10, #0
;matrixrgb_firmware.c,869 :: 		}
; column end address is: 40 (R10)
JMP	L_image_load110
L_image_load111:
;matrixrgb_firmware.c,856 :: 		for (row = 0; row < 16; row++)
ADD.L	R9, R9, #1
BEXTS.L	R9, R9, #0
;matrixrgb_firmware.c,869 :: 		}
; bmp end address is: 32 (R8)
; cnt end address is: 44 (R11)
; row end address is: 36 (R9)
JMP	L_image_load107
L_image_load108:
;matrixrgb_firmware.c,870 :: 		}
L_end_image_load:
UNLINK	LR
RETURN	
; end of _image_load
_scroll_image_right:
;matrixrgb_firmware.c,872 :: 		void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
; speed start address is: 12 (R3)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; bmp start address is: 0 (R0)
LINK	LR, #1024
BEXTU.L	R4, R3, #0
BEXTU.L	R3, R2, #256
BEXTU.L	R2, R1, #256
MOVE.L	R1, R0
; speed end address is: 12 (R3)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
; bmp end address is: 0 (R0)
; bmp start address is: 4 (R1)
; width start address is: 8 (R2)
; height start address is: 12 (R3)
; speed start address is: 16 (R4)
;matrixrgb_firmware.c,878 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,879 :: 		cnt = 0;
; cnt start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,881 :: 		for ( row = 0; row < 16; row++ )
; row start address is: 0 (R0)
LDK.L	R0, #0
; bmp end address is: 4 (R1)
; width end address is: 8 (R2)
; height end address is: 12 (R3)
; speed end address is: 16 (R4)
; row end address is: 0 (R0)
; cnt end address is: 32 (R8)
BEXTS.L	R6, R0, #0
MOVE.L	R0, R1
BEXTU.L	R1, R2, #256
BEXTU.L	R2, R3, #256
BEXTU.L	R3, R4, #0
L_scroll_image_right114:
; row start address is: 24 (R6)
; cnt start address is: 32 (R8)
; speed start address is: 12 (R3)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; bmp start address is: 0 (R0)
CMP.S	R6, #16
JMPC	R30, GTE, #1, L_scroll_image_right115
;matrixrgb_firmware.c,882 :: 		for (column = 0; column < ( ( height * width ) * 32 ); column++)
; column start address is: 28 (R7)
LDK.L	R7, #0
; bmp end address is: 0 (R0)
; width end address is: 4 (R1)
; height end address is: 8 (R2)
; speed end address is: 12 (R3)
; cnt end address is: 32 (R8)
; column end address is: 28 (R7)
; row end address is: 24 (R6)
L_scroll_image_right117:
; column start address is: 28 (R7)
; bmp start address is: 0 (R0)
; width start address is: 4 (R1)
; height start address is: 8 (R2)
; speed start address is: 12 (R3)
; cnt start address is: 32 (R8)
; row start address is: 24 (R6)
MUL.L	R4, R2, R1
BEXTS.L	R4, R4, #0
ASHL.L	R4, R4, #5
CMP.S	R7, R4
JMPC	R30, GTE, #1, L_scroll_image_right118
;matrixrgb_firmware.c,884 :: 		buffer = 0;
; buffer start address is: 36 (R9)
LDK.L	R9, #0
;matrixrgb_firmware.c,885 :: 		tmpCol = bmp[cnt] + (bmp[cnt + 1] << 8);
ADD.L	R4, R0, R8
LDI.B	R5, R4, #0
ADD.L	R4, R8, #1
BEXTU.L	R4, R4, #0
ADD.L	R4, R0, R4
LDI.B	R4, R4, #0
ASHL.L	R4, R4, #8
BEXTU.L	R4, R4, #0
ADD.L	R4, R5, R4
; tmpCol start address is: 44 (R11)
BEXTU.L	R11, R4, #0
;matrixrgb_firmware.c,887 :: 		if (tmpCol != 0)
CMP.S	R4, #0
JMPC	R30, Z, #1, L_scroll_image_right120
;matrixrgb_firmware.c,888 :: 		asm nop;
NOP	
L_scroll_image_right120:
;matrixrgb_firmware.c,890 :: 		red = tmpCol >> 11;
BEXTU.L	R4, R11, #0
LSHR.L	R5, R4, #11
;matrixrgb_firmware.c,891 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R4, #2047
AND.L	R4, R11, R4
BEXTU.L	R4, R4, #0
LSHR.L	R4, R4, #5
; green start address is: 40 (R10)
BEXTU.L	R10, R4, #256
;matrixrgb_firmware.c,892 :: 		blue = tmpCol & 0x1F;
AND.L	R4, R11, #31
; tmpCol end address is: 44 (R11)
; blue start address is: 44 (R11)
BEXTU.L	R11, R4, #256
;matrixrgb_firmware.c,893 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R4, R5, #256
AND.L	R4, R4, #24
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_right314
;matrixrgb_firmware.c,894 :: 		buffer |= 0x04;
OR.L	R5, R9, #4
BEXTU.L	R5, R5, #256
; buffer end address is: 36 (R9)
; buffer start address is: 20 (R5)
; buffer end address is: 20 (R5)
JMP	L_scroll_image_right121
L__scroll_image_right314:
;matrixrgb_firmware.c,893 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R5, R9, #256
;matrixrgb_firmware.c,894 :: 		buffer |= 0x04;
L_scroll_image_right121:
;matrixrgb_firmware.c,895 :: 		if ( ( green & 0x38 ) > 0 )
; buffer start address is: 20 (R5)
AND.L	R4, R10, #56
; green end address is: 40 (R10)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_right315
;matrixrgb_firmware.c,896 :: 		buffer |= 0x02;
OR.L	R4, R5, #2
BEXTU.L	R5, R4, #256
; buffer end address is: 20 (R5)
BEXTU.L	R9, R5, #256
JMP	L_scroll_image_right122
L__scroll_image_right315:
;matrixrgb_firmware.c,895 :: 		if ( ( green & 0x38 ) > 0 )
BEXTU.L	R9, R5, #256
;matrixrgb_firmware.c,896 :: 		buffer |= 0x02;
L_scroll_image_right122:
;matrixrgb_firmware.c,897 :: 		if ( ( blue & 0x18 ) > 0 )
; buffer start address is: 36 (R9)
AND.L	R4, R11, #24
; blue end address is: 44 (R11)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_right316
;matrixrgb_firmware.c,898 :: 		buffer |= 0x01;
OR.L	R9, R9, #1
BEXTU.L	R9, R9, #256
; buffer end address is: 36 (R9)
JMP	L_scroll_image_right123
L__scroll_image_right316:
;matrixrgb_firmware.c,897 :: 		if ( ( blue & 0x18 ) > 0 )
;matrixrgb_firmware.c,898 :: 		buffer |= 0x01;
L_scroll_image_right123:
;matrixrgb_firmware.c,899 :: 		image_frame[( row * shift_reg ) + column] = buffer;
; buffer start address is: 36 (R9)
LDA.L	R4, _shift_reg+0
MUL.L	R4, R6, R4
ADD.L	R5, R4, R7
ADD.L	R4, SP, #0
ADD.L	R4, R4, R5
STI.B	R4, #0, R9
; buffer end address is: 36 (R9)
;matrixrgb_firmware.c,900 :: 		cnt += 2;
ADD.L	R8, R8, #2
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,882 :: 		for (column = 0; column < ( ( height * width ) * 32 ); column++)
ADD.L	R7, R7, #1
BEXTS.L	R7, R7, #0
;matrixrgb_firmware.c,901 :: 		}
; column end address is: 28 (R7)
JMP	L_scroll_image_right117
L_scroll_image_right118:
;matrixrgb_firmware.c,881 :: 		for ( row = 0; row < 16; row++ )
ADD.L	R6, R6, #1
BEXTS.L	R6, R6, #0
;matrixrgb_firmware.c,901 :: 		}
; bmp end address is: 0 (R0)
; cnt end address is: 32 (R8)
; row end address is: 24 (R6)
JMP	L_scroll_image_right114
L_scroll_image_right115:
;matrixrgb_firmware.c,902 :: 		scroll_image_onto_left( image_frame, width, height, speed );
ADD.L	R4, SP, #0
; speed end address is: 12 (R3)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
MOVE.L	R0, R4
CALL	_scroll_image_onto_left+0
;matrixrgb_firmware.c,903 :: 		}
L_end_scroll_image_right:
UNLINK	LR
RETURN	
; end of _scroll_image_right
_scroll_image_onto_left:
;matrixrgb_firmware.c,905 :: 		void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
; m start address is: 48 (R12)
; height start address is: 8 (R2)
LINK	LR, #12
;matrixrgb_firmware.c,912 :: 		for ( m = 1; m <= width; m++ )
;matrixrgb_firmware.c,905 :: 		void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.L	SP, #0, R0
STI.B	SP, #4, R1
BEXTU.L	R10, R2, #256
;matrixrgb_firmware.c,912 :: 		for ( m = 1; m <= width; m++ )
;matrixrgb_firmware.c,905 :: 		void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.S	SP, #8, R3
; m end address is: 48 (R12)
; height end address is: 8 (R2)
; height start address is: 40 (R10)
;matrixrgb_firmware.c,908 :: 		uint16_t i = 0, j = 64;
;matrixrgb_firmware.c,909 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,912 :: 		for ( m = 1; m <= width; m++ )
; m start address is: 48 (R12)
LDK.L	R12, #1
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_left124:
; m start address is: 48 (R12)
; height start address is: 40 (R10)
LDI.B	R4, SP, #4
CMP.B	R12, R4
JMPC	R30, A, #1, L_scroll_image_onto_left125
;matrixrgb_firmware.c,914 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,916 :: 		for ( k = 0; k < height; k++ )
; k start address is: 32 (R8)
LDK.L	R8, #0
; k end address is: 32 (R8)
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_left127:
; k start address is: 32 (R8)
; height start address is: 40 (R10)
; m start address is: 48 (R12)
CMP.B	R8, R10
JMPC	R30, C, #0, L_scroll_image_onto_left128
;matrixrgb_firmware.c,918 :: 		buffer = bmp[( ( k + 1 ) * width ) - m];
ADD.L	R5, R8, #1
BEXTS.L	R5, R5, #0
LDI.B	R4, SP, #4
MUL.L	R4, R5, R4
BEXTS.L	R4, R4, #0
SUB.L	R5, R4, R12
BEXTS.L	R5, R5, #0
LDI.L	R4, SP, #0
ADD.L	R4, R4, R5
LDI.B	R4, R4, #0
;matrixrgb_firmware.c,919 :: 		red   = ( buffer & 0x04 );
AND.L	R6, R4, #4
;matrixrgb_firmware.c,920 :: 		green = ( buffer & 0x02 );
AND.L	R5, R4, #2
;matrixrgb_firmware.c,921 :: 		blue  = ( buffer & 0x01 );
AND.L	R4, R4, #1
;matrixrgb_firmware.c,922 :: 		write_pixel( k, 0, red, green, blue );
BEXTU.L	R3, R5, #256
BEXTU.L	R2, R6, #256
LDK.L	R1, #0
BEXTU.L	R0, R8, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,916 :: 		for ( k = 0; k < height; k++ )
ADD.L	R4, R8, #1
; k end address is: 32 (R8)
; k start address is: 52 (R13)
BEXTU.L	R13, R4, #256
;matrixrgb_firmware.c,923 :: 		}
; k end address is: 52 (R13)
BEXTU.L	R8, R13, #256
JMP	L_scroll_image_onto_left127
L_scroll_image_onto_left128:
;matrixrgb_firmware.c,925 :: 		for ( p = 0; p < speed; p++ )
; p start address is: 56 (R14)
LDK.L	R14, #0
; height end address is: 40 (R10)
; p end address is: 56 (R14)
; m end address is: 48 (R12)
BEXTU.L	R13, R12, #256
BEXTU.L	R9, R14, #256
L_scroll_image_onto_left130:
; p start address is: 36 (R9)
; m start address is: 52 (R13)
; height start address is: 40 (R10)
LDI.S	R4, SP, #8
CMP.S	R9, R4
JMPC	R30, C, #0, L_scroll_image_onto_left131
;matrixrgb_firmware.c,926 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,925 :: 		for ( p = 0; p < speed; p++ )
ADD.L	R4, R9, #1
; p end address is: 36 (R9)
; p start address is: 56 (R14)
BEXTU.L	R14, R4, #256
;matrixrgb_firmware.c,926 :: 		refresh();
; p end address is: 56 (R14)
BEXTU.L	R9, R14, #256
JMP	L_scroll_image_onto_left130
L_scroll_image_onto_left131:
;matrixrgb_firmware.c,912 :: 		for ( m = 1; m <= width; m++ )
ADD.L	R4, R13, #1
; m end address is: 52 (R13)
; m start address is: 48 (R12)
BEXTU.L	R12, R4, #256
;matrixrgb_firmware.c,928 :: 		}
; height end address is: 40 (R10)
; m end address is: 48 (R12)
JMP	L_scroll_image_onto_left124
L_scroll_image_onto_left125:
;matrixrgb_firmware.c,930 :: 		}
L_end_scroll_image_onto_left:
UNLINK	LR
RETURN	
; end of _scroll_image_onto_left
_scroll_image_left:
;matrixrgb_firmware.c,932 :: 		void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
; speed start address is: 12 (R3)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; bmp start address is: 0 (R0)
LINK	LR, #1024
BEXTU.L	R4, R3, #0
BEXTU.L	R3, R2, #256
BEXTU.L	R2, R1, #256
MOVE.L	R1, R0
; speed end address is: 12 (R3)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
; bmp end address is: 0 (R0)
; bmp start address is: 4 (R1)
; width start address is: 8 (R2)
; height start address is: 12 (R3)
; speed start address is: 16 (R4)
;matrixrgb_firmware.c,938 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,939 :: 		cnt = 0;
; cnt start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,941 :: 		for (row = 0; row < 16; row++)
; row start address is: 0 (R0)
LDK.L	R0, #0
; bmp end address is: 4 (R1)
; width end address is: 8 (R2)
; height end address is: 12 (R3)
; speed end address is: 16 (R4)
; row end address is: 0 (R0)
; cnt end address is: 32 (R8)
BEXTS.L	R6, R0, #0
MOVE.L	R0, R1
BEXTU.L	R1, R2, #256
BEXTU.L	R2, R3, #256
BEXTU.L	R3, R4, #0
L_scroll_image_left133:
; row start address is: 24 (R6)
; cnt start address is: 32 (R8)
; speed start address is: 12 (R3)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; bmp start address is: 0 (R0)
CMP.S	R6, #16
JMPC	R30, GTE, #1, L_scroll_image_left134
;matrixrgb_firmware.c,942 :: 		for (column = 0; column < ( ( height * width ) * 32 ); column++)
; column start address is: 28 (R7)
LDK.L	R7, #0
; bmp end address is: 0 (R0)
; width end address is: 4 (R1)
; height end address is: 8 (R2)
; speed end address is: 12 (R3)
; cnt end address is: 32 (R8)
; column end address is: 28 (R7)
; row end address is: 24 (R6)
L_scroll_image_left136:
; column start address is: 28 (R7)
; bmp start address is: 0 (R0)
; width start address is: 4 (R1)
; height start address is: 8 (R2)
; speed start address is: 12 (R3)
; cnt start address is: 32 (R8)
; row start address is: 24 (R6)
MUL.L	R4, R2, R1
BEXTS.L	R4, R4, #0
ASHL.L	R4, R4, #5
CMP.S	R7, R4
JMPC	R30, GTE, #1, L_scroll_image_left137
;matrixrgb_firmware.c,944 :: 		buffer = 0;
; buffer start address is: 36 (R9)
LDK.L	R9, #0
;matrixrgb_firmware.c,945 :: 		tmpCol = bmp[cnt] + (bmp[cnt + 1] << 8);
ADD.L	R4, R0, R8
LDI.B	R5, R4, #0
ADD.L	R4, R8, #1
BEXTU.L	R4, R4, #0
ADD.L	R4, R0, R4
LDI.B	R4, R4, #0
ASHL.L	R4, R4, #8
BEXTU.L	R4, R4, #0
ADD.L	R4, R5, R4
; tmpCol start address is: 44 (R11)
BEXTU.L	R11, R4, #0
;matrixrgb_firmware.c,947 :: 		if (tmpCol != 0)
CMP.S	R4, #0
JMPC	R30, Z, #1, L_scroll_image_left139
;matrixrgb_firmware.c,948 :: 		asm nop;
NOP	
L_scroll_image_left139:
;matrixrgb_firmware.c,950 :: 		red = tmpCol >> 11;
BEXTU.L	R4, R11, #0
LSHR.L	R5, R4, #11
;matrixrgb_firmware.c,951 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R4, #2047
AND.L	R4, R11, R4
BEXTU.L	R4, R4, #0
LSHR.L	R4, R4, #5
; green start address is: 40 (R10)
BEXTU.L	R10, R4, #256
;matrixrgb_firmware.c,952 :: 		blue = tmpCol & 0x1F;
AND.L	R4, R11, #31
; tmpCol end address is: 44 (R11)
; blue start address is: 44 (R11)
BEXTU.L	R11, R4, #256
;matrixrgb_firmware.c,953 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R4, R5, #256
AND.L	R4, R4, #24
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_left317
;matrixrgb_firmware.c,954 :: 		buffer |= 0x04;
OR.L	R5, R9, #4
BEXTU.L	R5, R5, #256
; buffer end address is: 36 (R9)
; buffer start address is: 20 (R5)
; buffer end address is: 20 (R5)
JMP	L_scroll_image_left140
L__scroll_image_left317:
;matrixrgb_firmware.c,953 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R5, R9, #256
;matrixrgb_firmware.c,954 :: 		buffer |= 0x04;
L_scroll_image_left140:
;matrixrgb_firmware.c,955 :: 		if ( ( green & 0x38 ) > 0 )
; buffer start address is: 20 (R5)
AND.L	R4, R10, #56
; green end address is: 40 (R10)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_left318
;matrixrgb_firmware.c,956 :: 		buffer |= 0x02;
OR.L	R4, R5, #2
BEXTU.L	R5, R4, #256
; buffer end address is: 20 (R5)
BEXTU.L	R9, R5, #256
JMP	L_scroll_image_left141
L__scroll_image_left318:
;matrixrgb_firmware.c,955 :: 		if ( ( green & 0x38 ) > 0 )
BEXTU.L	R9, R5, #256
;matrixrgb_firmware.c,956 :: 		buffer |= 0x02;
L_scroll_image_left141:
;matrixrgb_firmware.c,957 :: 		if ( ( blue & 0x18 ) > 0 )
; buffer start address is: 36 (R9)
AND.L	R4, R11, #24
; blue end address is: 44 (R11)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_left319
;matrixrgb_firmware.c,958 :: 		buffer |= 0x01;
OR.L	R9, R9, #1
BEXTU.L	R9, R9, #256
; buffer end address is: 36 (R9)
JMP	L_scroll_image_left142
L__scroll_image_left319:
;matrixrgb_firmware.c,957 :: 		if ( ( blue & 0x18 ) > 0 )
;matrixrgb_firmware.c,958 :: 		buffer |= 0x01;
L_scroll_image_left142:
;matrixrgb_firmware.c,959 :: 		image_frame[( row * shift_reg ) + column] = buffer;
; buffer start address is: 36 (R9)
LDA.L	R4, _shift_reg+0
MUL.L	R4, R6, R4
ADD.L	R5, R4, R7
ADD.L	R4, SP, #0
ADD.L	R4, R4, R5
STI.B	R4, #0, R9
; buffer end address is: 36 (R9)
;matrixrgb_firmware.c,960 :: 		cnt += 2;
ADD.L	R8, R8, #2
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,942 :: 		for (column = 0; column < ( ( height * width ) * 32 ); column++)
ADD.L	R7, R7, #1
BEXTS.L	R7, R7, #0
;matrixrgb_firmware.c,961 :: 		}
; column end address is: 28 (R7)
JMP	L_scroll_image_left136
L_scroll_image_left137:
;matrixrgb_firmware.c,941 :: 		for (row = 0; row < 16; row++)
ADD.L	R6, R6, #1
BEXTS.L	R6, R6, #0
;matrixrgb_firmware.c,961 :: 		}
; bmp end address is: 0 (R0)
; cnt end address is: 32 (R8)
; row end address is: 24 (R6)
JMP	L_scroll_image_left133
L_scroll_image_left134:
;matrixrgb_firmware.c,963 :: 		scroll_image_onto_right( image_frame, width, height, speed );
ADD.L	R4, SP, #0
; speed end address is: 12 (R3)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
MOVE.L	R0, R4
CALL	_scroll_image_onto_right+0
;matrixrgb_firmware.c,965 :: 		}
L_end_scroll_image_left:
UNLINK	LR
RETURN	
; end of _scroll_image_left
_scroll_image_onto_right:
;matrixrgb_firmware.c,967 :: 		void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
; m start address is: 48 (R12)
; height start address is: 8 (R2)
LINK	LR, #12
;matrixrgb_firmware.c,974 :: 		for ( m = 0; m < width; m++ )
;matrixrgb_firmware.c,967 :: 		void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.L	SP, #0, R0
STI.B	SP, #4, R1
BEXTU.L	R10, R2, #256
;matrixrgb_firmware.c,974 :: 		for ( m = 0; m < width; m++ )
;matrixrgb_firmware.c,967 :: 		void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.S	SP, #8, R3
; m end address is: 48 (R12)
; height end address is: 8 (R2)
; height start address is: 40 (R10)
;matrixrgb_firmware.c,970 :: 		uint16_t i = 0, j = 64;
;matrixrgb_firmware.c,971 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,974 :: 		for ( m = 0; m < width; m++ )
; m start address is: 48 (R12)
LDK.L	R12, #0
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_right143:
; m start address is: 48 (R12)
; height start address is: 40 (R10)
LDI.B	R4, SP, #4
CMP.B	R12, R4
JMPC	R30, C, #0, L_scroll_image_onto_right144
;matrixrgb_firmware.c,976 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,978 :: 		for ( k = 0; k < height; k++ )
; k start address is: 32 (R8)
LDK.L	R8, #0
; k end address is: 32 (R8)
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_right146:
; k start address is: 32 (R8)
; height start address is: 40 (R10)
; m start address is: 48 (R12)
CMP.B	R8, R10
JMPC	R30, C, #0, L_scroll_image_onto_right147
;matrixrgb_firmware.c,980 :: 		buffer = bmp[( k * width + m )];
LDI.B	R4, SP, #4
MUL.L	R4, R8, R4
BEXTS.L	R4, R4, #0
ADD.L	R5, R4, R12
BEXTS.L	R5, R5, #0
LDI.L	R4, SP, #0
ADD.L	R4, R4, R5
LDI.B	R4, R4, #0
;matrixrgb_firmware.c,981 :: 		red   = ( buffer & 0x04 );
AND.L	R7, R4, #4
;matrixrgb_firmware.c,982 :: 		green = ( buffer & 0x02 );
AND.L	R6, R4, #2
;matrixrgb_firmware.c,983 :: 		blue  = ( buffer & 0x01 );
AND.L	R5, R4, #1
;matrixrgb_firmware.c,984 :: 		write_pixel( k, ( p_width - 1 ), red, green, blue );
LDA.S	R4, _p_width+0
SUB.L	R4, R4, #1
BEXTU.L	R3, R6, #256
BEXTU.L	R2, R7, #256
BEXTU.L	R1, R4, #0
BEXTU.L	R4, R5, #256
BEXTU.L	R0, R8, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,978 :: 		for ( k = 0; k < height; k++ )
ADD.L	R4, R8, #1
; k end address is: 32 (R8)
; k start address is: 52 (R13)
BEXTU.L	R13, R4, #256
;matrixrgb_firmware.c,985 :: 		}
; k end address is: 52 (R13)
BEXTU.L	R8, R13, #256
JMP	L_scroll_image_onto_right146
L_scroll_image_onto_right147:
;matrixrgb_firmware.c,987 :: 		for ( p = 0; p < speed; p++ )
; p start address is: 56 (R14)
LDK.L	R14, #0
; height end address is: 40 (R10)
; p end address is: 56 (R14)
; m end address is: 48 (R12)
BEXTU.L	R13, R12, #256
BEXTU.L	R9, R14, #256
L_scroll_image_onto_right149:
; p start address is: 36 (R9)
; m start address is: 52 (R13)
; height start address is: 40 (R10)
LDI.S	R4, SP, #8
CMP.S	R9, R4
JMPC	R30, C, #0, L_scroll_image_onto_right150
;matrixrgb_firmware.c,988 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,987 :: 		for ( p = 0; p < speed; p++ )
ADD.L	R4, R9, #1
; p end address is: 36 (R9)
; p start address is: 56 (R14)
BEXTU.L	R14, R4, #256
;matrixrgb_firmware.c,988 :: 		refresh();
; p end address is: 56 (R14)
BEXTU.L	R9, R14, #256
JMP	L_scroll_image_onto_right149
L_scroll_image_onto_right150:
;matrixrgb_firmware.c,974 :: 		for ( m = 0; m < width; m++ )
ADD.L	R4, R13, #1
; m end address is: 52 (R13)
; m start address is: 48 (R12)
BEXTU.L	R12, R4, #256
;matrixrgb_firmware.c,990 :: 		}
; height end address is: 40 (R10)
; m end address is: 48 (R12)
JMP	L_scroll_image_onto_right143
L_scroll_image_onto_right144:
;matrixrgb_firmware.c,992 :: 		}
L_end_scroll_image_onto_right:
UNLINK	LR
RETURN	
; end of _scroll_image_onto_right
_scroll_text_left:
;matrixrgb_firmware.c,994 :: 		void scroll_text_left( char *text, color_t color, uint16_t speed )
; speed start address is: 4 (R1)
; text start address is: 0 (R0)
LINK	LR, #256
MOVE.L	R2, R0
; speed end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 8 (R2)
; speed start address is: 4 (R1)
;matrixrgb_firmware.c,996 :: 		char *ptr = text;
; ptr start address is: 0 (R0)
MOVE.L	R0, R2
; text end address is: 8 (R2)
;matrixrgb_firmware.c,997 :: 		uint8_t text_frame[256] = { 0 };
ADD.L	R27, SP, #0
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_left_text_frame_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,1000 :: 		uint8_t cnt = 0;
;matrixrgb_firmware.c,1002 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 12 (R3)
LDK.L	R3, #0
;matrixrgb_firmware.c,1004 :: 		if ( ptr == NULL )          //Sanity check
CMP.L	R0, #0
JMPC	R30, Z, #0, L_scroll_text_left152
; speed end address is: 4 (R1)
; ptr end address is: 0 (R0)
; color_buffer end address is: 12 (R3)
;matrixrgb_firmware.c,1005 :: 		return;
JMP	L_end_scroll_text_left
L_scroll_text_left152:
;matrixrgb_firmware.c,1007 :: 		if ( color.red  > 0 )       //Create color for frame
; color_buffer start address is: 12 (R3)
; ptr start address is: 0 (R0)
; speed start address is: 4 (R1)
ADD.L	R2, SP, #264
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_left308
;matrixrgb_firmware.c,1008 :: 		color_buffer |= 0x04;
OR.L	R3, R3, #4
BEXTU.L	R3, R3, #256
; color_buffer end address is: 12 (R3)
JMP	L_scroll_text_left153
L__scroll_text_left308:
;matrixrgb_firmware.c,1007 :: 		if ( color.red  > 0 )       //Create color for frame
;matrixrgb_firmware.c,1008 :: 		color_buffer |= 0x04;
L_scroll_text_left153:
;matrixrgb_firmware.c,1009 :: 		if ( color.green > 0 )
; color_buffer start address is: 12 (R3)
ADD.L	R2, SP, #265
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_left309
;matrixrgb_firmware.c,1010 :: 		color_buffer |= 0x02;
OR.L	R3, R3, #2
BEXTU.L	R3, R3, #256
; color_buffer end address is: 12 (R3)
JMP	L_scroll_text_left154
L__scroll_text_left309:
;matrixrgb_firmware.c,1009 :: 		if ( color.green > 0 )
;matrixrgb_firmware.c,1010 :: 		color_buffer |= 0x02;
L_scroll_text_left154:
;matrixrgb_firmware.c,1011 :: 		if ( color.blue > 0 )
; color_buffer start address is: 12 (R3)
ADD.L	R2, SP, #266
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_left310
;matrixrgb_firmware.c,1012 :: 		color_buffer |= 0x01;
OR.L	R2, R3, #1
BEXTU.L	R3, R2, #256
; color_buffer end address is: 12 (R3)
BEXTU.L	R15, R3, #256
JMP	L_scroll_text_left155
L__scroll_text_left310:
;matrixrgb_firmware.c,1011 :: 		if ( color.blue > 0 )
BEXTU.L	R15, R3, #256
;matrixrgb_firmware.c,1012 :: 		color_buffer |= 0x01;
L_scroll_text_left155:
;matrixrgb_firmware.c,1014 :: 		while ( *ptr != NULL )
; color_buffer start address is: 60 (R15)
BEXTU.L	R14, R1, #0
; speed end address is: 4 (R1)
; ptr end address is: 0 (R0)
; color_buffer end address is: 60 (R15)
MOVE.L	R16, R0
L_scroll_text_left156:
; color_buffer start address is: 60 (R15)
; ptr start address is: 64 (R16)
; speed start address is: 56 (R14)
LDI.B	R2, R16, #0
CMP.B	R2, #0
JMPC	R30, Z, #1, L_scroll_text_left157
;matrixrgb_firmware.c,1016 :: 		cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1017 :: 		for ( k = 0; k < 16; k++ )
; k start address is: 36 (R9)
LDK.L	R9, #0
; cnt end address is: 0 (R0)
; speed end address is: 56 (R14)
; color_buffer end address is: 60 (R15)
; k end address is: 36 (R9)
; ptr end address is: 64 (R16)
L_scroll_text_left158:
; k start address is: 36 (R9)
; cnt start address is: 0 (R0)
; speed start address is: 56 (R14)
; ptr start address is: 64 (R16)
; color_buffer start address is: 60 (R15)
CMP.B	R9, #16
JMPC	R30, C, #0, L_scroll_text_left159
;matrixrgb_firmware.c,1019 :: 		temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
LDI.B	R2, R16, #0
ASHL.L	R3, R2, #5
BEXTS.L	R3, R3, #0
LDK.L	R2, #1024
SUB.L	R2, R3, R2
BEXTS.L	R2, R2, #0
ADD.L	R4, R2, R0
BEXTS.L	R4, R4, #0
LDK.L	R3, #_Dejavu18_Bitmaps+0
ADD.L	R2, R3, R4
LPMI.B	R6, R2, #0
; temp start address is: 24 (R6)
;matrixrgb_firmware.c,1020 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
ADD.L	R2, R4, #1
BEXTS.L	R2, R2, #0
ADD.L	R2, R3, R2
LPMI.B	R1, R2, #0
; temp_2 start address is: 4 (R1)
;matrixrgb_firmware.c,1021 :: 		for ( j = 0; j < 8; j++ )
; j start address is: 20 (R5)
LDK.L	R5, #0
; temp_2 end address is: 4 (R1)
; cnt end address is: 0 (R0)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
; speed end address is: 56 (R14)
; color_buffer end address is: 60 (R15)
; k end address is: 36 (R9)
; ptr end address is: 64 (R16)
BEXTU.L	R8, R14, #0
MOVE.L	R7, R16
BEXTU.L	R4, R15, #256
L_scroll_text_left161:
; j start address is: 20 (R5)
; temp_2 start address is: 4 (R1)
; temp start address is: 24 (R6)
; color_buffer start address is: 16 (R4)
; ptr start address is: 28 (R7)
; speed start address is: 32 (R8)
; cnt start address is: 0 (R0)
; k start address is: 36 (R9)
CMP.B	R5, #8
JMPC	R30, C, #0, L_scroll_text_left162
;matrixrgb_firmware.c,1023 :: 		if ( ( temp & 0x80 ) > 0x00 )
AND.L	R2, R6, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_left164
;matrixrgb_firmware.c,1024 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R9, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R5
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R4
JMP	L_scroll_text_left165
L_scroll_text_left164:
;matrixrgb_firmware.c,1026 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R9, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R5
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_left165:
;matrixrgb_firmware.c,1027 :: 		temp = ( temp << 1 );
BEXTU.L	R2, R6, #256
; temp end address is: 24 (R6)
ASHL.L	R2, R2, #1
; temp start address is: 24 (R6)
BEXTU.L	R6, R2, #256
;matrixrgb_firmware.c,1021 :: 		for ( j = 0; j < 8; j++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1028 :: 		}
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
JMP	L_scroll_text_left161
L_scroll_text_left162:
;matrixrgb_firmware.c,1029 :: 		for ( j = 8; j < 16; j++ )
; j start address is: 8 (R2)
LDK.L	R2, #8
; temp_2 end address is: 4 (R1)
; color_buffer end address is: 16 (R4)
; ptr end address is: 28 (R7)
; speed end address is: 32 (R8)
; cnt end address is: 0 (R0)
; j end address is: 8 (R2)
; k end address is: 36 (R9)
BEXTU.L	R5, R1, #256
BEXTU.L	R1, R0, #256
BEXTU.L	R0, R9, #256
BEXTU.L	R15, R4, #256
BEXTU.L	R4, R2, #256
MOVE.L	R16, R7
BEXTU.L	R14, R8, #0
L_scroll_text_left166:
; j start address is: 16 (R4)
; k start address is: 0 (R0)
; cnt start address is: 4 (R1)
; speed start address is: 56 (R14)
; ptr start address is: 64 (R16)
; color_buffer start address is: 60 (R15)
; temp_2 start address is: 20 (R5)
CMP.B	R4, #16
JMPC	R30, C, #0, L_scroll_text_left167
;matrixrgb_firmware.c,1031 :: 		if ( ( temp_2 & 0x80 ) > 0x00 )
AND.L	R2, R5, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_left169
;matrixrgb_firmware.c,1032 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R15
JMP	L_scroll_text_left170
L_scroll_text_left169:
;matrixrgb_firmware.c,1034 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_left170:
;matrixrgb_firmware.c,1035 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R2, R5, #256
; temp_2 end address is: 20 (R5)
ASHL.L	R2, R2, #1
; temp_2 start address is: 20 (R5)
BEXTU.L	R5, R2, #256
;matrixrgb_firmware.c,1029 :: 		for ( j = 8; j < 16; j++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #256
;matrixrgb_firmware.c,1036 :: 		}
; temp_2 end address is: 20 (R5)
; j end address is: 16 (R4)
JMP	L_scroll_text_left166
L_scroll_text_left167:
;matrixrgb_firmware.c,1037 :: 		cnt += 2;
ADD.L	R2, R1, #2
BEXTU.L	R1, R2, #256
;matrixrgb_firmware.c,1017 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R2, R0, #1
; k end address is: 0 (R0)
; k start address is: 36 (R9)
BEXTU.L	R9, R2, #256
;matrixrgb_firmware.c,1038 :: 		}
; cnt end address is: 4 (R1)
; k end address is: 36 (R9)
BEXTU.L	R0, R1, #256
JMP	L_scroll_text_left158
L_scroll_text_left159:
;matrixrgb_firmware.c,1040 :: 		font_width = Dejavu18_Widths[ *ptr - 32 ];
LDI.B	R2, R16, #0
SUB.L	R3, R2, #32
BEXTS.L	R3, R3, #0
LDK.L	R2, #_Dejavu18_Widths+0
ADD.L	R2, R2, R3
LDI.B	R3, R2, #0
;matrixrgb_firmware.c,1041 :: 		shift_lett_onto_right( text_frame, font_width, speed );
ADD.L	R2, SP, #0
BEXTU.L	R1, R3, #256
MOVE.L	R0, R2
BEXTU.L	R2, R14, #0
CALL	_shift_lett_onto_right+0
;matrixrgb_firmware.c,1042 :: 		ptr++;
ADD.L	R16, R16, #1
;matrixrgb_firmware.c,1043 :: 		}
; speed end address is: 56 (R14)
; color_buffer end address is: 60 (R15)
; ptr end address is: 64 (R16)
JMP	L_scroll_text_left156
L_scroll_text_left157:
;matrixrgb_firmware.c,1044 :: 		}
L_end_scroll_text_left:
UNLINK	LR
RETURN	
; end of _scroll_text_left
_shift_lett_onto_right:
;matrixrgb_firmware.c,1046 :: 		void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
; m start address is: 44 (R11)
; speed start address is: 8 (R2)
LINK	LR, #8
;matrixrgb_firmware.c,1053 :: 		for ( m = 0; m < font_width; m++ )
;matrixrgb_firmware.c,1046 :: 		void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
STI.L	SP, #0, R0
STI.B	SP, #4, R1
;matrixrgb_firmware.c,1053 :: 		for ( m = 0; m < font_width; m++ )
;matrixrgb_firmware.c,1046 :: 		void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
BEXTU.L	R10, R2, #0
; m end address is: 44 (R11)
; speed end address is: 8 (R2)
; speed start address is: 40 (R10)
;matrixrgb_firmware.c,1049 :: 		uint16_t i = 0, j = 63;
;matrixrgb_firmware.c,1051 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,1053 :: 		for ( m = 0; m < font_width; m++ )
; m start address is: 44 (R11)
LDK.L	R11, #0
; speed end address is: 40 (R10)
; m end address is: 44 (R11)
L_shift_lett_onto_right171:
; m start address is: 44 (R11)
; speed start address is: 40 (R10)
LDI.B	R3, SP, #4
CMP.B	R11, R3
JMPC	R30, C, #0, L_shift_lett_onto_right172
;matrixrgb_firmware.c,1055 :: 		for ( k = 0; k < 16; k++ )
; k start address is: 48 (R12)
LDK.L	R12, #0
; k end address is: 48 (R12)
; speed end address is: 40 (R10)
; m end address is: 44 (R11)
BEXTU.L	R8, R12, #256
L_shift_lett_onto_right174:
; k start address is: 32 (R8)
; speed start address is: 40 (R10)
; m start address is: 44 (R11)
CMP.B	R8, #16
JMPC	R30, C, #0, L_shift_lett_onto_right175
;matrixrgb_firmware.c,1057 :: 		buffer = text_frame[( k * 16 + m )];
BEXTU.L	R3, R8, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R11
BEXTS.L	R4, R4, #0
LDI.L	R3, SP, #0
ADD.L	R3, R3, R4
LDI.B	R3, R3, #0
;matrixrgb_firmware.c,1058 :: 		red   = ( buffer & 0x04 );
AND.L	R6, R3, #4
;matrixrgb_firmware.c,1059 :: 		green = ( buffer & 0x02 );
AND.L	R5, R3, #2
;matrixrgb_firmware.c,1060 :: 		blue  = ( buffer & 0x01 );
AND.L	R4, R3, #1
;matrixrgb_firmware.c,1061 :: 		write_pixel( k, ( p_width - 1 ), red, green, blue );
LDA.S	R3, _p_width+0
SUB.L	R3, R3, #1
BEXTU.L	R2, R6, #256
BEXTU.L	R1, R3, #0
BEXTU.L	R3, R5, #256
BEXTU.L	R0, R8, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,1055 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R3, R8, #1
; k end address is: 32 (R8)
; k start address is: 48 (R12)
BEXTU.L	R12, R3, #256
;matrixrgb_firmware.c,1062 :: 		}
; k end address is: 48 (R12)
BEXTU.L	R8, R12, #256
JMP	L_shift_lett_onto_right174
L_shift_lett_onto_right175:
;matrixrgb_firmware.c,1064 :: 		for ( p = 0; p < speed; p++ )
; p start address is: 36 (R9)
LDK.L	R9, #0
; p end address is: 36 (R9)
; speed end address is: 40 (R10)
; m end address is: 44 (R11)
BEXTU.L	R13, R11, #256
L_shift_lett_onto_right177:
; p start address is: 36 (R9)
; m start address is: 52 (R13)
; speed start address is: 40 (R10)
CMP.S	R9, R10
JMPC	R30, C, #0, L_shift_lett_onto_right178
;matrixrgb_firmware.c,1065 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1064 :: 		for ( p = 0; p < speed; p++ )
ADD.L	R3, R9, #1
; p end address is: 36 (R9)
; p start address is: 0 (R0)
BEXTU.L	R0, R3, #256
;matrixrgb_firmware.c,1065 :: 		refresh();
; p end address is: 0 (R0)
BEXTU.L	R9, R0, #256
JMP	L_shift_lett_onto_right177
L_shift_lett_onto_right178:
;matrixrgb_firmware.c,1067 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,1053 :: 		for ( m = 0; m < font_width; m++ )
ADD.L	R3, R13, #1
; m end address is: 52 (R13)
; m start address is: 44 (R11)
BEXTU.L	R11, R3, #256
;matrixrgb_firmware.c,1068 :: 		}
; speed end address is: 40 (R10)
; m end address is: 44 (R11)
JMP	L_shift_lett_onto_right171
L_shift_lett_onto_right172:
;matrixrgb_firmware.c,1069 :: 		}
L_end_shift_lett_onto_right:
UNLINK	LR
RETURN	
; end of _shift_lett_onto_right
_scroll_text_right:
;matrixrgb_firmware.c,1071 :: 		void scroll_text_right( char *text, color_t color, uint16_t speed )
; speed start address is: 4 (R1)
; text start address is: 0 (R0)
LINK	LR, #256
MOVE.L	R2, R0
; speed end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 8 (R2)
; speed start address is: 4 (R1)
;matrixrgb_firmware.c,1073 :: 		char *ptr = text;
; ptr start address is: 0 (R0)
MOVE.L	R0, R2
; text end address is: 8 (R2)
;matrixrgb_firmware.c,1074 :: 		uint8_t text_frame[256] = { 0 };
ADD.L	R27, SP, #0
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_right_text_frame_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,1077 :: 		uint8_t cnt = 0;
;matrixrgb_firmware.c,1079 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1080 :: 		uint8_t text_length = 0;
; text_length start address is: 12 (R3)
LDK.L	R3, #0
;matrixrgb_firmware.c,1082 :: 		if ( ptr == NULL )          //Sanity check
CMP.L	R0, #0
JMPC	R30, Z, #0, L_scroll_text_right180
; ptr end address is: 0 (R0)
; color_buffer end address is: 16 (R4)
; speed end address is: 4 (R1)
; text_length end address is: 12 (R3)
;matrixrgb_firmware.c,1083 :: 		return;
JMP	L_end_scroll_text_right
L_scroll_text_right180:
;matrixrgb_firmware.c,1085 :: 		if ( color.red  > 0 )       //Create color for frame
; text_length start address is: 12 (R3)
; speed start address is: 4 (R1)
; color_buffer start address is: 16 (R4)
; ptr start address is: 0 (R0)
ADD.L	R2, SP, #264
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_right311
;matrixrgb_firmware.c,1086 :: 		color_buffer |= 0x04;
OR.L	R4, R4, #4
BEXTU.L	R4, R4, #256
; color_buffer end address is: 16 (R4)
JMP	L_scroll_text_right181
L__scroll_text_right311:
;matrixrgb_firmware.c,1085 :: 		if ( color.red  > 0 )       //Create color for frame
;matrixrgb_firmware.c,1086 :: 		color_buffer |= 0x04;
L_scroll_text_right181:
;matrixrgb_firmware.c,1087 :: 		if ( color.green > 0 )
; color_buffer start address is: 16 (R4)
ADD.L	R2, SP, #265
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_right312
;matrixrgb_firmware.c,1088 :: 		color_buffer |= 0x02;
OR.L	R4, R4, #2
BEXTU.L	R4, R4, #256
; color_buffer end address is: 16 (R4)
JMP	L_scroll_text_right182
L__scroll_text_right312:
;matrixrgb_firmware.c,1087 :: 		if ( color.green > 0 )
;matrixrgb_firmware.c,1088 :: 		color_buffer |= 0x02;
L_scroll_text_right182:
;matrixrgb_firmware.c,1089 :: 		if ( color.blue > 0 )
; color_buffer start address is: 16 (R4)
ADD.L	R2, SP, #266
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_right313
;matrixrgb_firmware.c,1090 :: 		color_buffer |= 0x01;
OR.L	R2, R4, #1
BEXTU.L	R4, R2, #256
; color_buffer end address is: 16 (R4)
BEXTU.L	R2, R4, #256
JMP	L_scroll_text_right183
L__scroll_text_right313:
;matrixrgb_firmware.c,1089 :: 		if ( color.blue > 0 )
BEXTU.L	R2, R4, #256
;matrixrgb_firmware.c,1090 :: 		color_buffer |= 0x01;
L_scroll_text_right183:
;matrixrgb_firmware.c,1092 :: 		while ( *ptr != NULL )
; color_buffer start address is: 8 (R2)
; ptr end address is: 0 (R0)
; color_buffer end address is: 8 (R2)
; speed end address is: 4 (R1)
; text_length end address is: 12 (R3)
MOVE.L	R4, R0
BEXTU.L	R0, R2, #256
L_scroll_text_right184:
; color_buffer start address is: 0 (R0)
; text_length start address is: 12 (R3)
; ptr start address is: 16 (R4)
; speed start address is: 4 (R1)
LDI.B	R2, R4, #0
CMP.B	R2, #0
JMPC	R30, Z, #1, L_scroll_text_right185
;matrixrgb_firmware.c,1094 :: 		ptr++;
ADD.L	R4, R4, #1
;matrixrgb_firmware.c,1095 :: 		text_length++;
ADD.L	R3, R3, #1
BEXTU.L	R3, R3, #256
;matrixrgb_firmware.c,1096 :: 		}
JMP	L_scroll_text_right184
L_scroll_text_right185:
;matrixrgb_firmware.c,1098 :: 		ptr--;
SUB.L	R17, R4, #1
; ptr end address is: 16 (R4)
; ptr start address is: 68 (R17)
; color_buffer end address is: 0 (R0)
; speed end address is: 4 (R1)
; text_length end address is: 12 (R3)
; ptr end address is: 68 (R17)
BEXTU.L	R16, R0, #256
BEXTU.L	R0, R3, #256
BEXTU.L	R14, R1, #0
;matrixrgb_firmware.c,1099 :: 		while ( text_length > 0 )
L_scroll_text_right186:
; ptr start address is: 68 (R17)
; speed start address is: 56 (R14)
; text_length start address is: 0 (R0)
; color_buffer start address is: 64 (R16)
CMP.B	R0, #0
JMPC	R30, A, #0, L_scroll_text_right187
;matrixrgb_firmware.c,1101 :: 		text_length--;
SUB.L	R15, R0, #1
BEXTU.L	R15, R15, #256
; text_length end address is: 0 (R0)
; text_length start address is: 60 (R15)
;matrixrgb_firmware.c,1102 :: 		cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1103 :: 		for ( k = 0; k < 16; k++ )
; k start address is: 40 (R10)
LDK.L	R10, #0
; cnt end address is: 0 (R0)
; text_length end address is: 60 (R15)
; color_buffer end address is: 64 (R16)
; speed end address is: 56 (R14)
; k end address is: 40 (R10)
; ptr end address is: 68 (R17)
L_scroll_text_right188:
; k start address is: 40 (R10)
; cnt start address is: 0 (R0)
; text_length start address is: 60 (R15)
; color_buffer start address is: 64 (R16)
; speed start address is: 56 (R14)
; ptr start address is: 68 (R17)
CMP.B	R10, #16
JMPC	R30, C, #0, L_scroll_text_right189
;matrixrgb_firmware.c,1105 :: 		temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
LDI.B	R2, R17, #0
ASHL.L	R3, R2, #5
BEXTS.L	R3, R3, #0
LDK.L	R2, #1024
SUB.L	R2, R3, R2
BEXTS.L	R2, R2, #0
ADD.L	R4, R2, R0
BEXTS.L	R4, R4, #0
LDK.L	R3, #_Dejavu18_Bitmaps+0
ADD.L	R2, R3, R4
LPMI.B	R5, R2, #0
; temp start address is: 20 (R5)
;matrixrgb_firmware.c,1106 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
ADD.L	R2, R4, #1
BEXTS.L	R2, R2, #0
ADD.L	R2, R3, R2
LPMI.B	R1, R2, #0
; temp_2 start address is: 4 (R1)
;matrixrgb_firmware.c,1107 :: 		for ( j = 0; j < 8; j++ )
; j start address is: 16 (R4)
LDK.L	R4, #0
; temp_2 end address is: 4 (R1)
; cnt end address is: 0 (R0)
; temp end address is: 20 (R5)
; text_length end address is: 60 (R15)
; color_buffer end address is: 64 (R16)
; speed end address is: 56 (R14)
; j end address is: 16 (R4)
; k end address is: 40 (R10)
; ptr end address is: 68 (R17)
BEXTU.L	R9, R15, #256
BEXTU.L	R8, R16, #256
BEXTU.L	R7, R14, #0
MOVE.L	R6, R17
L_scroll_text_right191:
; j start address is: 16 (R4)
; temp_2 start address is: 4 (R1)
; temp start address is: 20 (R5)
; ptr start address is: 24 (R6)
; speed start address is: 28 (R7)
; color_buffer start address is: 32 (R8)
; text_length start address is: 36 (R9)
; cnt start address is: 0 (R0)
; k start address is: 40 (R10)
CMP.B	R4, #8
JMPC	R30, C, #0, L_scroll_text_right192
;matrixrgb_firmware.c,1109 :: 		if ( ( temp & 0x80 ) > 0x00 )
AND.L	R2, R5, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_right194
;matrixrgb_firmware.c,1110 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R10, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R8
JMP	L_scroll_text_right195
L_scroll_text_right194:
;matrixrgb_firmware.c,1112 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R10, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_right195:
;matrixrgb_firmware.c,1113 :: 		temp = ( temp << 1 );
BEXTU.L	R2, R5, #256
; temp end address is: 20 (R5)
ASHL.L	R2, R2, #1
; temp start address is: 20 (R5)
BEXTU.L	R5, R2, #256
;matrixrgb_firmware.c,1107 :: 		for ( j = 0; j < 8; j++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #256
;matrixrgb_firmware.c,1114 :: 		}
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
JMP	L_scroll_text_right191
L_scroll_text_right192:
;matrixrgb_firmware.c,1115 :: 		for ( j = 8; j < 16; j++ )
; j start address is: 16 (R4)
LDK.L	R4, #8
; temp_2 end address is: 4 (R1)
; ptr end address is: 24 (R6)
; speed end address is: 28 (R7)
; color_buffer end address is: 32 (R8)
; text_length end address is: 36 (R9)
; cnt end address is: 0 (R0)
; j end address is: 16 (R4)
; k end address is: 40 (R10)
BEXTU.L	R5, R1, #256
BEXTU.L	R1, R0, #256
BEXTU.L	R0, R10, #256
MOVE.L	R17, R6
BEXTU.L	R14, R7, #0
BEXTU.L	R16, R8, #256
BEXTU.L	R15, R9, #256
L_scroll_text_right196:
; j start address is: 16 (R4)
; k start address is: 0 (R0)
; cnt start address is: 4 (R1)
; text_length start address is: 60 (R15)
; color_buffer start address is: 64 (R16)
; speed start address is: 56 (R14)
; ptr start address is: 68 (R17)
; temp_2 start address is: 20 (R5)
CMP.B	R4, #16
JMPC	R30, C, #0, L_scroll_text_right197
;matrixrgb_firmware.c,1117 :: 		if ( ( temp_2 & 0x80 ) > 0x00 )
AND.L	R2, R5, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_right199
;matrixrgb_firmware.c,1118 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R16
JMP	L_scroll_text_right200
L_scroll_text_right199:
;matrixrgb_firmware.c,1120 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_right200:
;matrixrgb_firmware.c,1121 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R2, R5, #256
; temp_2 end address is: 20 (R5)
ASHL.L	R2, R2, #1
; temp_2 start address is: 20 (R5)
BEXTU.L	R5, R2, #256
;matrixrgb_firmware.c,1115 :: 		for ( j = 8; j < 16; j++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #256
;matrixrgb_firmware.c,1122 :: 		}
; temp_2 end address is: 20 (R5)
; j end address is: 16 (R4)
JMP	L_scroll_text_right196
L_scroll_text_right197:
;matrixrgb_firmware.c,1123 :: 		cnt += 2;
ADD.L	R2, R1, #2
BEXTU.L	R1, R2, #256
;matrixrgb_firmware.c,1103 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R2, R0, #1
; k end address is: 0 (R0)
; k start address is: 40 (R10)
BEXTU.L	R10, R2, #256
;matrixrgb_firmware.c,1124 :: 		}
; cnt end address is: 4 (R1)
; k end address is: 40 (R10)
BEXTU.L	R0, R1, #256
JMP	L_scroll_text_right188
L_scroll_text_right189:
;matrixrgb_firmware.c,1126 :: 		font_width = Dejavu18_Widths[ *ptr - 32 ];
LDI.B	R2, R17, #0
SUB.L	R3, R2, #32
BEXTS.L	R3, R3, #0
LDK.L	R2, #_Dejavu18_Widths+0
ADD.L	R2, R2, R3
LDI.B	R3, R2, #0
;matrixrgb_firmware.c,1127 :: 		shift_lett_onto_left( text_frame, font_width, speed );
ADD.L	R2, SP, #0
BEXTU.L	R1, R3, #256
MOVE.L	R0, R2
BEXTU.L	R2, R14, #0
CALL	_shift_lett_onto_left+0
;matrixrgb_firmware.c,1128 :: 		ptr--;
SUB.L	R17, R17, #1
;matrixrgb_firmware.c,1129 :: 		}
; text_length end address is: 60 (R15)
; color_buffer end address is: 64 (R16)
; speed end address is: 56 (R14)
; ptr end address is: 68 (R17)
BEXTU.L	R0, R15, #256
JMP	L_scroll_text_right186
L_scroll_text_right187:
;matrixrgb_firmware.c,1130 :: 		}
L_end_scroll_text_right:
UNLINK	LR
RETURN	
; end of _scroll_text_right
_shift_lett_onto_left:
;matrixrgb_firmware.c,1132 :: 		void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
; speed start address is: 8 (R2)
; font_width start address is: 4 (R1)
; text_frame start address is: 0 (R0)
LINK	LR, #4
BEXTU.L	R4, R2, #0
BEXTU.L	R2, R1, #256
MOVE.L	R1, R0
; speed end address is: 8 (R2)
; font_width end address is: 4 (R1)
; text_frame end address is: 0 (R0)
; text_frame start address is: 4 (R1)
; font_width start address is: 8 (R2)
; speed start address is: 16 (R4)
;matrixrgb_firmware.c,1135 :: 		uint16_t i = 0, j = 64;
;matrixrgb_firmware.c,1136 :: 		uint8_t difference = 16 - font_width;
LDK.L	R3, #16
SUB.L	R3, R3, R2
; difference start address is: 12 (R3)
BEXTU.L	R3, R3, #256
;matrixrgb_firmware.c,1138 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,1140 :: 		for ( m = difference; m < ( 16 - font_width ) + font_width ; m++ )
; m start address is: 0 (R0)
BEXTU.L	R0, R3, #256
; text_frame end address is: 4 (R1)
; font_width end address is: 8 (R2)
; speed end address is: 16 (R4)
; difference end address is: 12 (R3)
; m end address is: 0 (R0)
MOVE.L	R8, R1
BEXTU.L	R9, R2, #256
BEXTU.L	R10, R4, #0
BEXTU.L	R11, R0, #256
L_shift_lett_onto_left201:
; m start address is: 44 (R11)
; speed start address is: 40 (R10)
; font_width start address is: 36 (R9)
; text_frame start address is: 32 (R8)
LDK.L	R3, #16
SUB.L	R3, R3, R9
BEXTS.L	R3, R3, #0
ADD.L	R3, R3, R9
CMP.S	R11, R3
JMPC	R30, GTE, #1, L_shift_lett_onto_left202
;matrixrgb_firmware.c,1142 :: 		for ( k = 0; k < 16; k++ )
; k start address is: 0 (R0)
LDK.L	R0, #0
; k end address is: 0 (R0)
; text_frame end address is: 32 (R8)
; font_width end address is: 36 (R9)
; m end address is: 44 (R11)
; speed end address is: 40 (R10)
BEXTU.L	R12, R0, #256
L_shift_lett_onto_left204:
; k start address is: 48 (R12)
; text_frame start address is: 32 (R8)
; font_width start address is: 36 (R9)
; speed start address is: 40 (R10)
; m start address is: 44 (R11)
CMP.B	R12, #16
JMPC	R30, C, #0, L_shift_lett_onto_left205
;matrixrgb_firmware.c,1144 :: 		buffer = text_frame[k * 16 + ( 15 - m )];
BEXTU.L	R3, R12, #256
ASHL.L	R4, R3, #4
BEXTS.L	R4, R4, #0
LDK.L	R3, #15
SUB.L	R3, R3, R11
BEXTS.L	R3, R3, #0
ADD.L	R3, R4, R3
BEXTS.L	R3, R3, #0
ADD.L	R3, R8, R3
LDI.B	R3, R3, #0
;matrixrgb_firmware.c,1145 :: 		red   = ( buffer & 0x04 );
AND.L	R5, R3, #4
;matrixrgb_firmware.c,1146 :: 		green = ( buffer & 0x02 );
AND.L	R4, R3, #2
;matrixrgb_firmware.c,1147 :: 		blue  = ( buffer & 0x01 );
AND.L	R3, R3, #1
;matrixrgb_firmware.c,1148 :: 		write_pixel( k, 0, red, green, blue );
STI.B	SP, #0, R4
BEXTU.L	R2, R5, #256
LDK.L	R1, #0
BEXTU.L	R0, R12, #256
BEXTU.L	R4, R3, #256
LDI.B	R3, SP, #0
CALL	_write_pixel+0
;matrixrgb_firmware.c,1142 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R12, R12, #1
BEXTU.L	R12, R12, #256
;matrixrgb_firmware.c,1149 :: 		}
; k end address is: 48 (R12)
JMP	L_shift_lett_onto_left204
L_shift_lett_onto_left205:
;matrixrgb_firmware.c,1151 :: 		for ( p = 0; p < speed; p++ )
; p start address is: 0 (R0)
LDK.L	R0, #0
; text_frame end address is: 32 (R8)
; font_width end address is: 36 (R9)
; m end address is: 44 (R11)
; p end address is: 0 (R0)
; speed end address is: 40 (R10)
MOVE.L	R12, R8
BEXTU.L	R13, R11, #256
BEXTU.L	R11, R9, #256
BEXTU.L	R9, R0, #256
L_shift_lett_onto_left207:
; p start address is: 36 (R9)
; m start address is: 52 (R13)
; speed start address is: 40 (R10)
; font_width start address is: 44 (R11)
; text_frame start address is: 48 (R12)
CMP.S	R9, R10
JMPC	R30, C, #0, L_shift_lett_onto_left208
;matrixrgb_firmware.c,1152 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1151 :: 		for ( p = 0; p < speed; p++ )
ADD.L	R9, R9, #1
BEXTU.L	R9, R9, #256
;matrixrgb_firmware.c,1152 :: 		refresh();
; p end address is: 36 (R9)
JMP	L_shift_lett_onto_left207
L_shift_lett_onto_left208:
;matrixrgb_firmware.c,1154 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,1140 :: 		for ( m = difference; m < ( 16 - font_width ) + font_width ; m++ )
ADD.L	R3, R13, #1
; m end address is: 52 (R13)
; m start address is: 0 (R0)
BEXTU.L	R0, R3, #256
;matrixrgb_firmware.c,1155 :: 		}
MOVE.L	R8, R12
; speed end address is: 40 (R10)
; font_width end address is: 44 (R11)
; text_frame end address is: 48 (R12)
; m end address is: 0 (R0)
BEXTU.L	R9, R11, #256
BEXTU.L	R11, R0, #256
JMP	L_shift_lett_onto_left201
L_shift_lett_onto_left202:
;matrixrgb_firmware.c,1156 :: 		}
L_end_shift_lett_onto_left:
UNLINK	LR
RETURN	
; end of _shift_lett_onto_left
_load_text:
;matrixrgb_firmware.c,1158 :: 		void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
; ptr start address is: 24 (R6)
; text start address is: 0 (R0)
;matrixrgb_firmware.c,1161 :: 		char *ptr = text;
;matrixrgb_firmware.c,1158 :: 		void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
;matrixrgb_firmware.c,1161 :: 		char *ptr = text;
;matrixrgb_firmware.c,1158 :: 		void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
; ptr end address is: 24 (R6)
; text end address is: 0 (R0)
; text start address is: 0 (R0)
;matrixrgb_firmware.c,1161 :: 		char *ptr = text;
; ptr start address is: 24 (R6)
MOVE.L	R6, R0
; text end address is: 0 (R0)
;matrixrgb_firmware.c,1165 :: 		uint8_t cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1166 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1168 :: 		if ( ptr == NULL )
CMP.L	R6, #0
JMPC	R30, Z, #0, L_load_text210
; color_buffer end address is: 4 (R1)
; cnt end address is: 0 (R0)
; ptr end address is: 24 (R6)
;matrixrgb_firmware.c,1169 :: 		return;
JMP	L_end_load_text
L_load_text210:
;matrixrgb_firmware.c,1171 :: 		if ( color.red  > 0 )
; ptr start address is: 24 (R6)
; cnt start address is: 0 (R0)
; color_buffer start address is: 4 (R1)
LDI.B	R3, SP, #4
CMP.B	R3, #0
JMPC	R30, A, #0, L__load_text320
;matrixrgb_firmware.c,1172 :: 		color_buffer |= 0x04;
OR.L	R1, R1, #4
BEXTU.L	R1, R1, #256
; color_buffer end address is: 4 (R1)
JMP	L_load_text211
L__load_text320:
;matrixrgb_firmware.c,1171 :: 		if ( color.red  > 0 )
;matrixrgb_firmware.c,1172 :: 		color_buffer |= 0x04;
L_load_text211:
;matrixrgb_firmware.c,1173 :: 		if ( color.green > 0 )
; color_buffer start address is: 4 (R1)
LDI.B	R3, SP, #5
CMP.B	R3, #0
JMPC	R30, A, #0, L__load_text321
;matrixrgb_firmware.c,1174 :: 		color_buffer |= 0x02;
OR.L	R1, R1, #2
BEXTU.L	R1, R1, #256
; color_buffer end address is: 4 (R1)
JMP	L_load_text212
L__load_text321:
;matrixrgb_firmware.c,1173 :: 		if ( color.green > 0 )
;matrixrgb_firmware.c,1174 :: 		color_buffer |= 0x02;
L_load_text212:
;matrixrgb_firmware.c,1175 :: 		if ( color.blue > 0 )
; color_buffer start address is: 4 (R1)
LDI.B	R3, SP, #6
CMP.B	R3, #0
JMPC	R30, A, #0, L__load_text322
;matrixrgb_firmware.c,1176 :: 		color_buffer |= 0x01;
OR.L	R3, R1, #1
BEXTU.L	R1, R3, #256
; color_buffer end address is: 4 (R1)
BEXTU.L	R7, R1, #256
JMP	L_load_text213
L__load_text322:
;matrixrgb_firmware.c,1175 :: 		if ( color.blue > 0 )
BEXTU.L	R7, R1, #256
;matrixrgb_firmware.c,1176 :: 		color_buffer |= 0x01;
L_load_text213:
;matrixrgb_firmware.c,1178 :: 		for ( k = 0; k < 16; k++ )
; color_buffer start address is: 28 (R7)
; k start address is: 32 (R8)
LDK.L	R8, #0
; cnt end address is: 0 (R0)
; color_buffer end address is: 28 (R7)
; ptr end address is: 24 (R6)
; k end address is: 32 (R8)
L_load_text214:
; k start address is: 32 (R8)
; color_buffer start address is: 28 (R7)
; cnt start address is: 0 (R0)
; ptr start address is: 24 (R6)
CMP.B	R8, #16
JMPC	R30, C, #0, L_load_text215
;matrixrgb_firmware.c,1180 :: 		temp = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
LDI.B	R3, R6, #0
ASHL.L	R4, R3, #5
BEXTS.L	R4, R4, #0
LDK.L	R3, #1024
SUB.L	R5, R4, R3
BEXTS.L	R5, R5, #0
ADD.L	R3, R5, R0
BEXTS.L	R3, R3, #0
LDK.L	R4, #_Dejavu18_Bitmaps+0
ADD.L	R3, R4, R3
LPMI.B	R3, R3, #0
; temp start address is: 4 (R1)
BEXTU.L	R1, R3, #256
;matrixrgb_firmware.c,1181 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + ( cnt + 1 ) ];
ADD.L	R3, R0, #1
BEXTS.L	R3, R3, #0
ADD.L	R3, R5, R3
BEXTS.L	R3, R3, #0
ADD.L	R3, R4, R3
LPMI.B	R3, R3, #0
; temp_2 start address is: 12 (R3)
;matrixrgb_firmware.c,1182 :: 		for ( j = 0; j < 8; j++ )
; j start address is: 8 (R2)
LDK.L	R2, #0
; temp end address is: 4 (R1)
; temp_2 end address is: 12 (R3)
; cnt end address is: 0 (R0)
; color_buffer end address is: 28 (R7)
; j end address is: 8 (R2)
; ptr end address is: 24 (R6)
; k end address is: 32 (R8)
BEXTU.L	R5, R1, #256
BEXTU.L	R1, R3, #256
L_load_text217:
; j start address is: 8 (R2)
; temp_2 start address is: 4 (R1)
; temp start address is: 20 (R5)
; ptr start address is: 24 (R6)
; cnt start address is: 0 (R0)
; color_buffer start address is: 28 (R7)
; k start address is: 32 (R8)
CMP.B	R2, #8
JMPC	R30, C, #0, L_load_text218
;matrixrgb_firmware.c,1184 :: 		if ( ( temp & 0x80 ) > 0 )
AND.L	R3, R5, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_load_text220
;matrixrgb_firmware.c,1185 :: 		FB[(k * 64) + j] = color_buffer;
BEXTU.L	R3, R8, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R3, R3, R4
STI.B	R3, #0, R7
JMP	L_load_text221
L_load_text220:
;matrixrgb_firmware.c,1187 :: 		FB[(k * 64) + j] = 0x00;
BEXTU.L	R3, R8, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_load_text221:
;matrixrgb_firmware.c,1188 :: 		temp = ( temp << 1 );
BEXTU.L	R3, R5, #256
; temp end address is: 20 (R5)
ASHL.L	R3, R3, #1
; temp start address is: 20 (R5)
BEXTU.L	R5, R3, #256
;matrixrgb_firmware.c,1182 :: 		for ( j = 0; j < 8; j++ )
ADD.L	R2, R2, #1
BEXTU.L	R2, R2, #256
;matrixrgb_firmware.c,1189 :: 		}
; temp end address is: 20 (R5)
; j end address is: 8 (R2)
JMP	L_load_text217
L_load_text218:
;matrixrgb_firmware.c,1190 :: 		for ( j = 8; j < 16; j++ )
; j start address is: 20 (R5)
LDK.L	R5, #8
; temp_2 end address is: 4 (R1)
; cnt end address is: 0 (R0)
; color_buffer end address is: 28 (R7)
; ptr end address is: 24 (R6)
; j end address is: 20 (R5)
; k end address is: 32 (R8)
BEXTU.L	R2, R0, #256
BEXTU.L	R0, R7, #256
BEXTU.L	R7, R1, #256
BEXTU.L	R1, R8, #256
L_load_text222:
; j start address is: 20 (R5)
; k start address is: 4 (R1)
; color_buffer start address is: 0 (R0)
; cnt start address is: 8 (R2)
; ptr start address is: 24 (R6)
; temp_2 start address is: 28 (R7)
CMP.B	R5, #16
JMPC	R30, C, #0, L_load_text223
;matrixrgb_firmware.c,1192 :: 		if ( ( temp_2 & 0x80 ) > 0 )
AND.L	R3, R7, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_load_text225
;matrixrgb_firmware.c,1193 :: 		FB[(k * 64) + j] = color_buffer;
BEXTU.L	R3, R1, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R3, R3, R4
STI.B	R3, #0, R0
JMP	L_load_text226
L_load_text225:
;matrixrgb_firmware.c,1195 :: 		FB[(k * 64) + j] = 0x00;
BEXTU.L	R3, R1, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_load_text226:
;matrixrgb_firmware.c,1196 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R3, R7, #256
; temp_2 end address is: 28 (R7)
ASHL.L	R3, R3, #1
; temp_2 start address is: 28 (R7)
BEXTU.L	R7, R3, #256
;matrixrgb_firmware.c,1190 :: 		for ( j = 8; j < 16; j++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1197 :: 		}
; temp_2 end address is: 28 (R7)
; j end address is: 20 (R5)
JMP	L_load_text222
L_load_text223:
;matrixrgb_firmware.c,1198 :: 		cnt += 2;
ADD.L	R3, R2, #2
BEXTU.L	R2, R3, #256
;matrixrgb_firmware.c,1178 :: 		for ( k = 0; k < 16; k++ )
ADD.L	R3, R1, #1
; k end address is: 4 (R1)
; k start address is: 32 (R8)
BEXTU.L	R8, R3, #256
;matrixrgb_firmware.c,1199 :: 		}
; color_buffer end address is: 0 (R0)
; ptr end address is: 24 (R6)
; cnt end address is: 8 (R2)
; k end address is: 32 (R8)
BEXTU.L	R7, R0, #256
BEXTU.L	R0, R2, #256
JMP	L_load_text214
L_load_text215:
;matrixrgb_firmware.c,1201 :: 		}
L_end_load_text:
RETURN	
; end of _load_text
_scroll_off_screen_left:
;matrixrgb_firmware.c,1203 :: 		void scroll_off_screen_left( uint16_t speed )
; i start address is: 40 (R10)
LINK	LR, #4
;matrixrgb_firmware.c,1207 :: 		for ( i = 0; i < p_width; i++ )
;matrixrgb_firmware.c,1203 :: 		void scroll_off_screen_left( uint16_t speed )
;matrixrgb_firmware.c,1207 :: 		for ( i = 0; i < p_width; i++ )
;matrixrgb_firmware.c,1203 :: 		void scroll_off_screen_left( uint16_t speed )
STI.S	SP, #0, R0
; i end address is: 40 (R10)
;matrixrgb_firmware.c,1207 :: 		for ( i = 0; i < p_width; i++ )
; i start address is: 40 (R10)
LDK.L	R10, #0
; i end address is: 40 (R10)
L_scroll_off_screen_left227:
; i start address is: 40 (R10)
LDA.S	R1, _p_width+0
CMP.S	R10, R1
JMPC	R30, C, #0, L_scroll_off_screen_left228
;matrixrgb_firmware.c,1209 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,1210 :: 		for ( p = 0; p < speed; p++ )
; p start address is: 36 (R9)
LDK.L	R9, #0
; p end address is: 36 (R9)
; i end address is: 40 (R10)
L_scroll_off_screen_left230:
; p start address is: 36 (R9)
; i start address is: 40 (R10)
LDI.S	R1, SP, #0
CMP.S	R9, R1
JMPC	R30, C, #0, L_scroll_off_screen_left231
;matrixrgb_firmware.c,1211 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1210 :: 		for ( p = 0; p < speed; p++ )
ADD.L	R1, R9, #1
; p end address is: 36 (R9)
; p start address is: 44 (R11)
BEXTU.L	R11, R1, #0
;matrixrgb_firmware.c,1211 :: 		refresh();
; p end address is: 44 (R11)
BEXTU.L	R9, R11, #0
JMP	L_scroll_off_screen_left230
L_scroll_off_screen_left231:
;matrixrgb_firmware.c,1207 :: 		for ( i = 0; i < p_width; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #0
;matrixrgb_firmware.c,1212 :: 		}
; i end address is: 40 (R10)
JMP	L_scroll_off_screen_left227
L_scroll_off_screen_left228:
;matrixrgb_firmware.c,1213 :: 		}
L_end_scroll_off_screen_left:
UNLINK	LR
RETURN	
; end of _scroll_off_screen_left
_scroll_off_screen_right:
;matrixrgb_firmware.c,1215 :: 		void scroll_off_screen_right( uint16_t speed )
; i start address is: 40 (R10)
LINK	LR, #4
;matrixrgb_firmware.c,1219 :: 		for ( i = 0; i < p_width; i++ )
;matrixrgb_firmware.c,1215 :: 		void scroll_off_screen_right( uint16_t speed )
;matrixrgb_firmware.c,1219 :: 		for ( i = 0; i < p_width; i++ )
;matrixrgb_firmware.c,1215 :: 		void scroll_off_screen_right( uint16_t speed )
STI.S	SP, #0, R0
; i end address is: 40 (R10)
;matrixrgb_firmware.c,1219 :: 		for ( i = 0; i < p_width; i++ )
; i start address is: 40 (R10)
LDK.L	R10, #0
; i end address is: 40 (R10)
L_scroll_off_screen_right233:
; i start address is: 40 (R10)
LDA.S	R1, _p_width+0
CMP.S	R10, R1
JMPC	R30, C, #0, L_scroll_off_screen_right234
;matrixrgb_firmware.c,1221 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,1222 :: 		for ( p = 0; p < speed; p++ )
; p start address is: 36 (R9)
LDK.L	R9, #0
; p end address is: 36 (R9)
; i end address is: 40 (R10)
L_scroll_off_screen_right236:
; p start address is: 36 (R9)
; i start address is: 40 (R10)
LDI.S	R1, SP, #0
CMP.S	R9, R1
JMPC	R30, C, #0, L_scroll_off_screen_right237
;matrixrgb_firmware.c,1223 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1222 :: 		for ( p = 0; p < speed; p++ )
ADD.L	R1, R9, #1
; p end address is: 36 (R9)
; p start address is: 44 (R11)
BEXTU.L	R11, R1, #0
;matrixrgb_firmware.c,1223 :: 		refresh();
; p end address is: 44 (R11)
BEXTU.L	R9, R11, #0
JMP	L_scroll_off_screen_right236
L_scroll_off_screen_right237:
;matrixrgb_firmware.c,1219 :: 		for ( i = 0; i < p_width; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #0
;matrixrgb_firmware.c,1224 :: 		}
; i end address is: 40 (R10)
JMP	L_scroll_off_screen_right233
L_scroll_off_screen_right234:
;matrixrgb_firmware.c,1227 :: 		}
L_end_scroll_off_screen_right:
UNLINK	LR
RETURN	
; end of _scroll_off_screen_right
_display_shift_left:
;matrixrgb_firmware.c,1228 :: 		void display_shift_left( void )
LINK	LR, #4
;matrixrgb_firmware.c,1230 :: 		uint16_t row          = 0;
;matrixrgb_firmware.c,1231 :: 		uint16_t column       = 0;
;matrixrgb_firmware.c,1232 :: 		uint16_t temp_col_one = 0;
;matrixrgb_firmware.c,1233 :: 		uint16_t temp_col_two = 0;
;matrixrgb_firmware.c,1234 :: 		uint8_t buffer        = 0;
;matrixrgb_firmware.c,1236 :: 		for ( row = 0; row < p_height; row++ )
; row start address is: 28 (R7)
LDK.L	R7, #0
; row end address is: 28 (R7)
L_display_shift_left239:
; row start address is: 28 (R7)
LDA.S	R0, _p_height+0
CMP.S	R7, R0
JMPC	R30, C, #0, L_display_shift_left240
;matrixrgb_firmware.c,1238 :: 		for ( column = 0; column <= ( p_width - 1 ); column++ )
; column start address is: 32 (R8)
LDK.L	R8, #0
; column end address is: 32 (R8)
; row end address is: 28 (R7)
L_display_shift_left242:
; column start address is: 32 (R8)
; row start address is: 28 (R7)
LDA.S	R0, _p_width+0
SUB.L	R0, R0, #1
CMP.S	R8, R0
JMPC	R30, A, #1, L_display_shift_left243
;matrixrgb_firmware.c,1242 :: 		temp_col_two = column + 1;
ADD.L	R0, R8, #1
; temp_col_two start address is: 36 (R9)
BEXTU.L	R9, R0, #0
;matrixrgb_firmware.c,1243 :: 		FB[ get_coord_index( row, temp_col_one ) ] = FB[ get_coord_index( row, temp_col_two ) ];
BEXTU.L	R1, R8, #0
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
STI.L	SP, #0, R0
BEXTU.L	R1, R9, #0
; temp_col_two end address is: 36 (R9)
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
LDI.B	R1, R0, #0
LDI.L	R0, SP, #0
STI.B	R0, #0, R1
;matrixrgb_firmware.c,1238 :: 		for ( column = 0; column <= ( p_width - 1 ); column++ )
ADD.L	R8, R8, #1
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,1244 :: 		}
; column end address is: 32 (R8)
JMP	L_display_shift_left242
L_display_shift_left243:
;matrixrgb_firmware.c,1245 :: 		erase_pixel( row, ( p_width - 1 ) );
LDA.S	R0, _p_width+0
SUB.L	R0, R0, #1
BEXTU.L	R1, R0, #0
BEXTU.L	R0, R7, #0
CALL	_erase_pixel+0
;matrixrgb_firmware.c,1236 :: 		for ( row = 0; row < p_height; row++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,1246 :: 		}
; row end address is: 28 (R7)
JMP	L_display_shift_left239
L_display_shift_left240:
;matrixrgb_firmware.c,1248 :: 		}
L_end_display_shift_left:
UNLINK	LR
RETURN	
; end of _display_shift_left
_display_shift_right:
;matrixrgb_firmware.c,1249 :: 		void display_shift_right( void )
LINK	LR, #4
;matrixrgb_firmware.c,1251 :: 		uint16_t row          = 0;
;matrixrgb_firmware.c,1252 :: 		uint16_t column       = 0;
;matrixrgb_firmware.c,1253 :: 		uint16_t temp_col_one = 0;
;matrixrgb_firmware.c,1254 :: 		uint16_t temp_col_two = 0;
;matrixrgb_firmware.c,1255 :: 		uint8_t buffer        = 0;
;matrixrgb_firmware.c,1257 :: 		for ( row = 0; row < p_height; row++ )
; row start address is: 28 (R7)
LDK.L	R7, #0
; row end address is: 28 (R7)
L_display_shift_right245:
; row start address is: 28 (R7)
LDA.S	R0, _p_height+0
CMP.S	R7, R0
JMPC	R30, C, #0, L_display_shift_right246
;matrixrgb_firmware.c,1259 :: 		for ( column = ( p_width - 1 ); column > 0; column-- )
LDA.S	R0, _p_width+0
SUB.L	R8, R0, #1
BEXTU.L	R8, R8, #0
; column start address is: 32 (R8)
; column end address is: 32 (R8)
; row end address is: 28 (R7)
L_display_shift_right248:
; column start address is: 32 (R8)
; row start address is: 28 (R7)
CMP.S	R8, #0
JMPC	R30, A, #0, L_display_shift_right249
;matrixrgb_firmware.c,1263 :: 		temp_col_two = column - 1;
SUB.L	R0, R8, #1
; temp_col_two start address is: 36 (R9)
BEXTU.L	R9, R0, #0
;matrixrgb_firmware.c,1264 :: 		FB[ get_coord_index( row, temp_col_one ) ] = FB[ get_coord_index( row, temp_col_two ) ];
BEXTU.L	R1, R8, #0
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
STI.L	SP, #0, R0
BEXTU.L	R1, R9, #0
; temp_col_two end address is: 36 (R9)
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
LDI.B	R1, R0, #0
LDI.L	R0, SP, #0
STI.B	R0, #0, R1
;matrixrgb_firmware.c,1259 :: 		for ( column = ( p_width - 1 ); column > 0; column-- )
SUB.L	R8, R8, #1
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,1265 :: 		}
; column end address is: 32 (R8)
JMP	L_display_shift_right248
L_display_shift_right249:
;matrixrgb_firmware.c,1266 :: 		erase_pixel( row, 0 );
LDK.L	R1, #0
BEXTU.L	R0, R7, #0
CALL	_erase_pixel+0
;matrixrgb_firmware.c,1257 :: 		for ( row = 0; row < p_height; row++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,1267 :: 		}
; row end address is: 28 (R7)
JMP	L_display_shift_right245
L_display_shift_right246:
;matrixrgb_firmware.c,1269 :: 		}
L_end_display_shift_right:
UNLINK	LR
RETURN	
; end of _display_shift_right
_display_shift_up:
;matrixrgb_firmware.c,1271 :: 		void display_shift_up( void )
;matrixrgb_firmware.c,1273 :: 		uint16_t row          = 0;
;matrixrgb_firmware.c,1274 :: 		uint16_t column       = 0;
;matrixrgb_firmware.c,1275 :: 		uint16_t temp_col     = 0;
;matrixrgb_firmware.c,1276 :: 		uint16_t temp_row     = 0;
;matrixrgb_firmware.c,1277 :: 		uint8_t buffer        = 0;
;matrixrgb_firmware.c,1279 :: 		for ( row = 0; row < p_height; row++ )
; row start address is: 28 (R7)
LDK.L	R7, #0
; row end address is: 28 (R7)
L_display_shift_up251:
; row start address is: 28 (R7)
LDA.S	R0, _p_height+0
CMP.S	R7, R0
JMPC	R30, C, #0, L_display_shift_up252
;matrixrgb_firmware.c,1281 :: 		for ( column = ( p_width - 1 ); column > 0; column-- )
LDA.S	R0, _p_width+0
SUB.L	R8, R0, #1
BEXTU.L	R8, R8, #0
; column start address is: 32 (R8)
; column end address is: 32 (R8)
; row end address is: 28 (R7)
L_display_shift_up254:
; column start address is: 32 (R8)
; row start address is: 28 (R7)
CMP.S	R8, #0
JMPC	R30, A, #0, L_display_shift_up255
;matrixrgb_firmware.c,1283 :: 		if ( row == ( p_height - 1 ) )
LDA.S	R0, _p_height+0
SUB.L	R0, R0, #1
CMP.S	R7, R0
JMPC	R30, Z, #0, L_display_shift_up257
;matrixrgb_firmware.c,1284 :: 		erase_pixel( row, column );
BEXTU.L	R1, R8, #0
BEXTU.L	R0, R7, #0
CALL	_erase_pixel+0
JMP	L_display_shift_up258
L_display_shift_up257:
;matrixrgb_firmware.c,1288 :: 		temp_col   = column;
; temp_col start address is: 36 (R9)
BEXTU.L	R9, R8, #0
;matrixrgb_firmware.c,1289 :: 		temp_row   = row + 1;
ADD.L	R0, R7, #1
BEXTU.L	R0, R0, #0
;matrixrgb_firmware.c,1290 :: 		buffer = FB[ get_coord_index( temp_row, temp_col ) ];
BEXTU.L	R1, R8, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
LDI.B	R0, R0, #0
; buffer start address is: 40 (R10)
BEXTU.L	R10, R0, #256
;matrixrgb_firmware.c,1291 :: 		FB[ get_coord_index( row, temp_col ) ] = buffer;
BEXTU.L	R1, R9, #0
; temp_col end address is: 36 (R9)
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
STI.B	R0, #0, R10
; buffer end address is: 40 (R10)
;matrixrgb_firmware.c,1292 :: 		}
L_display_shift_up258:
;matrixrgb_firmware.c,1281 :: 		for ( column = ( p_width - 1 ); column > 0; column-- )
SUB.L	R8, R8, #1
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,1293 :: 		}
; column end address is: 32 (R8)
JMP	L_display_shift_up254
L_display_shift_up255:
;matrixrgb_firmware.c,1295 :: 		temp_col   = 0;
; temp_col start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,1296 :: 		temp_row   = row + 1;
ADD.L	R0, R7, #1
BEXTU.L	R0, R0, #0
;matrixrgb_firmware.c,1297 :: 		buffer = FB[ get_coord_index( temp_row, temp_col ) ];
LDK.L	R1, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
LDI.B	R0, R0, #0
; buffer start address is: 36 (R9)
BEXTU.L	R9, R0, #256
;matrixrgb_firmware.c,1298 :: 		FB[ get_coord_index( row, temp_col ) ] = buffer;
BEXTU.L	R1, R8, #0
; temp_col end address is: 32 (R8)
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
STI.B	R0, #0, R9
; buffer end address is: 36 (R9)
;matrixrgb_firmware.c,1279 :: 		for ( row = 0; row < p_height; row++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,1299 :: 		}
; row end address is: 28 (R7)
JMP	L_display_shift_up251
L_display_shift_up252:
;matrixrgb_firmware.c,1301 :: 		}
L_end_display_shift_up:
RETURN	
; end of _display_shift_up
_display_shift_down:
;matrixrgb_firmware.c,1303 :: 		void display_shift_down( void )
;matrixrgb_firmware.c,1305 :: 		uint16_t i            = 0;
;matrixrgb_firmware.c,1306 :: 		uint16_t row          = 0;
;matrixrgb_firmware.c,1307 :: 		uint16_t column       = 0;
;matrixrgb_firmware.c,1308 :: 		uint16_t temp_col     = 0;
;matrixrgb_firmware.c,1309 :: 		uint16_t temp_row     = 0;
;matrixrgb_firmware.c,1310 :: 		uint8_t buffer       = 0;
;matrixrgb_firmware.c,1312 :: 		for ( row = ( p_height - 1 ); row > 0; row-- )
LDA.S	R0, _p_height+0
SUB.L	R7, R0, #1
BEXTU.L	R7, R7, #0
; row start address is: 28 (R7)
; row end address is: 28 (R7)
L_display_shift_down259:
; row start address is: 28 (R7)
CMP.S	R7, #0
JMPC	R30, A, #0, L_display_shift_down260
;matrixrgb_firmware.c,1314 :: 		for ( column = ( p_width - 1 ); column > 0; column-- )
LDA.S	R0, _p_width+0
SUB.L	R8, R0, #1
BEXTU.L	R8, R8, #0
; column start address is: 32 (R8)
; column end address is: 32 (R8)
; row end address is: 28 (R7)
L_display_shift_down262:
; column start address is: 32 (R8)
; row start address is: 28 (R7)
CMP.S	R8, #0
JMPC	R30, A, #0, L_display_shift_down263
;matrixrgb_firmware.c,1317 :: 		temp_col   = column;
; temp_col start address is: 36 (R9)
BEXTU.L	R9, R8, #0
;matrixrgb_firmware.c,1318 :: 		temp_row   = row - 1;
SUB.L	R0, R7, #1
BEXTU.L	R0, R0, #0
;matrixrgb_firmware.c,1319 :: 		buffer = FB[ get_coord_index( temp_row, temp_col ) ];
BEXTU.L	R1, R8, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
LDI.B	R0, R0, #0
; buffer start address is: 40 (R10)
BEXTU.L	R10, R0, #256
;matrixrgb_firmware.c,1320 :: 		FB[ get_coord_index( row, temp_col ) ] = buffer;
BEXTU.L	R1, R9, #0
; temp_col end address is: 36 (R9)
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
STI.B	R0, #0, R10
; buffer end address is: 40 (R10)
;matrixrgb_firmware.c,1314 :: 		for ( column = ( p_width - 1 ); column > 0; column-- )
SUB.L	R8, R8, #1
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,1321 :: 		}
; column end address is: 32 (R8)
JMP	L_display_shift_down262
L_display_shift_down263:
;matrixrgb_firmware.c,1323 :: 		temp_col   = 0;
; temp_col start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,1324 :: 		temp_row   = row - 1;
SUB.L	R0, R7, #1
BEXTU.L	R0, R0, #0
;matrixrgb_firmware.c,1325 :: 		buffer = FB[ get_coord_index( temp_row, temp_col ) ];
LDK.L	R1, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
LDI.B	R0, R0, #0
; buffer start address is: 36 (R9)
BEXTU.L	R9, R0, #256
;matrixrgb_firmware.c,1326 :: 		FB[ get_coord_index( row, temp_col ) ] = buffer;
BEXTU.L	R1, R8, #0
; temp_col end address is: 32 (R8)
BEXTU.L	R0, R7, #0
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R1, _FB+0
ADD.L	R0, R1, R0
STI.B	R0, #0, R9
; buffer end address is: 36 (R9)
;matrixrgb_firmware.c,1312 :: 		for ( row = ( p_height - 1 ); row > 0; row-- )
SUB.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,1327 :: 		}
; row end address is: 28 (R7)
JMP	L_display_shift_down259
L_display_shift_down260:
;matrixrgb_firmware.c,1328 :: 		for ( i = 0; i < p_width; i++ )
; i start address is: 28 (R7)
LDK.L	R7, #0
; i end address is: 28 (R7)
L_display_shift_down265:
; i start address is: 28 (R7)
LDA.S	R0, _p_width+0
CMP.S	R7, R0
JMPC	R30, C, #0, L_display_shift_down266
;matrixrgb_firmware.c,1329 :: 		erase_pixel( 0, i );
BEXTU.L	R1, R7, #0
LDK.L	R0, #0
CALL	_erase_pixel+0
;matrixrgb_firmware.c,1328 :: 		for ( i = 0; i < p_width; i++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,1329 :: 		erase_pixel( 0, i );
; i end address is: 28 (R7)
JMP	L_display_shift_down265
L_display_shift_down266:
;matrixrgb_firmware.c,1331 :: 		}
L_end_display_shift_down:
RETURN	
; end of _display_shift_down
_scroll_off_screen_up:
;matrixrgb_firmware.c,1333 :: 		void scroll_off_screen_up( uint16_t speed )
; i start address is: 44 (R11)
LINK	LR, #4
;matrixrgb_firmware.c,1337 :: 		for ( i = 0; i < p_height; i++ )
;matrixrgb_firmware.c,1333 :: 		void scroll_off_screen_up( uint16_t speed )
;matrixrgb_firmware.c,1337 :: 		for ( i = 0; i < p_height; i++ )
;matrixrgb_firmware.c,1333 :: 		void scroll_off_screen_up( uint16_t speed )
STI.S	SP, #0, R0
; i end address is: 44 (R11)
;matrixrgb_firmware.c,1337 :: 		for ( i = 0; i < p_height; i++ )
; i start address is: 44 (R11)
LDK.L	R11, #0
; i end address is: 44 (R11)
L_scroll_off_screen_up268:
; i start address is: 44 (R11)
LDA.S	R1, _p_height+0
CMP.S	R11, R1
JMPC	R30, C, #0, L_scroll_off_screen_up269
;matrixrgb_firmware.c,1339 :: 		display_shift_up();
CALL	_display_shift_up+0
;matrixrgb_firmware.c,1340 :: 		for ( j = 0; j < speed; j++ )
; j start address is: 36 (R9)
LDK.L	R9, #0
; j end address is: 36 (R9)
; i end address is: 44 (R11)
BEXTU.L	R10, R11, #0
L_scroll_off_screen_up271:
; j start address is: 36 (R9)
; i start address is: 40 (R10)
LDI.S	R1, SP, #0
CMP.S	R9, R1
JMPC	R30, C, #0, L_scroll_off_screen_up272
;matrixrgb_firmware.c,1341 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1340 :: 		for ( j = 0; j < speed; j++ )
ADD.L	R1, R9, #1
; j end address is: 36 (R9)
; j start address is: 0 (R0)
BEXTU.L	R0, R1, #0
;matrixrgb_firmware.c,1341 :: 		refresh();
; j end address is: 0 (R0)
BEXTU.L	R9, R0, #0
JMP	L_scroll_off_screen_up271
L_scroll_off_screen_up272:
;matrixrgb_firmware.c,1337 :: 		for ( i = 0; i < p_height; i++ )
ADD.L	R1, R10, #1
; i end address is: 40 (R10)
; i start address is: 44 (R11)
BEXTU.L	R11, R1, #0
;matrixrgb_firmware.c,1342 :: 		}
; i end address is: 44 (R11)
JMP	L_scroll_off_screen_up268
L_scroll_off_screen_up269:
;matrixrgb_firmware.c,1343 :: 		}
L_end_scroll_off_screen_up:
UNLINK	LR
RETURN	
; end of _scroll_off_screen_up
_scroll_off_screen_down:
;matrixrgb_firmware.c,1345 :: 		void scroll_off_screen_down( uint16_t speed )
; i start address is: 44 (R11)
LINK	LR, #4
;matrixrgb_firmware.c,1349 :: 		for ( i = 0; i < p_height; i++ )
;matrixrgb_firmware.c,1345 :: 		void scroll_off_screen_down( uint16_t speed )
;matrixrgb_firmware.c,1349 :: 		for ( i = 0; i < p_height; i++ )
;matrixrgb_firmware.c,1345 :: 		void scroll_off_screen_down( uint16_t speed )
STI.S	SP, #0, R0
; i end address is: 44 (R11)
;matrixrgb_firmware.c,1349 :: 		for ( i = 0; i < p_height; i++ )
; i start address is: 44 (R11)
LDK.L	R11, #0
; i end address is: 44 (R11)
L_scroll_off_screen_down274:
; i start address is: 44 (R11)
LDA.S	R1, _p_height+0
CMP.S	R11, R1
JMPC	R30, C, #0, L_scroll_off_screen_down275
;matrixrgb_firmware.c,1351 :: 		display_shift_down();
CALL	_display_shift_down+0
;matrixrgb_firmware.c,1352 :: 		for ( j = 0; j < speed; j++ )
; j start address is: 36 (R9)
LDK.L	R9, #0
; j end address is: 36 (R9)
; i end address is: 44 (R11)
BEXTU.L	R10, R11, #0
L_scroll_off_screen_down277:
; j start address is: 36 (R9)
; i start address is: 40 (R10)
LDI.S	R1, SP, #0
CMP.S	R9, R1
JMPC	R30, C, #0, L_scroll_off_screen_down278
;matrixrgb_firmware.c,1353 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1352 :: 		for ( j = 0; j < speed; j++ )
ADD.L	R1, R9, #1
; j end address is: 36 (R9)
; j start address is: 0 (R0)
BEXTU.L	R0, R1, #0
;matrixrgb_firmware.c,1353 :: 		refresh();
; j end address is: 0 (R0)
BEXTU.L	R9, R0, #0
JMP	L_scroll_off_screen_down277
L_scroll_off_screen_down278:
;matrixrgb_firmware.c,1349 :: 		for ( i = 0; i < p_height; i++ )
ADD.L	R1, R10, #1
; i end address is: 40 (R10)
; i start address is: 44 (R11)
BEXTU.L	R11, R1, #0
;matrixrgb_firmware.c,1354 :: 		}
; i end address is: 44 (R11)
JMP	L_scroll_off_screen_down274
L_scroll_off_screen_down275:
;matrixrgb_firmware.c,1356 :: 		}
L_end_scroll_off_screen_down:
UNLINK	LR
RETURN	
; end of _scroll_off_screen_down
_write_pixel_img:
;matrixrgb_firmware.c,1358 :: 		void write_pixel_img( uint16_t row, uint16_t column, char red, char green, char blue)
; blue start address is: 16 (R4)
; green start address is: 12 (R3)
; red start address is: 8 (R2)
; column start address is: 4 (R1)
; row start address is: 0 (R0)
; blue end address is: 16 (R4)
; green end address is: 12 (R3)
; red end address is: 8 (R2)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 0 (R0)
; column start address is: 4 (R1)
; red start address is: 8 (R2)
; green start address is: 12 (R3)
; blue start address is: 16 (R4)
;matrixrgb_firmware.c,1360 :: 		uint8_t buffer = 0;
; buffer start address is: 24 (R6)
LDK.L	R6, #0
;matrixrgb_firmware.c,1362 :: 		if ( ( red & 0x18 ) > 0 )
AND.L	R5, R2, #24
; red end address is: 8 (R2)
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel_img299
;matrixrgb_firmware.c,1363 :: 		buffer |= 0x04;
OR.L	R2, R6, #4
BEXTU.L	R2, R2, #256
; buffer end address is: 24 (R6)
; buffer start address is: 8 (R2)
; buffer end address is: 8 (R2)
JMP	L_write_pixel_img280
L__write_pixel_img299:
;matrixrgb_firmware.c,1362 :: 		if ( ( red & 0x18 ) > 0 )
BEXTU.L	R2, R6, #256
;matrixrgb_firmware.c,1363 :: 		buffer |= 0x04;
L_write_pixel_img280:
;matrixrgb_firmware.c,1364 :: 		if ( ( green & 0x38 ) > 0 )
; buffer start address is: 8 (R2)
AND.L	R5, R3, #56
; green end address is: 12 (R3)
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel_img300
;matrixrgb_firmware.c,1365 :: 		buffer |= 0x02;
OR.L	R5, R2, #2
BEXTU.L	R2, R5, #256
; buffer end address is: 8 (R2)
BEXTU.L	R7, R2, #256
JMP	L_write_pixel_img281
L__write_pixel_img300:
;matrixrgb_firmware.c,1364 :: 		if ( ( green & 0x38 ) > 0 )
BEXTU.L	R7, R2, #256
;matrixrgb_firmware.c,1365 :: 		buffer |= 0x02;
L_write_pixel_img281:
;matrixrgb_firmware.c,1366 :: 		if ( ( blue & 0x18 ) > 0 )
; buffer start address is: 28 (R7)
AND.L	R5, R4, #24
; blue end address is: 16 (R4)
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel_img301
;matrixrgb_firmware.c,1367 :: 		buffer |= 0x01;
OR.L	R7, R7, #1
BEXTU.L	R7, R7, #256
; buffer end address is: 28 (R7)
JMP	L_write_pixel_img282
L__write_pixel_img301:
;matrixrgb_firmware.c,1366 :: 		if ( ( blue & 0x18 ) > 0 )
;matrixrgb_firmware.c,1367 :: 		buffer |= 0x01;
L_write_pixel_img282:
;matrixrgb_firmware.c,1368 :: 		FB[ get_coord_index( row, column ) ] = buffer;
; buffer start address is: 28 (R7)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R5, _FB+0
ADD.L	R5, R5, R0
STI.B	R5, #0, R7
; buffer end address is: 28 (R7)
;matrixrgb_firmware.c,1369 :: 		}
L_end_write_pixel_img:
RETURN	
; end of _write_pixel_img
_write_pixel:
;matrixrgb_firmware.c,1371 :: 		void write_pixel( uint16_t row, uint16_t column, char red, char green, char blue)
; blue start address is: 16 (R4)
; green start address is: 12 (R3)
; red start address is: 8 (R2)
; column start address is: 4 (R1)
; row start address is: 0 (R0)
BEXTU.L	R5, R2, #256
; blue end address is: 16 (R4)
; green end address is: 12 (R3)
; red end address is: 8 (R2)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 0 (R0)
; column start address is: 4 (R1)
; red start address is: 20 (R5)
; green start address is: 12 (R3)
; blue start address is: 16 (R4)
;matrixrgb_firmware.c,1373 :: 		uint8_t buffer = 0;
; buffer start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,1375 :: 		if ( red  > 0 )
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel291
; red end address is: 20 (R5)
;matrixrgb_firmware.c,1376 :: 		buffer |= 0x04;
OR.L	R2, R2, #4
BEXTU.L	R2, R2, #256
; buffer end address is: 8 (R2)
JMP	L_write_pixel283
L__write_pixel291:
;matrixrgb_firmware.c,1375 :: 		if ( red  > 0 )
;matrixrgb_firmware.c,1376 :: 		buffer |= 0x04;
L_write_pixel283:
;matrixrgb_firmware.c,1377 :: 		if ( green > 0 )
; buffer start address is: 8 (R2)
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_pixel292
; green end address is: 12 (R3)
;matrixrgb_firmware.c,1378 :: 		buffer |= 0x02;
OR.L	R5, R2, #2
BEXTU.L	R2, R5, #256
; buffer end address is: 8 (R2)
BEXTU.L	R7, R2, #256
JMP	L_write_pixel284
L__write_pixel292:
;matrixrgb_firmware.c,1377 :: 		if ( green > 0 )
BEXTU.L	R7, R2, #256
;matrixrgb_firmware.c,1378 :: 		buffer |= 0x02;
L_write_pixel284:
;matrixrgb_firmware.c,1379 :: 		if ( blue > 0 )
; buffer start address is: 28 (R7)
CMP.B	R4, #0
JMPC	R30, A, #0, L__write_pixel293
; blue end address is: 16 (R4)
;matrixrgb_firmware.c,1380 :: 		buffer |= 0x01;
OR.L	R7, R7, #1
BEXTU.L	R7, R7, #256
; buffer end address is: 28 (R7)
JMP	L_write_pixel285
L__write_pixel293:
;matrixrgb_firmware.c,1379 :: 		if ( blue > 0 )
;matrixrgb_firmware.c,1380 :: 		buffer |= 0x01;
L_write_pixel285:
;matrixrgb_firmware.c,1382 :: 		FB[ get_coord_index( row, column ) ] = buffer;
; buffer start address is: 28 (R7)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R5, _FB+0
ADD.L	R5, R5, R0
STI.B	R5, #0, R7
; buffer end address is: 28 (R7)
;matrixrgb_firmware.c,1384 :: 		}
L_end_write_pixel:
RETURN	
; end of _write_pixel
_erase_pixel:
;matrixrgb_firmware.c,1386 :: 		void erase_pixel( uint16_t row, uint16_t column )
; column start address is: 4 (R1)
; row start address is: 0 (R0)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 0 (R0)
; column start address is: 4 (R1)
;matrixrgb_firmware.c,1388 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,1390 :: 		FB[get_coord_index( row, column ) ] = 0x00;
; column end address is: 4 (R1)
; row end address is: 0 (R0)
CALL	matrixrgb_firmware_get_coord_index+0
LDA.L	R2, _FB+0
ADD.L	R3, R2, R0
LDK.L	R2, #0
STI.B	R3, #0, R2
;matrixrgb_firmware.c,1391 :: 		}
L_end_erase_pixel:
RETURN	
; end of _erase_pixel
_setup_timer:
;matrixrgb_firmware.c,1393 :: 		void setup_timer( void )    //3 us Timer not used in End-User application
;matrixrgb_firmware.c,1395 :: 		TIMER_CONTROL_0 = 2;
LDK.L	R0, #2
STA.B	TIMER_CONTROL_0+0, R0
;matrixrgb_firmware.c,1396 :: 		TIMER_SELECT = 0;
LDK.L	R1, #0
STA.B	TIMER_SELECT+0, R1
;matrixrgb_firmware.c,1397 :: 		TIMER_PRESC_LS = 0;
STA.B	TIMER_PRESC_LS+0, R1
;matrixrgb_firmware.c,1398 :: 		TIMER_PRESC_MS = 0;
STA.B	TIMER_PRESC_MS+0, R1
;matrixrgb_firmware.c,1399 :: 		TIMER_WRITE_LS = 43;
LDK.L	R0, #43
STA.B	TIMER_WRITE_LS+0, R0
;matrixrgb_firmware.c,1400 :: 		TIMER_WRITE_MS = 1;
LDK.L	R0, #1
STA.B	TIMER_WRITE_MS+0, R0
;matrixrgb_firmware.c,1401 :: 		TIMER_CONTROL_3 = 0;
STA.B	TIMER_CONTROL_3+0, R1
;matrixrgb_firmware.c,1402 :: 		TIMER_CONTROL_4 |= 17;
LDA.B	R0, TIMER_CONTROL_4+0
OR.L	R0, R0, #17
STA.B	TIMER_CONTROL_4+0, R0
;matrixrgb_firmware.c,1403 :: 		TIMER_CONTROL_2 |= 0;
LDA.B	R0, TIMER_CONTROL_2+0
STA.B	TIMER_CONTROL_2+0, R0
;matrixrgb_firmware.c,1404 :: 		TIMER_INT |= 2;
LDA.B	R0, TIMER_INT+0
OR.L	R0, R0, #2
STA.B	TIMER_INT+0, R0
;matrixrgb_firmware.c,1405 :: 		TIMER_CONTROL_1 |= 1;
LDA.B	R0, TIMER_CONTROL_1+0
OR.L	R0, R0, #1
STA.B	TIMER_CONTROL_1+0, R0
;matrixrgb_firmware.c,1406 :: 		IRQ_CTRL.B31 = 0;
LDA.x	R0, #AlignedAddress(IRQ_CTRL+0)
BINS.L	R0, R0, #63
STI.x	IRQ_CTRL+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,1407 :: 		}
L_end_setup_timer:
RETURN	
; end of _setup_timer
_TimerInterrupt:
;matrixrgb_firmware.c,1409 :: 		void TimerInterrupt(void) iv IVT_TIMERS_IRQ
;matrixrgb_firmware.c,1413 :: 		if (TIMER_INT_A_bit)
LDA.x	R0, #AlignedAddress(TIMER_INT_A_bit+0)
BEXTU.L	R0, R0, #BitPos(TIMER_INT_A_bit+0)
CMP.L	R0, #0
JMPC	R30, Z, #1, L_TimerInterrupt286
;matrixrgb_firmware.c,1414 :: 		TIMER_INT = (TIMER_INT & 0xAA) | (1 << 0);
LDA.B	R0, TIMER_INT+0
AND.L	R0, R0, #170
BEXTU.L	R0, R0, #256
OR.L	R0, R0, #1
STA.B	TIMER_INT+0, R0
L_TimerInterrupt286:
;matrixrgb_firmware.c,1415 :: 		}
L_end_TimerInterrupt:
RETI	
; end of _TimerInterrupt
