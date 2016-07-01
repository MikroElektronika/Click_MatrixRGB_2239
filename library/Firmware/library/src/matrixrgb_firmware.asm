_setup_command:
;matrixrgb_firmware.c,83 :: 		void setup_command( void )
;matrixrgb_firmware.c,86 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,87 :: 		system_setup( firm_buffer[0], firm_buffer[1] );
LDA.B	R1, _firm_buffer+1
LDA.B	R0, _firm_buffer+0
CALL	_system_setup+0
;matrixrgb_firmware.c,88 :: 		}
L_end_setup_command:
RETURN	
; end of _setup_command
_write_text_command:
;matrixrgb_firmware.c,90 :: 		void write_text_command( void )
LINK	LR, #260
;matrixrgb_firmware.c,92 :: 		uint8_t text[256] = { 0 };
ADD.L	R27, SP, #3
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSwrite_text_command_text_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,93 :: 		char *ptr = text;
ADD.L	R7, SP, #3
; ptr start address is: 28 (R7)
;matrixrgb_firmware.c,94 :: 		uint8_t i = 0;
;matrixrgb_firmware.c,95 :: 		uint8_t size = 0;
;matrixrgb_firmware.c,100 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,101 :: 		size = firm_buffer[0];
; size start address is: 20 (R5)
LDA.B	R5, _firm_buffer+0
;matrixrgb_firmware.c,102 :: 		receive_data( &firm_buffer, 3 );
LDK.L	R1, #3
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,103 :: 		my_color.red   = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	SP, #0, R0
;matrixrgb_firmware.c,104 :: 		my_color.green = firm_buffer[1];
LDA.B	R0, _firm_buffer+1
STI.B	SP, #1, R0
;matrixrgb_firmware.c,105 :: 		my_color.blue  = firm_buffer[2];
LDA.B	R0, _firm_buffer+2
STI.B	SP, #2, R0
;matrixrgb_firmware.c,106 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,107 :: 		start_row = firm_buffer[0];
; start_row start address is: 16 (R4)
LDA.B	R4, _firm_buffer+0
;matrixrgb_firmware.c,108 :: 		start_col = firm_buffer[1];
; start_col start address is: 12 (R3)
LDA.B	R3, _firm_buffer+1
;matrixrgb_firmware.c,111 :: 		for( i = 0; i < size; i++ )
; i start address is: 24 (R6)
LDK.L	R6, #0
; start_col end address is: 12 (R3)
; start_row end address is: 16 (R4)
; size end address is: 20 (R5)
; ptr end address is: 28 (R7)
; i end address is: 24 (R6)
L_write_text_command0:
; i start address is: 24 (R6)
; start_col start address is: 12 (R3)
; start_row start address is: 16 (R4)
; size start address is: 20 (R5)
; ptr start address is: 28 (R7)
CMP.B	R6, R5
JMPC	R30, C, #0, L_write_text_command1
;matrixrgb_firmware.c,113 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,114 :: 		*ptr++ = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	R7, #0, R0
ADD.L	R7, R7, #1
;matrixrgb_firmware.c,111 :: 		for( i = 0; i < size; i++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,115 :: 		}
; size end address is: 20 (R5)
; ptr end address is: 28 (R7)
; i end address is: 24 (R6)
JMP	L_write_text_command0
L_write_text_command1:
;matrixrgb_firmware.c,116 :: 		write_text( text, my_color, start_row, start_col );
ADD.L	R0, SP, #3
BEXTU.L	R2, R3, #256
; start_col end address is: 12 (R3)
BEXTU.L	R1, R4, #256
; start_row end address is: 16 (R4)
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_write_text+0
ADD.L	SP, SP, #4
;matrixrgb_firmware.c,118 :: 		}
L_end_write_text_command:
UNLINK	LR
RETURN	
; end of _write_text_command
_my_img_load:
;matrixrgb_firmware.c,120 :: 		void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
; i start address is: 44 (R11)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
LINK	LR, #4
;matrixrgb_firmware.c,126 :: 		for( i = 0; i < height; i++ )
;matrixrgb_firmware.c,120 :: 		void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
;matrixrgb_firmware.c,126 :: 		for( i = 0; i < height; i++ )
;matrixrgb_firmware.c,120 :: 		void my_img_load( uint8_t *img, uint8_t width, uint8_t height )
; i end address is: 44 (R11)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
; width start address is: 4 (R1)
; height start address is: 8 (R2)
;matrixrgb_firmware.c,126 :: 		for( i = 0; i < height; i++ )
; i start address is: 44 (R11)
LDK.L	R11, #0
; width end address is: 4 (R1)
; height end address is: 8 (R2)
; i end address is: 44 (R11)
BEXTU.L	R8, R1, #256
BEXTU.L	R9, R2, #256
L_my_img_load3:
; i start address is: 44 (R11)
; height start address is: 36 (R9)
; width start address is: 32 (R8)
CMP.S	R11, R9
JMPC	R30, GTE, #1, L_my_img_load4
;matrixrgb_firmware.c,128 :: 		cnt = 0;
; cnt start address is: 40 (R10)
LDK.L	R10, #0
;matrixrgb_firmware.c,129 :: 		for( j = 0; j < width; j++ )
; j start address is: 48 (R12)
LDK.L	R12, #0
; width end address is: 32 (R8)
; height end address is: 36 (R9)
; j end address is: 48 (R12)
; i end address is: 44 (R11)
L_my_img_load6:
; j start address is: 48 (R12)
; cnt start address is: 40 (R10)
; cnt end address is: 40 (R10)
; width start address is: 32 (R8)
; height start address is: 36 (R9)
; i start address is: 44 (R11)
CMP.S	R12, R8
JMPC	R30, GTE, #1, L_my_img_load7
; cnt end address is: 40 (R10)
;matrixrgb_firmware.c,131 :: 		tmpCol = firm_buffer[cnt] + (firm_buffer[cnt + 1] << 8);
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
;matrixrgb_firmware.c,132 :: 		red = tmpCol >> 11;
BEXTU.L	R3, R6, #0
LSHR.L	R5, R3, #11
;matrixrgb_firmware.c,133 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R3, #2047
AND.L	R3, R6, R3
BEXTU.L	R3, R3, #0
LSHR.L	R4, R3, #5
;matrixrgb_firmware.c,134 :: 		blue = tmpCol & 0x1F;
AND.L	R3, R6, #31
;matrixrgb_firmware.c,136 :: 		write_pixel_img( i, j, red, green, blue);
STI.S	SP, #0, R4
BEXTU.L	R2, R5, #256
BEXTS.L	R1, R12, #0
BEXTS.L	R0, R11, #0
BEXTU.L	R4, R3, #256
LDI.B	R3, SP, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,129 :: 		for( j = 0; j < width; j++ )
ADD.L	R12, R12, #1
BEXTS.L	R12, R12, #0
;matrixrgb_firmware.c,137 :: 		}
; cnt end address is: 40 (R10)
; j end address is: 48 (R12)
JMP	L_my_img_load6
L_my_img_load7:
;matrixrgb_firmware.c,126 :: 		for( i = 0; i < height; i++ )
ADD.L	R11, R11, #1
BEXTS.L	R11, R11, #0
;matrixrgb_firmware.c,139 :: 		}
; width end address is: 32 (R8)
; height end address is: 36 (R9)
; i end address is: 44 (R11)
JMP	L_my_img_load3
L_my_img_load4:
;matrixrgb_firmware.c,141 :: 		}
L_end_my_img_load:
UNLINK	LR
RETURN	
; end of _my_img_load
_image_load_command:
;matrixrgb_firmware.c,143 :: 		void image_load_command( void )
;matrixrgb_firmware.c,150 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,151 :: 		wid = firm_buffer[0];
; wid start address is: 32 (R8)
LDA.B	R8, _firm_buffer+0
;matrixrgb_firmware.c,152 :: 		hei = firm_buffer[1];
; hei start address is: 36 (R9)
LDA.B	R9, _firm_buffer+1
;matrixrgb_firmware.c,154 :: 		for( i = 0; i < hei; i++ )
; i start address is: 0 (R0)
LDK.L	R0, #0
; i end address is: 0 (R0)
; wid end address is: 32 (R8)
; hei end address is: 36 (R9)
BEXTS.L	R10, R0, #0
L_image_load_command9:
; i start address is: 40 (R10)
; hei start address is: 36 (R9)
; wid start address is: 32 (R8)
CMP.S	R10, R9
JMPC	R30, GTE, #1, L_image_load_command10
;matrixrgb_firmware.c,155 :: 		for( j = 0; j < wid; j++ )
; j start address is: 44 (R11)
LDK.L	R11, #0
; wid end address is: 32 (R8)
; hei end address is: 36 (R9)
; j end address is: 44 (R11)
; i end address is: 40 (R10)
L_image_load_command12:
; j start address is: 44 (R11)
; wid start address is: 32 (R8)
; hei start address is: 36 (R9)
; i start address is: 40 (R10)
CMP.S	R11, R8
JMPC	R30, GTE, #1, L_image_load_command13
;matrixrgb_firmware.c,157 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,159 :: 		tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
LDA.B	R0, _firm_buffer+1
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
ADD.L	R3, R0, R1
BEXTU.L	R3, R3, #0
;matrixrgb_firmware.c,160 :: 		red = tmpCol >> 11;
BEXTU.L	R0, R3, #0
LSHR.L	R2, R0, #11
;matrixrgb_firmware.c,161 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R0, #2047
AND.L	R0, R3, R0
BEXTU.L	R0, R0, #0
LSHR.L	R1, R0, #5
;matrixrgb_firmware.c,162 :: 		blue = tmpCol & 0x1F;
AND.L	R0, R3, #31
;matrixrgb_firmware.c,164 :: 		write_pixel_img( i, j, red, green, blue);
BEXTU.L	R4, R0, #256
BEXTU.L	R3, R1, #256
BEXTU.L	R2, R2, #256
BEXTS.L	R1, R11, #0
BEXTS.L	R0, R10, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,155 :: 		for( j = 0; j < wid; j++ )
ADD.L	R11, R11, #1
BEXTS.L	R11, R11, #0
;matrixrgb_firmware.c,165 :: 		}
; j end address is: 44 (R11)
JMP	L_image_load_command12
L_image_load_command13:
;matrixrgb_firmware.c,154 :: 		for( i = 0; i < hei; i++ )
ADD.L	R10, R10, #1
BEXTS.L	R10, R10, #0
;matrixrgb_firmware.c,165 :: 		}
; wid end address is: 32 (R8)
; hei end address is: 36 (R9)
; i end address is: 40 (R10)
JMP	L_image_load_command9
L_image_load_command10:
;matrixrgb_firmware.c,167 :: 		}
L_end_image_load_command:
RETURN	
; end of _image_load_command
_scroll_img_left_command:
;matrixrgb_firmware.c,169 :: 		void scroll_img_left_command( void )
;matrixrgb_firmware.c,175 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,176 :: 		uint8_t speed  = 0;
;matrixrgb_firmware.c,178 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,179 :: 		img_w = firm_buffer[0];
; img_w start address is: 60 (R15)
LDA.B	R15, _firm_buffer+0
;matrixrgb_firmware.c,180 :: 		img_h = firm_buffer[1];
; img_h start address is: 44 (R11)
LDA.B	R11, _firm_buffer+1
;matrixrgb_firmware.c,181 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,182 :: 		speed = firm_buffer[0];
; speed start address is: 40 (R10)
LDA.B	R10, _firm_buffer+0
;matrixrgb_firmware.c,183 :: 		allocate_image( img_w, img_h );
BEXTU.L	R1, R11, #256
BEXTU.L	R0, R15, #256
CALL	_allocate_image+0
;matrixrgb_firmware.c,186 :: 		for( i = 0; i < img_h; i++ )
; i start address is: 24 (R6)
LDK.L	R6, #0
; speed end address is: 40 (R10)
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
; i end address is: 24 (R6)
BEXTU.L	R5, R10, #256
L_scroll_img_left_command15:
; i start address is: 24 (R6)
; speed start address is: 20 (R5)
; img_h start address is: 44 (R11)
; img_w start address is: 60 (R15)
CMP.S	R6, R11
JMPC	R30, C, #0, L_scroll_img_left_command16
;matrixrgb_firmware.c,187 :: 		for( j = 0; j < img_w; j++ )
; j start address is: 28 (R7)
LDK.L	R7, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
; speed end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
BEXTU.L	R4, R11, #256
BEXTU.L	R3, R15, #256
L_scroll_img_left_command18:
; j start address is: 28 (R7)
; img_w start address is: 12 (R3)
; img_h start address is: 16 (R4)
; speed start address is: 20 (R5)
; i start address is: 24 (R6)
CMP.S	R7, R3
JMPC	R30, C, #0, L_scroll_img_left_command19
;matrixrgb_firmware.c,189 :: 		buffer = 0;
; buffer start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,190 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,192 :: 		tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
LDA.B	R0, _firm_buffer+1
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
ADD.L	R2, R0, R1
BEXTU.L	R2, R2, #0
;matrixrgb_firmware.c,193 :: 		red = tmpCol >> 11;
BEXTU.L	R0, R2, #0
LSHR.L	R1, R0, #11
;matrixrgb_firmware.c,194 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R0, #2047
AND.L	R0, R2, R0
BEXTU.L	R0, R0, #0
LSHR.L	R0, R0, #5
; green start address is: 36 (R9)
BEXTU.L	R9, R0, #256
;matrixrgb_firmware.c,195 :: 		blue = tmpCol & 0x1F;
AND.L	R0, R2, #31
; blue start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,196 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R0, R1, #256
AND.L	R0, R0, #24
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_left_command327
;matrixrgb_firmware.c,197 :: 		buffer |= 0x04;
OR.L	R1, R8, #4
BEXTU.L	R1, R1, #256
; buffer end address is: 32 (R8)
; buffer start address is: 4 (R1)
; buffer end address is: 4 (R1)
JMP	L_scroll_img_left_command21
L__scroll_img_left_command327:
;matrixrgb_firmware.c,196 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R1, R8, #256
;matrixrgb_firmware.c,197 :: 		buffer |= 0x04;
L_scroll_img_left_command21:
;matrixrgb_firmware.c,198 :: 		if( ( green & 0x38 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R9, #56
; green end address is: 36 (R9)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_left_command328
;matrixrgb_firmware.c,199 :: 		buffer |= 0x02;
OR.L	R1, R1, #2
BEXTU.L	R1, R1, #256
; buffer end address is: 4 (R1)
JMP	L_scroll_img_left_command22
L__scroll_img_left_command328:
;matrixrgb_firmware.c,198 :: 		if( ( green & 0x38 ) > 0 )
;matrixrgb_firmware.c,199 :: 		buffer |= 0x02;
L_scroll_img_left_command22:
;matrixrgb_firmware.c,200 :: 		if( ( blue & 0x18 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R2, #24
; blue end address is: 8 (R2)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_left_command329
;matrixrgb_firmware.c,201 :: 		buffer |= 0x01;
OR.L	R2, R1, #1
BEXTU.L	R2, R2, #256
; buffer end address is: 4 (R1)
; buffer start address is: 8 (R2)
; buffer end address is: 8 (R2)
JMP	L_scroll_img_left_command23
L__scroll_img_left_command329:
;matrixrgb_firmware.c,200 :: 		if( ( blue & 0x18 ) > 0 )
BEXTU.L	R2, R1, #256
;matrixrgb_firmware.c,201 :: 		buffer |= 0x01;
L_scroll_img_left_command23:
;matrixrgb_firmware.c,202 :: 		img[( i * img_w ) + j] = buffer;
; buffer start address is: 8 (R2)
MUL.L	R0, R6, R3
BEXTU.L	R0, R0, #0
ADD.L	R1, R0, R7
BEXTU.L	R1, R1, #0
LDA.L	R0, matrixrgb_firmware_img+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R2
; buffer end address is: 8 (R2)
;matrixrgb_firmware.c,187 :: 		for( j = 0; j < img_w; j++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,203 :: 		}
; j end address is: 28 (R7)
JMP	L_scroll_img_left_command18
L_scroll_img_left_command19:
;matrixrgb_firmware.c,186 :: 		for( i = 0; i < img_h; i++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #0
;matrixrgb_firmware.c,203 :: 		}
BEXTU.L	R15, R3, #256
; img_w end address is: 12 (R3)
; img_h end address is: 16 (R4)
; i end address is: 24 (R6)
BEXTU.L	R11, R4, #256
JMP	L_scroll_img_left_command15
L_scroll_img_left_command16:
;matrixrgb_firmware.c,204 :: 		scroll_image_onto_right( img, img_w, img_h, speed );
; img_w start address is: 60 (R15)
; img_h start address is: 44 (R11)
LDA.L	R0, matrixrgb_firmware_img+0
BEXTU.L	R3, R5, #256
; speed end address is: 20 (R5)
BEXTU.L	R2, R11, #256
BEXTU.L	R1, R15, #256
CALL	_scroll_image_onto_right+0
;matrixrgb_firmware.c,207 :: 		Free( img, (img_w * img_h) );
MUL.L	R1, R15, R11
BEXTS.L	R1, R1, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
LDA.L	R0, matrixrgb_firmware_img+0
CALL	_Free+0
;matrixrgb_firmware.c,208 :: 		}
L_end_scroll_img_left_command:
RETURN	
; end of _scroll_img_left_command
_scroll_img_right_command:
;matrixrgb_firmware.c,211 :: 		void scroll_img_right_command( void )
;matrixrgb_firmware.c,217 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,218 :: 		uint8_t speed  = 0;
;matrixrgb_firmware.c,220 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,221 :: 		img_w = firm_buffer[0];
; img_w start address is: 60 (R15)
LDA.B	R15, _firm_buffer+0
;matrixrgb_firmware.c,222 :: 		img_h = firm_buffer[1];
; img_h start address is: 44 (R11)
LDA.B	R11, _firm_buffer+1
;matrixrgb_firmware.c,223 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,224 :: 		speed = firm_buffer[0];
; speed start address is: 40 (R10)
LDA.B	R10, _firm_buffer+0
;matrixrgb_firmware.c,225 :: 		allocate_image( img_w, img_h );
BEXTU.L	R1, R11, #256
BEXTU.L	R0, R15, #256
CALL	_allocate_image+0
;matrixrgb_firmware.c,228 :: 		for( i = 0; i < img_h; i++ )
; i start address is: 24 (R6)
LDK.L	R6, #0
; speed end address is: 40 (R10)
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
; i end address is: 24 (R6)
BEXTU.L	R5, R10, #256
L_scroll_img_right_command24:
; i start address is: 24 (R6)
; speed start address is: 20 (R5)
; img_h start address is: 44 (R11)
; img_w start address is: 60 (R15)
CMP.S	R6, R11
JMPC	R30, C, #0, L_scroll_img_right_command25
;matrixrgb_firmware.c,229 :: 		for( j = 0; j < img_w; j++ )
; j start address is: 28 (R7)
LDK.L	R7, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
; speed end address is: 20 (R5)
; j end address is: 28 (R7)
; i end address is: 24 (R6)
BEXTU.L	R4, R11, #256
BEXTU.L	R3, R15, #256
L_scroll_img_right_command27:
; j start address is: 28 (R7)
; img_w start address is: 12 (R3)
; img_h start address is: 16 (R4)
; speed start address is: 20 (R5)
; i start address is: 24 (R6)
CMP.S	R7, R3
JMPC	R30, C, #0, L_scroll_img_right_command28
;matrixrgb_firmware.c,231 :: 		buffer = 0;
; buffer start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,232 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,234 :: 		tmpCol = firm_buffer[0] + (firm_buffer[1] << 8);
LDA.B	R0, _firm_buffer+1
ASHL.L	R1, R0, #8
BEXTU.L	R1, R1, #0
LDA.B	R0, _firm_buffer+0
ADD.L	R2, R0, R1
BEXTU.L	R2, R2, #0
;matrixrgb_firmware.c,235 :: 		red = tmpCol >> 11;
BEXTU.L	R0, R2, #0
LSHR.L	R1, R0, #11
;matrixrgb_firmware.c,236 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R0, #2047
AND.L	R0, R2, R0
BEXTU.L	R0, R0, #0
LSHR.L	R0, R0, #5
; green start address is: 36 (R9)
BEXTU.L	R9, R0, #256
;matrixrgb_firmware.c,237 :: 		blue = tmpCol & 0x1F;
AND.L	R0, R2, #31
; blue start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,238 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R0, R1, #256
AND.L	R0, R0, #24
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_right_command330
;matrixrgb_firmware.c,239 :: 		buffer |= 0x04;
OR.L	R1, R8, #4
BEXTU.L	R1, R1, #256
; buffer end address is: 32 (R8)
; buffer start address is: 4 (R1)
; buffer end address is: 4 (R1)
JMP	L_scroll_img_right_command30
L__scroll_img_right_command330:
;matrixrgb_firmware.c,238 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R1, R8, #256
;matrixrgb_firmware.c,239 :: 		buffer |= 0x04;
L_scroll_img_right_command30:
;matrixrgb_firmware.c,240 :: 		if( ( green & 0x38 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R9, #56
; green end address is: 36 (R9)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_right_command331
;matrixrgb_firmware.c,241 :: 		buffer |= 0x02;
OR.L	R1, R1, #2
BEXTU.L	R1, R1, #256
; buffer end address is: 4 (R1)
JMP	L_scroll_img_right_command31
L__scroll_img_right_command331:
;matrixrgb_firmware.c,240 :: 		if( ( green & 0x38 ) > 0 )
;matrixrgb_firmware.c,241 :: 		buffer |= 0x02;
L_scroll_img_right_command31:
;matrixrgb_firmware.c,242 :: 		if( ( blue & 0x18 ) > 0 )
; buffer start address is: 4 (R1)
AND.L	R0, R2, #24
; blue end address is: 8 (R2)
CMP.B	R0, #0
JMPC	R30, A, #0, L__scroll_img_right_command332
;matrixrgb_firmware.c,243 :: 		buffer |= 0x01;
OR.L	R2, R1, #1
BEXTU.L	R2, R2, #256
; buffer end address is: 4 (R1)
; buffer start address is: 8 (R2)
; buffer end address is: 8 (R2)
JMP	L_scroll_img_right_command32
L__scroll_img_right_command332:
;matrixrgb_firmware.c,242 :: 		if( ( blue & 0x18 ) > 0 )
BEXTU.L	R2, R1, #256
;matrixrgb_firmware.c,243 :: 		buffer |= 0x01;
L_scroll_img_right_command32:
;matrixrgb_firmware.c,244 :: 		img[( i * img_w ) + j] = buffer;
; buffer start address is: 8 (R2)
MUL.L	R0, R6, R3
BEXTU.L	R0, R0, #0
ADD.L	R1, R0, R7
BEXTU.L	R1, R1, #0
LDA.L	R0, matrixrgb_firmware_img+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R2
; buffer end address is: 8 (R2)
;matrixrgb_firmware.c,229 :: 		for( j = 0; j < img_w; j++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #0
;matrixrgb_firmware.c,245 :: 		}
; j end address is: 28 (R7)
JMP	L_scroll_img_right_command27
L_scroll_img_right_command28:
;matrixrgb_firmware.c,228 :: 		for( i = 0; i < img_h; i++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #0
;matrixrgb_firmware.c,245 :: 		}
BEXTU.L	R15, R3, #256
; img_w end address is: 12 (R3)
; img_h end address is: 16 (R4)
; i end address is: 24 (R6)
BEXTU.L	R11, R4, #256
JMP	L_scroll_img_right_command24
L_scroll_img_right_command25:
;matrixrgb_firmware.c,246 :: 		scroll_image_onto_left( img, img_w, img_h, speed );
; img_w start address is: 60 (R15)
; img_h start address is: 44 (R11)
LDA.L	R0, matrixrgb_firmware_img+0
BEXTU.L	R3, R5, #256
; speed end address is: 20 (R5)
BEXTU.L	R2, R11, #256
BEXTU.L	R1, R15, #256
CALL	_scroll_image_onto_left+0
;matrixrgb_firmware.c,249 :: 		Free( img, (img_w * img_h) );
MUL.L	R1, R15, R11
BEXTS.L	R1, R1, #0
; img_h end address is: 44 (R11)
; img_w end address is: 60 (R15)
LDA.L	R0, matrixrgb_firmware_img+0
CALL	_Free+0
;matrixrgb_firmware.c,250 :: 		}
L_end_scroll_img_right_command:
RETURN	
; end of _scroll_img_right_command
_write_pxl_command:
;matrixrgb_firmware.c,252 :: 		void write_pxl_command( void )
;matrixrgb_firmware.c,254 :: 		receive_data( &firm_buffer, 5 );
LDK.L	R1, #5
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,255 :: 		write_pixel( firm_buffer[0], firm_buffer[1], firm_buffer[2], firm_buffer[3], firm_buffer[4] );
LDA.B	R4, _firm_buffer+4
LDA.B	R3, _firm_buffer+3
LDA.B	R2, _firm_buffer+2
LDA.B	R1, _firm_buffer+1
LDA.B	R0, _firm_buffer+0
CALL	_write_pixel+0
;matrixrgb_firmware.c,256 :: 		}
L_end_write_pxl_command:
RETURN	
; end of _write_pxl_command
_write_pxl_img_command:
;matrixrgb_firmware.c,259 :: 		void write_pxl_img_command( void )
;matrixrgb_firmware.c,261 :: 		receive_data( &firm_buffer, 5 );
LDK.L	R1, #5
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,262 :: 		write_pixel_img( firm_buffer[0], firm_buffer[1], firm_buffer[2], firm_buffer[3], firm_buffer[4] );
LDA.B	R4, _firm_buffer+4
LDA.B	R3, _firm_buffer+3
LDA.B	R2, _firm_buffer+2
LDA.B	R1, _firm_buffer+1
LDA.B	R0, _firm_buffer+0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,263 :: 		}
L_end_write_pxl_img_command:
RETURN	
; end of _write_pxl_img_command
_erase_pxl_command:
;matrixrgb_firmware.c,266 :: 		void erase_pxl_command( void )
;matrixrgb_firmware.c,268 :: 		receive_data( &firm_buffer, 2 );
LDK.L	R1, #2
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,269 :: 		erase_pixel( firm_buffer[0], firm_buffer[1] );
LDA.B	R1, _firm_buffer+1
LDA.B	R0, _firm_buffer+0
CALL	_erase_pixel+0
;matrixrgb_firmware.c,270 :: 		}
L_end_erase_pxl_command:
RETURN	
; end of _erase_pxl_command
_scroll_text_left_command:
;matrixrgb_firmware.c,272 :: 		void scroll_text_left_command( void )
LINK	LR, #260
;matrixrgb_firmware.c,274 :: 		uint8_t text[256] = { 0 };
ADD.L	R27, SP, #3
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_left_command_text_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,275 :: 		char *ptr = text;
ADD.L	R6, SP, #3
; ptr start address is: 24 (R6)
;matrixrgb_firmware.c,276 :: 		uint8_t i = 0;
;matrixrgb_firmware.c,277 :: 		uint8_t size = 0;
;matrixrgb_firmware.c,279 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,281 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,282 :: 		size = firm_buffer[0];
; size start address is: 16 (R4)
LDA.B	R4, _firm_buffer+0
;matrixrgb_firmware.c,283 :: 		receive_data( &firm_buffer, 3 );
LDK.L	R1, #3
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,284 :: 		my_color.red   = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	SP, #0, R0
;matrixrgb_firmware.c,285 :: 		my_color.green = firm_buffer[1];
LDA.B	R0, _firm_buffer+1
STI.B	SP, #1, R0
;matrixrgb_firmware.c,286 :: 		my_color.blue  = firm_buffer[2];
LDA.B	R0, _firm_buffer+2
STI.B	SP, #2, R0
;matrixrgb_firmware.c,287 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,288 :: 		speed = firm_buffer[0];
; speed start address is: 12 (R3)
LDA.B	R3, _firm_buffer+0
;matrixrgb_firmware.c,290 :: 		for( i = 0; i < size; i++ )
; i start address is: 20 (R5)
LDK.L	R5, #0
; speed end address is: 12 (R3)
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
L_scroll_text_left_command33:
; i start address is: 20 (R5)
; speed start address is: 12 (R3)
; size start address is: 16 (R4)
; ptr start address is: 24 (R6)
CMP.B	R5, R4
JMPC	R30, C, #0, L_scroll_text_left_command34
;matrixrgb_firmware.c,292 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,293 :: 		*ptr++ = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	R6, #0, R0
ADD.L	R6, R6, #1
;matrixrgb_firmware.c,290 :: 		for( i = 0; i < size; i++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,294 :: 		}
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
JMP	L_scroll_text_left_command33
L_scroll_text_left_command34:
;matrixrgb_firmware.c,296 :: 		scroll_text_left( text, my_color, speed );
ADD.L	R0, SP, #3
BEXTU.L	R1, R3, #256
; speed end address is: 12 (R3)
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_scroll_text_left+0
ADD.L	SP, SP, #4
;matrixrgb_firmware.c,297 :: 		}
L_end_scroll_text_left_command:
UNLINK	LR
RETURN	
; end of _scroll_text_left_command
_scroll_text_right_command:
;matrixrgb_firmware.c,300 :: 		void scroll_text_right_command( void )
LINK	LR, #260
;matrixrgb_firmware.c,303 :: 		char text[256] = { 0 };
ADD.L	R27, SP, #3
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_right_command_text_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,304 :: 		char *ptr = text;
ADD.L	R6, SP, #3
; ptr start address is: 24 (R6)
;matrixrgb_firmware.c,305 :: 		uint8_t i = 0;
;matrixrgb_firmware.c,306 :: 		uint8_t size = 0;
;matrixrgb_firmware.c,308 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,310 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,311 :: 		size = firm_buffer[0];
; size start address is: 16 (R4)
LDA.B	R4, _firm_buffer+0
;matrixrgb_firmware.c,312 :: 		receive_data( &firm_buffer, 3 );
LDK.L	R1, #3
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,313 :: 		my_color.red   = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	SP, #0, R0
;matrixrgb_firmware.c,314 :: 		my_color.green = firm_buffer[1];
LDA.B	R0, _firm_buffer+1
STI.B	SP, #1, R0
;matrixrgb_firmware.c,315 :: 		my_color.blue  = firm_buffer[2];
LDA.B	R0, _firm_buffer+2
STI.B	SP, #2, R0
;matrixrgb_firmware.c,316 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,317 :: 		speed = firm_buffer[0];
; speed start address is: 12 (R3)
LDA.B	R3, _firm_buffer+0
;matrixrgb_firmware.c,320 :: 		for( i = 0; i < size; i++ )
; i start address is: 20 (R5)
LDK.L	R5, #0
; speed end address is: 12 (R3)
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
L_scroll_text_right_command36:
; i start address is: 20 (R5)
; speed start address is: 12 (R3)
; size start address is: 16 (R4)
; ptr start address is: 24 (R6)
CMP.B	R5, R4
JMPC	R30, C, #0, L_scroll_text_right_command37
;matrixrgb_firmware.c,322 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,323 :: 		*ptr++ = firm_buffer[0];
LDA.B	R0, _firm_buffer+0
STI.B	R6, #0, R0
ADD.L	R6, R6, #1
;matrixrgb_firmware.c,320 :: 		for( i = 0; i < size; i++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,324 :: 		}
; size end address is: 16 (R4)
; ptr end address is: 24 (R6)
; i end address is: 20 (R5)
JMP	L_scroll_text_right_command36
L_scroll_text_right_command37:
;matrixrgb_firmware.c,326 :: 		scroll_text_right( text, my_color, speed );
ADD.L	R0, SP, #3
BEXTU.L	R1, R3, #256
; speed end address is: 12 (R3)
SUB.L	SP, SP, #4
ADD.L	R30, SP, #4
MEMCPY.B	SP, R30, #4
CALL	_scroll_text_right+0
ADD.L	SP, SP, #4
;matrixrgb_firmware.c,328 :: 		}
L_end_scroll_text_right_command:
UNLINK	LR
RETURN	
; end of _scroll_text_right_command
_display_shift_up_command:
;matrixrgb_firmware.c,331 :: 		void display_shift_up_command( void )
;matrixrgb_firmware.c,333 :: 		display_shift_up();
CALL	_display_shift_up+0
;matrixrgb_firmware.c,334 :: 		}
L_end_display_shift_up_command:
RETURN	
; end of _display_shift_up_command
_display_shift_down_command:
;matrixrgb_firmware.c,337 :: 		void display_shift_down_command( void )
;matrixrgb_firmware.c,339 :: 		display_shift_down();
CALL	_display_shift_down+0
;matrixrgb_firmware.c,340 :: 		}
L_end_display_shift_down_command:
RETURN	
; end of _display_shift_down_command
_display_shift_right_command:
;matrixrgb_firmware.c,343 :: 		void display_shift_right_command( void )
;matrixrgb_firmware.c,345 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,346 :: 		}
L_end_display_shift_right_command:
RETURN	
; end of _display_shift_right_command
_display_shift_left_command:
;matrixrgb_firmware.c,349 :: 		void display_shift_left_command( void )
;matrixrgb_firmware.c,351 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,352 :: 		}
L_end_display_shift_left_command:
RETURN	
; end of _display_shift_left_command
_display_scroll_off_scrn_up_command:
;matrixrgb_firmware.c,355 :: 		void display_scroll_off_scrn_up_command( void )
;matrixrgb_firmware.c,357 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,359 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,361 :: 		scroll_off_screen_up( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_up+0
;matrixrgb_firmware.c,362 :: 		}
L_end_display_scroll_off_scrn_up_command:
RETURN	
; end of _display_scroll_off_scrn_up_command
_display_scroll_off_scrn_down_command:
;matrixrgb_firmware.c,365 :: 		void display_scroll_off_scrn_down_command( void )
;matrixrgb_firmware.c,367 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,369 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,371 :: 		scroll_off_screen_down( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_down+0
;matrixrgb_firmware.c,372 :: 		}
L_end_display_scroll_off_scrn_down_command:
RETURN	
; end of _display_scroll_off_scrn_down_command
_display_scroll_off_scrn_left_command:
;matrixrgb_firmware.c,375 :: 		void display_scroll_off_scrn_left_command( void )
;matrixrgb_firmware.c,377 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,379 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,381 :: 		scroll_off_screen_left( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_left+0
;matrixrgb_firmware.c,382 :: 		}
L_end_display_scroll_off_scrn_left_command:
RETURN	
; end of _display_scroll_off_scrn_left_command
_display_scroll_off_scrn_right_command:
;matrixrgb_firmware.c,385 :: 		void display_scroll_off_scrn_right_command( void )
;matrixrgb_firmware.c,387 :: 		uint8_t speed = 0;
;matrixrgb_firmware.c,389 :: 		receive_data( &firm_buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_firm_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware.c,391 :: 		scroll_off_screen_right( speed );
LDA.B	R0, _firm_buffer+0
CALL	_scroll_off_screen_right+0
;matrixrgb_firmware.c,392 :: 		}
L_end_display_scroll_off_scrn_right_command:
RETURN	
; end of _display_scroll_off_scrn_right_command
_refresh_command:
;matrixrgb_firmware.c,394 :: 		void refresh_command( void )
;matrixrgb_firmware.c,396 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,397 :: 		}
L_end_refresh_command:
RETURN	
; end of _refresh_command
_clear_screen_command:
;matrixrgb_firmware.c,399 :: 		void clear_screen_command( void )
;matrixrgb_firmware.c,401 :: 		clear_frame_buffer();
CALL	_clear_frame_buffer+0
;matrixrgb_firmware.c,402 :: 		}
L_end_clear_screen_command:
RETURN	
; end of _clear_screen_command
_allocate_image:
;matrixrgb_firmware.c,404 :: 		void allocate_image( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 0 (R0)
; height start address is: 4 (R1)
;matrixrgb_firmware.c,406 :: 		uint16_t size = width * height;
MUL.L	R2, R0, R1
; width end address is: 0 (R0)
; height end address is: 4 (R1)
; size start address is: 36 (R9)
BEXTU.L	R9, R2, #0
;matrixrgb_firmware.c,407 :: 		uint16_t i = 0;
;matrixrgb_firmware.c,409 :: 		img = Malloc( sizeof( uint8_t ) * size );
BEXTU.L	R0, R9, #0
CALL	_Malloc+0
STA.L	matrixrgb_firmware_img+0, R0
;matrixrgb_firmware.c,410 :: 		for( i = 0; i < size; i++ )
; i start address is: 0 (R0)
LDK.L	R0, #0
; size end address is: 36 (R9)
; i end address is: 0 (R0)
BEXTU.L	R1, R9, #0
L_allocate_image39:
; i start address is: 0 (R0)
; size start address is: 4 (R1)
CMP.S	R0, R1
JMPC	R30, C, #0, L_allocate_image40
;matrixrgb_firmware.c,411 :: 		img[i] = 0x00;
LDA.L	R2, matrixrgb_firmware_img+0
ADD.L	R3, R2, R0
LDK.L	R2, #0
STI.B	R3, #0, R2
;matrixrgb_firmware.c,410 :: 		for( i = 0; i < size; i++ )
ADD.L	R0, R0, #1
BEXTU.L	R0, R0, #0
;matrixrgb_firmware.c,411 :: 		img[i] = 0x00;
; size end address is: 4 (R1)
; i end address is: 0 (R0)
JMP	L_allocate_image39
L_allocate_image40:
;matrixrgb_firmware.c,413 :: 		}
L_end_allocate_image:
RETURN	
; end of _allocate_image
_receive_data:
;matrixrgb_firmware.c,415 :: 		void receive_data(uint8_t* dataPtr, uint16_t dataSize)
; dataSize start address is: 4 (R1)
; dataPtr start address is: 0 (R0)
LINK	LR, #4
; dataSize end address is: 4 (R1)
; dataPtr end address is: 0 (R0)
; dataPtr start address is: 0 (R0)
; dataSize start address is: 4 (R1)
;matrixrgb_firmware.c,418 :: 		SetReady();
LDA.x	R2, #AlignedAddress(GPIO_PIN17_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN17_bit+0)=1
STI.x	GPIO_PIN17_bit+0, #AlignedAddress(R2)
; dataPtr end address is: 0 (R0)
; dataSize end address is: 4 (R1)
STI.S	SP, #0, R1
MOVE.L	R1, R0
LDI.S	R0, SP, #0
;matrixrgb_firmware.c,420 :: 		while(SPIS1_RX_FIFO_COUNT < dataSize) ;
L_receive_data42:
; dataSize start address is: 0 (R0)
; dataPtr start address is: 4 (R1)
LDA.L	R2, SPIS1_RX_FIFO_COUNT+0
CMP.L	R2, R0
JMPC	R30, C, #0, L_receive_data43
JMP	L_receive_data42
L_receive_data43:
;matrixrgb_firmware.c,422 :: 		STREAMIN_B(dataPtr, &SPIS1_DATA, dataSize);
MOVE.L	R26, R1
; dataPtr end address is: 4 (R1)
LDK.L	R27, #SPIS1_DATA+0
MOVE.L	R28, R0
; dataSize end address is: 0 (R0)
STREAMIN.B	R26, R27, R28
;matrixrgb_firmware.c,424 :: 		SetNotReady();
LDA.x	R2, #AlignedAddress(GPIO_PIN17_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN17_bit+0)=0
STI.x	GPIO_PIN17_bit+0, #AlignedAddress(R2)
;matrixrgb_firmware.c,427 :: 		}
L_end_receive_data:
UNLINK	LR
RETURN	
; end of _receive_data
_spi_bus_init:
;matrixrgb_firmware.c,429 :: 		void spi_bus_init()
LINK	LR, #8
;matrixrgb_firmware.c,437 :: 		};
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
;matrixrgb_firmware.c,441 :: 		};
;matrixrgb_firmware.c,446 :: 		for( i = 0; i < sizeof( output_pins ); i++ )
; i start address is: 32 (R8)
LDK.L	R8, #0
; i end address is: 32 (R8)
L_spi_bus_init44:
; i start address is: 32 (R8)
CMP.S	R8, #3
JMPC	R30, GTE, #1, L_spi_bus_init45
;matrixrgb_firmware.c,448 :: 		GPIO_Pin_Config( output_pins[i],
ADD.L	R0, SP, #4
ADD.L	R0, R0, R8
LDI.B	R0, R0, #0
;matrixrgb_firmware.c,454 :: 		_GPIO_CFG_SPEC_NONE );
LDK.L	R2, #3414053
LDL.L	R2, R2, #3414053
;matrixrgb_firmware.c,449 :: 		_GPIO_DIR_OUTPUT,
LDK.L	R1, #4
;matrixrgb_firmware.c,448 :: 		GPIO_Pin_Config( output_pins[i],
;matrixrgb_firmware.c,454 :: 		_GPIO_CFG_SPEC_NONE );
CALL	_GPIO_Pin_Config+0
;matrixrgb_firmware.c,446 :: 		for( i = 0; i < sizeof( output_pins ); i++ )
ADD.L	R8, R8, #1
BEXTS.L	R8, R8, #0
;matrixrgb_firmware.c,455 :: 		}
; i end address is: 32 (R8)
JMP	L_spi_bus_init44
L_spi_bus_init45:
;matrixrgb_firmware.c,457 :: 		PWR_EnableModule( _PWR_CLK_SPIS0 );
LDK.L	R0, #64
CALL	_PWR_EnableModule+0
;matrixrgb_firmware.c,459 :: 		for( i = 0; i < sizeof( slave_pins ); i++ )
; i start address is: 32 (R8)
LDK.L	R8, #0
; i end address is: 32 (R8)
L_spi_bus_init47:
; i start address is: 32 (R8)
CMP.S	R8, #4
JMPC	R30, GTE, #1, L_spi_bus_init48
;matrixrgb_firmware.c,462 :: 		( i == _GPIO_PIN_NUM_39 ) ? _GPIO_DIR_OUTPUT :_GPIO_DIR_INPUT,
CMP.S	R8, #39
JMPC	R30, Z, #0, L_spi_bus_init50
; ?FLOC___spi_bus_init?T213 start address is: 4 (R1)
LDK.L	R1, #4
; ?FLOC___spi_bus_init?T213 end address is: 4 (R1)
JMP	L_spi_bus_init51
L_spi_bus_init50:
; ?FLOC___spi_bus_init?T213 start address is: 4 (R1)
LDK.L	R1, #0
; ?FLOC___spi_bus_init?T213 end address is: 4 (R1)
L_spi_bus_init51:
;matrixrgb_firmware.c,461 :: 		GPIO_Pin_Config( slave_pins[i],
; ?FLOC___spi_bus_init?T213 start address is: 4 (R1)
ADD.L	R0, SP, #0
ADD.L	R0, R0, R8
LDI.B	R0, R0, #0
;matrixrgb_firmware.c,467 :: 		_GPIO_CFG_SPEC_FUNC_1 );
LDK.L	R2, #7350293
LDL.L	R2, R2, #7350293
;matrixrgb_firmware.c,462 :: 		( i == _GPIO_PIN_NUM_39 ) ? _GPIO_DIR_OUTPUT :_GPIO_DIR_INPUT,
; ?FLOC___spi_bus_init?T213 end address is: 4 (R1)
;matrixrgb_firmware.c,461 :: 		GPIO_Pin_Config( slave_pins[i],
;matrixrgb_firmware.c,467 :: 		_GPIO_CFG_SPEC_FUNC_1 );
CALL	_GPIO_Pin_Config+0
;matrixrgb_firmware.c,459 :: 		for( i = 0; i < sizeof( slave_pins ); i++ )
ADD.L	R8, R8, #1
BEXTS.L	R8, R8, #0
;matrixrgb_firmware.c,468 :: 		}
; i end address is: 32 (R8)
JMP	L_spi_bus_init47
L_spi_bus_init48:
;matrixrgb_firmware.c,469 :: 		GPIO_Pin_Digital_Input( _GPIO_PIN_NUM_37 );
LDK.L	R0, #37
CALL	_GPIO_Pin_Digital_Input+0
;matrixrgb_firmware.c,476 :: 		( 1 << SP_R2 );
LDK.L	R0, #227
STA.L	SPIS1_CNTL+0, R0
;matrixrgb_firmware.c,478 :: 		SPIS1_CNTL &= ~( 1 << CLK_POL );
LDA.L	R0, SPIS1_CNTL+0
AND.L	R0, R0, #-9
STA.L	SPIS1_CNTL+0, R0
;matrixrgb_firmware.c,484 :: 		( 1 << FIFO_EN );      // FIFO Enable
LDK.L	R0, #39
STA.L	SPIS1_FIFO_CNTL+0, R0
;matrixrgb_firmware.c,488 :: 		SPIS1_TNSFR_FRMT_CNTL |= ( 1 << MULTI_REC );    // Allow continuous reception of data
LDA.L	R0, SPIS1_TNSFR_FRMT_CNTL+0
OR.L	R0, R0, #32
STA.L	SPIS1_TNSFR_FRMT_CNTL+0, R0
;matrixrgb_firmware.c,491 :: 		}
L_end_spi_bus_init:
UNLINK	LR
RETURN	
; end of _spi_bus_init
_system_setup:
;matrixrgb_firmware.c,493 :: 		void system_setup( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
BEXTU.L	R12, R0, #256
BEXTU.L	R13, R1, #256
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 48 (R12)
; height start address is: 52 (R13)
;matrixrgb_firmware.c,496 :: 		uint8_t currRow = 0;
;matrixrgb_firmware.c,499 :: 		GPIO_Digital_Output(&GPIO_PORT_08_15, _GPIO_PINMASK_ALL);
LDK.L	R1, #255
LDK.L	R0, #GPIO_PORT_08_15+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,501 :: 		_GPIO_PINMASK_2 | _GPIO_PINMASK_3 );
LDK.L	R1, #15
LDK.L	R0, #GPIO_PORT_32_39+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,502 :: 		GPIO_Digital_Output(&GPIO_PORT_40_47, _GPIO_PINMASK_4 | _GPIO_PINMASK_5 );
LDK.L	R1, #48
LDK.L	R0, #GPIO_PORT_40_47+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,504 :: 		GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );         // OE Pin
LDK.L	R1, #16
LDK.L	R0, #GPIO_PORT_48_55+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,507 :: 		Led_Matrix_Data = 0; asm nop;
LDK.L	R2, #0
STA.B	GPIO_PORT_08_15+0, R2
NOP	
;matrixrgb_firmware.c,508 :: 		Led_Matrix_A = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN32_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN32_bit+0)=0
STI.x	GPIO_PIN32_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,509 :: 		Led_Matrix_B = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN33_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN33_bit+0)=0
STI.x	GPIO_PIN33_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,510 :: 		Led_Matrix_C = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN34_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN34_bit+0)=0
STI.x	GPIO_PIN34_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,511 :: 		Led_Matrix_D = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN35_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN35_bit+0)=0
STI.x	GPIO_PIN35_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,512 :: 		Led_Matrix_CLK = 0; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN45_bit+0)=0
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,513 :: 		Led_Matrix_STB = 1; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN44_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN44_bit+0)=1
STI.x	GPIO_PIN44_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,514 :: 		Led_Matrix_OE  = 1; asm nop;
LDA.x	R2, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R2, R2, #BitPos(GPIO_PIN52_bit+0)=1
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R2)
NOP	
;matrixrgb_firmware.c,515 :: 		Delay_ms(100);
LPM.L	R28, #3333331
NOP	
L_system_setup52:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_system_setup52
JMP	$+8
	#3333331
NOP	
NOP	
;matrixrgb_firmware.c,521 :: 		init_parameters( width, height );
BEXTU.L	R1, R13, #256
; height end address is: 52 (R13)
BEXTU.L	R0, R12, #256
; width end address is: 48 (R12)
CALL	_init_parameters+0
;matrixrgb_firmware.c,524 :: 		create_frame_buffer();
CALL	_create_frame_buffer+0
;matrixrgb_firmware.c,529 :: 		}
L_end_system_setup:
RETURN	
; end of _system_setup
_set_brightness:
;matrixrgb_firmware.c,531 :: 		void set_brightness( char brightness )
; brightness start address is: 0 (R0)
LINK	LR, #4
BEXTU.L	R4, R0, #256
; brightness end address is: 0 (R0)
; brightness start address is: 16 (R4)
;matrixrgb_firmware.c,537 :: 		pwm_period = PWM_Init(_LED_GLOBAL_DIMMER_FREQ);
LDK.L	R0, #200000
CALL	_PWM_Init+0
; pwm_period start address is: 0 (R0)
;matrixrgb_firmware.c,538 :: 		tmpPwmInitState = _PWM_INIT_STATE_0;
; tmpPwmInitState start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,540 :: 		if(brightness == 0)
CMP.B	R4, #0
JMPC	R30, Z, #0, L_set_brightness54
; brightness end address is: 16 (R4)
; pwm_period end address is: 0 (R0)
; tmpPwmInitState end address is: 8 (R2)
;matrixrgb_firmware.c,542 :: 		tmpPwmInitState = _PWM_INIT_STATE_1;
; tmpPwmInitState start address is: 4 (R1)
LDK.L	R1, #1
;matrixrgb_firmware.c,543 :: 		PWM_DisableOutput();
CALL	_PWM_DisableOutput+0
;matrixrgb_firmware.c,544 :: 		}
BEXTU.L	R0, R1, #256
; tmpPwmInitState end address is: 4 (R1)
JMP	L_set_brightness55
L_set_brightness54:
;matrixrgb_firmware.c,545 :: 		else if(brightness == 100)
; tmpPwmInitState start address is: 8 (R2)
; pwm_period start address is: 0 (R0)
; brightness start address is: 16 (R4)
CMP.B	R4, #100
JMPC	R30, Z, #0, L_set_brightness56
; brightness end address is: 16 (R4)
; pwm_period end address is: 0 (R0)
;matrixrgb_firmware.c,547 :: 		PWM_DisableOutput();
CALL	_PWM_DisableOutput+0
;matrixrgb_firmware.c,548 :: 		}
JMP	L_set_brightness57
L_set_brightness56:
;matrixrgb_firmware.c,551 :: 		current_duty  = ((unsigned long)pwm_period * brightness) / 100;              // initial value for current_duty
; pwm_period start address is: 0 (R0)
; brightness start address is: 16 (R4)
BEXTU.L	R1, R0, #0
; pwm_period end address is: 0 (R0)
MUL.L	R1, R1, R4
; brightness end address is: 16 (R4)
UDIV.L	R1, R1, #100
STI.S	SP, #0, R1
;matrixrgb_firmware.c,552 :: 		PWM_EnableOutput();
CALL	_PWM_EnableOutput+0
;matrixrgb_firmware.c,553 :: 		}
L_set_brightness57:
BEXTU.L	R0, R2, #256
; tmpPwmInitState end address is: 8 (R2)
L_set_brightness55:
;matrixrgb_firmware.c,554 :: 		PWM_ConfigChannel(current_duty, tmpPwmInitState, _PWM_CHANNEL_4);                // PWM output on P52 pin
; tmpPwmInitState start address is: 0 (R0)
LDK.L	R2, #4
BEXTU.L	R1, R0, #256
; tmpPwmInitState end address is: 0 (R0)
LDI.S	R0, SP, #0
CALL	_PWM_ConfigChannel+0
;matrixrgb_firmware.c,556 :: 		GPIO_Digital_Output(&GPIO_PORT_48_55, _GPIO_PINMASK_4 );
LDK.L	R1, #16
LDK.L	R0, #GPIO_PORT_48_55+0
CALL	_GPIO_Digital_Output+0
;matrixrgb_firmware.c,557 :: 		}
L_end_set_brightness:
UNLINK	LR
RETURN	
; end of _set_brightness
_init_parameters:
;matrixrgb_firmware.c,559 :: 		void init_parameters( uint8_t width, uint8_t height )
; height start address is: 4 (R1)
; width start address is: 0 (R0)
; height end address is: 4 (R1)
; width end address is: 0 (R0)
; width start address is: 0 (R0)
; height start address is: 4 (R1)
;matrixrgb_firmware.c,561 :: 		pan_width  = width;
STA.B	_pan_width+0, R0
;matrixrgb_firmware.c,562 :: 		pan_height = height;
STA.B	_pan_height+0, R1
;matrixrgb_firmware.c,563 :: 		p_height = height * 16;
BEXTU.L	R2, R1, #256
ASHL.L	R2, R2, #4
STA.B	_p_height+0, R2
;matrixrgb_firmware.c,564 :: 		p_width  = width * 32;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #5
STA.B	_p_width+0, R2
;matrixrgb_firmware.c,565 :: 		shift_reg = 32 * ( width * height );
MUL.L	R2, R0, R1
BEXTS.L	R2, R2, #0
; width end address is: 0 (R0)
; height end address is: 4 (R1)
ASHL.L	R2, R2, #5
BEXTS.L	R2, R2, #0
STA.L	_shift_reg+0, R2
;matrixrgb_firmware.c,567 :: 		}
L_end_init_parameters:
RETURN	
; end of _init_parameters
_create_frame_buffer:
;matrixrgb_firmware.c,569 :: 		void create_frame_buffer( void )
;matrixrgb_firmware.c,571 :: 		uint16_t size = p_width * p_height;
LDA.B	R1, _p_height+0
LDA.B	R0, _p_width+0
MUL.L	R0, R0, R1
; size start address is: 36 (R9)
BEXTU.L	R9, R0, #0
;matrixrgb_firmware.c,573 :: 		MM_Init();
CALL	_MM_Init+0
;matrixrgb_firmware.c,574 :: 		FB = Malloc( sizeof( uint8_t ) * size );
BEXTU.L	R0, R9, #0
CALL	_Malloc+0
STA.L	_FB+0, R0
;matrixrgb_firmware.c,575 :: 		memset( FB, 0, size );
BEXTS.L	R2, R9, #0
; size end address is: 36 (R9)
LDK.L	R1, #0
CALL	_memset+0
;matrixrgb_firmware.c,576 :: 		}
L_end_create_frame_buffer:
RETURN	
; end of _create_frame_buffer
_refresh:
;matrixrgb_firmware.c,578 :: 		void refresh( void )
;matrixrgb_firmware.c,583 :: 		reset_row();
CALL	_reset_row+0
;matrixrgb_firmware.c,585 :: 		for( i = 0, j = 8; i < 8; i++, j++ )
; i start address is: 28 (R7)
LDK.L	R7, #0
; j start address is: 24 (R6)
LDK.L	R6, #8
; i end address is: 28 (R7)
; j end address is: 24 (R6)
L_refresh58:
; j start address is: 24 (R6)
; i start address is: 28 (R7)
CMP.B	R7, #8
JMPC	R30, C, #0, L_refresh59
;matrixrgb_firmware.c,588 :: 		Latch_Off();
LDA.x	R0, #AlignedAddress(GPIO_PIN44_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN44_bit+0)=0
STI.x	GPIO_PIN44_bit+0, #AlignedAddress(R0)
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,589 :: 		for( p = 0; p < shift_reg; p++ )
; p start address is: 32 (R8)
LDK.L	R8, #0
; p end address is: 32 (R8)
; i end address is: 28 (R7)
; j end address is: 24 (R6)
L_refresh61:
; p start address is: 32 (R8)
; i start address is: 28 (R7)
; j start address is: 24 (R6)
LDA.L	R0, _shift_reg+0
CMP.L	R8, R0
JMPC	R30, C, #0, L_refresh62
;matrixrgb_firmware.c,591 :: 		Led_Matrix_Data = 0;
LDK.L	R0, #0
STA.B	GPIO_PORT_08_15+0, R0
;matrixrgb_firmware.c,592 :: 		Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 4 ) << 1;
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
;matrixrgb_firmware.c,593 :: 		Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 2 ) << 3;
LDI.B	R0, R3, #0
AND.L	R0, R0, #2
BEXTU.L	R0, R0, #256
ASHL.L	R1, R0, #3
BEXTU.L	R1, R1, #0
BEXTU.L	R0, R2, #256
OR.L	R2, R0, R1
STA.B	GPIO_PORT_08_15+0, R2
;matrixrgb_firmware.c,594 :: 		Led_Matrix_Data |= ( FB[( shift_reg * j ) + p] & 1 ) << 5;
LDI.B	R0, R3, #0
AND.L	R0, R0, #1
BEXTU.L	R0, R0, #256
ASHL.L	R1, R0, #5
BEXTU.L	R1, R1, #0
BEXTU.L	R0, R2, #256
OR.L	R3, R0, R1
STA.B	GPIO_PORT_08_15+0, R3
;matrixrgb_firmware.c,595 :: 		Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 4 ) >> 2;
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
;matrixrgb_firmware.c,596 :: 		Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 2 );
LDI.B	R0, R2, #0
AND.L	R0, R0, #2
BEXTU.L	R0, R0, #256
OR.L	R1, R1, R0
BEXTU.L	R1, R1, #256
STA.B	GPIO_PORT_08_15+0, R1
;matrixrgb_firmware.c,597 :: 		Led_Matrix_Data |= ( FB[( shift_reg * i ) + p] & 1 ) << 2;
LDI.B	R0, R2, #0
AND.L	R0, R0, #1
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #2
BEXTU.L	R0, R0, #0
OR.L	R0, R1, R0
STA.B	GPIO_PORT_08_15+0, R0
;matrixrgb_firmware.c,598 :: 		Clk_Toggle();
LDA.x	R0, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN45_bit+0)=0
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R0)
LPM.L	R28, #31
NOP	
L_refresh64:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_refresh64
JMP	$+8
	#31
NOP	
NOP	
LDA.x	R0, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN45_bit+0)=1
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R0)
LPM.L	R28, #31
NOP	
L_refresh66:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_refresh66
JMP	$+8
	#31
NOP	
NOP	
LDA.x	R0, #AlignedAddress(GPIO_PIN45_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN45_bit+0)=0
STI.x	GPIO_PIN45_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,589 :: 		for( p = 0; p < shift_reg; p++ )
ADD.L	R8, R8, #1
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,599 :: 		}
; p end address is: 32 (R8)
JMP	L_refresh61
L_refresh62:
;matrixrgb_firmware.c,600 :: 		Latch_On();
LPM.L	R28, #31
NOP	
L_refresh68:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_refresh68
JMP	$+8
	#31
NOP	
NOP	
LDA.x	R0, #AlignedAddress(GPIO_PIN44_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN44_bit+0)=1
STI.x	GPIO_PIN44_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,602 :: 		inc_row();
CALL	_inc_row+0
;matrixrgb_firmware.c,585 :: 		for( i = 0, j = 8; i < 8; i++, j++ )
ADD.L	R7, R7, #1
BEXTU.L	R7, R7, #256
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,604 :: 		}
; i end address is: 28 (R7)
; j end address is: 24 (R6)
JMP	L_refresh58
L_refresh59:
;matrixrgb_firmware.c,606 :: 		}
L_end_refresh:
RETURN	
; end of _refresh
_inc_row:
;matrixrgb_firmware.c,608 :: 		void inc_row( void )
;matrixrgb_firmware.c,611 :: 		if(currRow == 7)
LDA.B	R0, _currRow+0
CMP.B	R0, #7
JMPC	R30, Z, #0, L_inc_row70
;matrixrgb_firmware.c,612 :: 		currRow = -1;
LDK.L	R0, #255
STA.B	_currRow+0, R0
JMP	L_inc_row71
L_inc_row70:
;matrixrgb_firmware.c,614 :: 		currRow++;
LDA.B	R0, _currRow+0
ADD.L	R0, R0, #1
STA.B	_currRow+0, R0
L_inc_row71:
;matrixrgb_firmware.c,616 :: 		Led_Matrix_OE = 1;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=1
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,617 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,618 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,619 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,620 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,621 :: 		Led_Matrix_A = currRow;
LDA.B	R2, _currRow+0
LDA.x	R0, #AlignedAddress(GPIO_PIN32_bit+0)
LDL.L	R30, R2, #BitPos(GPIO_PIN32_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN32_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,622 :: 		Led_Matrix_B = currRow >> 1;
LSHR.L	R1, R2, #1
LDA.x	R0, #AlignedAddress(GPIO_PIN33_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN33_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN33_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,623 :: 		Led_Matrix_C = currRow >> 2;
LSHR.L	R1, R2, #2
LDA.x	R0, #AlignedAddress(GPIO_PIN34_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN34_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN34_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,624 :: 		Led_Matrix_D = currRow >> 3;
LSHR.L	R1, R2, #3
LDA.x	R0, #AlignedAddress(GPIO_PIN35_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN35_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN35_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,625 :: 		Led_Matrix_OE = 0;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=0
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,627 :: 		}
L_end_inc_row:
RETURN	
; end of _inc_row
_reset_row:
;matrixrgb_firmware.c,629 :: 		void reset_row( void )
;matrixrgb_firmware.c,631 :: 		currRow = -1;
LDK.L	R0, #255
STA.B	_currRow+0, R0
;matrixrgb_firmware.c,633 :: 		Led_Matrix_OE = 1;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=1
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,634 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,635 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,636 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,637 :: 		asm nop; asm nop; asm nop;
NOP	
NOP	
NOP	
;matrixrgb_firmware.c,638 :: 		Led_Matrix_A = currRow;
LDA.B	R2, _currRow+0
LDA.x	R0, #AlignedAddress(GPIO_PIN32_bit+0)
LDL.L	R30, R2, #BitPos(GPIO_PIN32_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN32_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,639 :: 		Led_Matrix_B = currRow >> 1;
LSHR.L	R1, R2, #1
LDA.x	R0, #AlignedAddress(GPIO_PIN33_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN33_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN33_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,640 :: 		Led_Matrix_C = currRow >> 2;
LSHR.L	R1, R2, #2
LDA.x	R0, #AlignedAddress(GPIO_PIN34_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN34_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN34_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,641 :: 		Led_Matrix_D = currRow >> 3;
LSHR.L	R1, R2, #3
LDA.x	R0, #AlignedAddress(GPIO_PIN35_bit+0)
LDL.L	R30, R1, #BitPos(GPIO_PIN35_bit+0)
BINS.L	R0, R0, R30
STI.x	GPIO_PIN35_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,642 :: 		Led_Matrix_OE = 0;
LDA.x	R0, #AlignedAddress(GPIO_PIN52_bit+0)
BINS.L	R0, R0, #BitPos(GPIO_PIN52_bit+0)=0
STI.x	GPIO_PIN52_bit+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,644 :: 		}
L_end_reset_row:
RETURN	
; end of _reset_row
_clear_frame_buffer:
;matrixrgb_firmware.c,646 :: 		void clear_frame_buffer( void )
;matrixrgb_firmware.c,649 :: 		uint8_t *ptr = FB;
; ptr start address is: 12 (R3)
LDA.L	R3, _FB+0
;matrixrgb_firmware.c,650 :: 		uint8_t zero = 0x00;
; zero start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,652 :: 		for( i = 0; i < ( p_width * p_height ); i++ )
; i start address is: 16 (R4)
LDK.L	R4, #0
; i end address is: 16 (R4)
L_clear_frame_buffer72:
; i start address is: 16 (R4)
; zero start address is: 8 (R2)
; zero end address is: 8 (R2)
; ptr start address is: 12 (R3)
; ptr end address is: 12 (R3)
LDA.B	R1, _p_height+0
LDA.B	R0, _p_width+0
MUL.L	R0, R0, R1
CMP.S	R4, R0
JMPC	R30, C, #0, L_clear_frame_buffer73
; zero end address is: 8 (R2)
; ptr end address is: 12 (R3)
;matrixrgb_firmware.c,653 :: 		ptr[i] = zero;
; ptr start address is: 12 (R3)
; zero start address is: 8 (R2)
ADD.L	R0, R3, R4
STI.B	R0, #0, R2
;matrixrgb_firmware.c,652 :: 		for( i = 0; i < ( p_width * p_height ); i++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #0
;matrixrgb_firmware.c,653 :: 		ptr[i] = zero;
; zero end address is: 8 (R2)
; ptr end address is: 12 (R3)
; i end address is: 16 (R4)
JMP	L_clear_frame_buffer72
L_clear_frame_buffer73:
;matrixrgb_firmware.c,654 :: 		}
L_end_clear_frame_buffer:
RETURN	
; end of _clear_frame_buffer
_write_text:
;matrixrgb_firmware.c,656 :: 		void write_text( uint8_t *text, color_t color, uint8_t start_row, uint8_t start_col )
; start_col start address is: 8 (R2)
; start_row start address is: 4 (R1)
; text start address is: 0 (R0)
LINK	LR, #256
BEXTU.L	R3, R1, #256
MOVE.L	R1, R0
; start_col end address is: 8 (R2)
; start_row end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 4 (R1)
; start_row start address is: 12 (R3)
; start_col start address is: 8 (R2)
;matrixrgb_firmware.c,658 :: 		char *ptr = text;
; ptr start address is: 0 (R0)
MOVE.L	R0, R1
; text end address is: 4 (R1)
;matrixrgb_firmware.c,659 :: 		uint8_t text_frame[256] = { 0 };
ADD.L	R27, SP, #0
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSwrite_text_text_frame_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,662 :: 		uint8_t cnt = 0;
;matrixrgb_firmware.c,664 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 20 (R5)
LDK.L	R5, #0
;matrixrgb_firmware.c,665 :: 		uint8_t curr_row = start_row;    //Current row and column are top left of letter
; curr_row start address is: 4 (R1)
BEXTU.L	R1, R3, #256
; start_row end address is: 12 (R3)
;matrixrgb_firmware.c,666 :: 		uint8_t curr_col = start_col;
; curr_col start address is: 16 (R4)
BEXTU.L	R4, R2, #256
;matrixrgb_firmware.c,668 :: 		if( ptr == NULL )           //Sanity check
CMP.L	R0, #0
JMPC	R30, Z, #0, L_write_text75
; start_col end address is: 8 (R2)
; ptr end address is: 0 (R0)
; curr_col end address is: 16 (R4)
; color_buffer end address is: 20 (R5)
; curr_row end address is: 4 (R1)
;matrixrgb_firmware.c,669 :: 		return;
JMP	L_end_write_text
L_write_text75:
;matrixrgb_firmware.c,671 :: 		if( color.red  > 0 )        //Create color for frame
; curr_row start address is: 4 (R1)
; color_buffer start address is: 20 (R5)
; curr_col start address is: 16 (R4)
; ptr start address is: 0 (R0)
; start_col start address is: 8 (R2)
ADD.L	R3, SP, #264
LDI.B	R3, R3, #0
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_text319
;matrixrgb_firmware.c,672 :: 		color_buffer |= 0x04;
OR.L	R5, R5, #4
BEXTU.L	R5, R5, #256
; color_buffer end address is: 20 (R5)
JMP	L_write_text76
L__write_text319:
;matrixrgb_firmware.c,671 :: 		if( color.red  > 0 )        //Create color for frame
;matrixrgb_firmware.c,672 :: 		color_buffer |= 0x04;
L_write_text76:
;matrixrgb_firmware.c,673 :: 		if( color.green > 0 )
; color_buffer start address is: 20 (R5)
ADD.L	R3, SP, #265
LDI.B	R3, R3, #0
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_text320
;matrixrgb_firmware.c,674 :: 		color_buffer |= 0x02;
OR.L	R5, R5, #2
BEXTU.L	R5, R5, #256
; color_buffer end address is: 20 (R5)
JMP	L_write_text77
L__write_text320:
;matrixrgb_firmware.c,673 :: 		if( color.green > 0 )
;matrixrgb_firmware.c,674 :: 		color_buffer |= 0x02;
L_write_text77:
;matrixrgb_firmware.c,675 :: 		if( color.blue > 0 )
; color_buffer start address is: 20 (R5)
ADD.L	R3, SP, #266
LDI.B	R3, R3, #0
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_text321
;matrixrgb_firmware.c,676 :: 		color_buffer |= 0x01;
OR.L	R3, R5, #1
BEXTU.L	R5, R3, #256
; color_buffer end address is: 20 (R5)
BEXTU.L	R16, R5, #256
JMP	L_write_text78
L__write_text321:
;matrixrgb_firmware.c,675 :: 		if( color.blue > 0 )
BEXTU.L	R16, R5, #256
;matrixrgb_firmware.c,676 :: 		color_buffer |= 0x01;
L_write_text78:
;matrixrgb_firmware.c,678 :: 		while( *ptr != NULL )
; color_buffer start address is: 64 (R16)
BEXTU.L	R15, R2, #256
; start_col end address is: 8 (R2)
; ptr end address is: 0 (R0)
; curr_col end address is: 16 (R4)
; color_buffer end address is: 64 (R16)
; curr_row end address is: 4 (R1)
MOVE.L	R17, R0
BEXTU.L	R8, R1, #256
BEXTU.L	R6, R4, #256
L_write_text79:
; color_buffer start address is: 64 (R16)
; curr_col start address is: 24 (R6)
; curr_row start address is: 32 (R8)
; ptr start address is: 68 (R17)
; start_col start address is: 60 (R15)
LDI.B	R3, R17, #0
CMP.B	R3, #0
JMPC	R30, Z, #1, L_write_text80
;matrixrgb_firmware.c,680 :: 		cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,681 :: 		for( k = 0; k < 16; k++ )
; k start address is: 44 (R11)
LDK.L	R11, #0
; cnt end address is: 0 (R0)
; start_col end address is: 60 (R15)
; curr_row end address is: 32 (R8)
; curr_col end address is: 24 (R6)
; color_buffer end address is: 64 (R16)
; k end address is: 44 (R11)
; ptr end address is: 68 (R17)
L_write_text81:
; k start address is: 44 (R11)
; cnt start address is: 0 (R0)
; start_col start address is: 60 (R15)
; ptr start address is: 68 (R17)
; curr_row start address is: 32 (R8)
; curr_col start address is: 24 (R6)
; color_buffer start address is: 64 (R16)
CMP.B	R11, #16
JMPC	R30, C, #0, L_write_text82
;matrixrgb_firmware.c,683 :: 		temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
LDI.B	R3, R17, #0
ASHL.L	R4, R3, #5
BEXTS.L	R4, R4, #0
LDK.L	R3, #1024
SUB.L	R3, R4, R3
BEXTS.L	R3, R3, #0
ADD.L	R5, R3, R0
BEXTS.L	R5, R5, #0
LDK.L	R4, #_Dejavu18_Bitmaps+0
ADD.L	R3, R4, R5
LPMI.B	R7, R3, #0
; temp start address is: 28 (R7)
;matrixrgb_firmware.c,684 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
ADD.L	R3, R5, #1
BEXTS.L	R3, R3, #0
ADD.L	R3, R4, R3
LPMI.B	R1, R3, #0
; temp_2 start address is: 4 (R1)
;matrixrgb_firmware.c,685 :: 		for( j = 0; j < 8; j++ )
; j start address is: 20 (R5)
LDK.L	R5, #0
; temp_2 end address is: 4 (R1)
; cnt end address is: 0 (R0)
; temp end address is: 28 (R7)
; j end address is: 20 (R5)
; start_col end address is: 60 (R15)
; curr_row end address is: 32 (R8)
; curr_col end address is: 24 (R6)
; color_buffer end address is: 64 (R16)
; k end address is: 44 (R11)
; ptr end address is: 68 (R17)
BEXTU.L	R10, R15, #256
MOVE.L	R9, R17
BEXTU.L	R2, R16, #256
L_write_text84:
; j start address is: 20 (R5)
; temp_2 start address is: 4 (R1)
; temp start address is: 28 (R7)
; color_buffer start address is: 8 (R2)
; curr_col start address is: 24 (R6)
; curr_row start address is: 32 (R8)
; ptr start address is: 36 (R9)
; start_col start address is: 40 (R10)
; cnt start address is: 0 (R0)
; k start address is: 44 (R11)
CMP.B	R5, #8
JMPC	R30, C, #0, L_write_text85
;matrixrgb_firmware.c,687 :: 		if( ( temp & 0x80 ) > 0x00 )
AND.L	R3, R7, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_write_text87
;matrixrgb_firmware.c,688 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R3, R11, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R3, R3, R4
STI.B	R3, #0, R2
JMP	L_write_text88
L_write_text87:
;matrixrgb_firmware.c,690 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R3, R11, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_write_text88:
;matrixrgb_firmware.c,691 :: 		temp = ( temp << 1 );
BEXTU.L	R3, R7, #256
; temp end address is: 28 (R7)
ASHL.L	R3, R3, #1
; temp start address is: 28 (R7)
BEXTU.L	R7, R3, #256
;matrixrgb_firmware.c,685 :: 		for( j = 0; j < 8; j++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,692 :: 		}
; temp end address is: 28 (R7)
; j end address is: 20 (R5)
JMP	L_write_text84
L_write_text85:
;matrixrgb_firmware.c,693 :: 		for( j = 8; j < 16; j++ )
; j start address is: 12 (R3)
LDK.L	R3, #8
; temp_2 end address is: 4 (R1)
; color_buffer end address is: 8 (R2)
; ptr end address is: 36 (R9)
; start_col end address is: 40 (R10)
; cnt end address is: 0 (R0)
; j end address is: 12 (R3)
; curr_row end address is: 32 (R8)
; curr_col end address is: 24 (R6)
; k end address is: 44 (R11)
BEXTU.L	R5, R1, #256
BEXTU.L	R1, R0, #256
BEXTU.L	R0, R11, #256
BEXTU.L	R16, R2, #256
BEXTU.L	R2, R3, #256
MOVE.L	R17, R9
BEXTU.L	R15, R10, #256
L_write_text89:
; j start address is: 8 (R2)
; k start address is: 0 (R0)
; cnt start address is: 4 (R1)
; start_col start address is: 60 (R15)
; ptr start address is: 68 (R17)
; curr_row start address is: 32 (R8)
; curr_col start address is: 24 (R6)
; color_buffer start address is: 64 (R16)
; temp_2 start address is: 20 (R5)
CMP.B	R2, #16
JMPC	R30, C, #0, L_write_text90
;matrixrgb_firmware.c,695 :: 		if( ( temp_2 & 0x80 ) > 0x00 )
AND.L	R3, R5, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_write_text92
;matrixrgb_firmware.c,696 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R3, R0, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R3, R3, R4
STI.B	R3, #0, R16
JMP	L_write_text93
L_write_text92:
;matrixrgb_firmware.c,698 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R3, R0, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
ADD.L	R3, SP, #0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_write_text93:
;matrixrgb_firmware.c,699 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R3, R5, #256
; temp_2 end address is: 20 (R5)
ASHL.L	R3, R3, #1
; temp_2 start address is: 20 (R5)
BEXTU.L	R5, R3, #256
;matrixrgb_firmware.c,693 :: 		for( j = 8; j < 16; j++ )
ADD.L	R2, R2, #1
BEXTU.L	R2, R2, #256
;matrixrgb_firmware.c,700 :: 		}
; temp_2 end address is: 20 (R5)
; j end address is: 8 (R2)
JMP	L_write_text89
L_write_text90:
;matrixrgb_firmware.c,701 :: 		cnt+= 2;
ADD.L	R3, R1, #2
BEXTU.L	R1, R3, #256
;matrixrgb_firmware.c,681 :: 		for( k = 0; k < 16; k++ )
ADD.L	R3, R0, #1
; k end address is: 0 (R0)
; k start address is: 44 (R11)
BEXTU.L	R11, R3, #256
;matrixrgb_firmware.c,702 :: 		}
; cnt end address is: 4 (R1)
; k end address is: 44 (R11)
BEXTU.L	R0, R1, #256
JMP	L_write_text81
L_write_text82:
;matrixrgb_firmware.c,704 :: 		font_width = Dejavu18_Widths[ *ptr - 32 ];
LDI.B	R3, R17, #0
SUB.L	R4, R3, #32
BEXTS.L	R4, R4, #0
LDK.L	R3, #_Dejavu18_Widths+0
ADD.L	R3, R3, R4
LDI.B	R3, R3, #0
; font_width start address is: 72 (R18)
BEXTU.L	R18, R3, #256
;matrixrgb_firmware.c,705 :: 		if( ( curr_col + font_width ) >= p_width )
ADD.L	R4, R6, R3
LDA.B	R3, _p_width+0
CMP.S	R4, R3
JMPC	R30, GTE, #0, L__write_text322
; curr_col end address is: 24 (R6)
;matrixrgb_firmware.c,707 :: 		curr_row += 16;
ADD.L	R3, R8, #16
; curr_row end address is: 32 (R8)
; curr_row start address is: 76 (R19)
BEXTU.L	R19, R3, #256
;matrixrgb_firmware.c,708 :: 		curr_col = start_col;
; curr_col start address is: 80 (R20)
BEXTU.L	R20, R15, #256
; curr_col end address is: 80 (R20)
; curr_row end address is: 76 (R19)
;matrixrgb_firmware.c,709 :: 		}
JMP	L_write_text94
L__write_text322:
;matrixrgb_firmware.c,705 :: 		if( ( curr_col + font_width ) >= p_width )
BEXTU.L	R20, R6, #256
BEXTU.L	R19, R8, #256
;matrixrgb_firmware.c,709 :: 		}
L_write_text94:
;matrixrgb_firmware.c,710 :: 		write_letter( text_frame, font_width, curr_row, curr_col );
; curr_col start address is: 80 (R20)
; curr_row start address is: 76 (R19)
ADD.L	R3, SP, #0
BEXTU.L	R2, R19, #256
BEXTU.L	R1, R18, #256
MOVE.L	R0, R3
BEXTU.L	R3, R20, #256
CALL	_write_letter+0
;matrixrgb_firmware.c,711 :: 		curr_col += font_width;
ADD.L	R3, R20, R18
; font_width end address is: 72 (R18)
; curr_col end address is: 80 (R20)
; curr_col start address is: 0 (R0)
BEXTU.L	R0, R3, #256
;matrixrgb_firmware.c,713 :: 		if( curr_col >= shift_reg )
LDA.L	R4, _shift_reg+0
BEXTU.L	R3, R3, #256
CMP.L	R3, R4
JMPC	R30, C, #1, L__write_text323
; curr_col end address is: 0 (R0)
;matrixrgb_firmware.c,715 :: 		curr_row += 16;
ADD.L	R3, R19, #16
; curr_row end address is: 76 (R19)
; curr_row start address is: 4 (R1)
BEXTU.L	R1, R3, #256
;matrixrgb_firmware.c,716 :: 		curr_col = start_col;
; curr_col start address is: 0 (R0)
BEXTU.L	R0, R15, #256
; curr_col end address is: 0 (R0)
; curr_row end address is: 4 (R1)
;matrixrgb_firmware.c,717 :: 		}
JMP	L_write_text95
L__write_text323:
;matrixrgb_firmware.c,713 :: 		if( curr_col >= shift_reg )
BEXTU.L	R1, R19, #256
;matrixrgb_firmware.c,717 :: 		}
L_write_text95:
;matrixrgb_firmware.c,718 :: 		ptr++;
; curr_col start address is: 0 (R0)
; curr_row start address is: 4 (R1)
ADD.L	R17, R17, #1
;matrixrgb_firmware.c,719 :: 		}
; start_col end address is: 60 (R15)
; color_buffer end address is: 64 (R16)
; curr_col end address is: 0 (R0)
; curr_row end address is: 4 (R1)
; ptr end address is: 68 (R17)
BEXTU.L	R8, R1, #256
BEXTU.L	R6, R0, #256
JMP	L_write_text79
L_write_text80:
;matrixrgb_firmware.c,721 :: 		}
L_end_write_text:
UNLINK	LR
RETURN	
; end of _write_text
_write_letter:
;matrixrgb_firmware.c,723 :: 		void write_letter( uint8_t *text_frame, uint8_t width, uint8_t current_row, uint8_t current_col )
; current_col start address is: 12 (R3)
; current_row start address is: 8 (R2)
; width start address is: 4 (R1)
; text_frame start address is: 0 (R0)
LINK	LR, #4
BEXTU.L	R4, R2, #256
; current_col end address is: 12 (R3)
; current_row end address is: 8 (R2)
; width end address is: 4 (R1)
; text_frame end address is: 0 (R0)
; text_frame start address is: 0 (R0)
; width start address is: 4 (R1)
; current_row start address is: 16 (R4)
; current_col start address is: 12 (R3)
;matrixrgb_firmware.c,727 :: 		uint8_t row = current_row;
; row start address is: 8 (R2)
BEXTU.L	R2, R4, #256
; current_row end address is: 16 (R4)
;matrixrgb_firmware.c,728 :: 		uint8_t col = current_col;
; col start address is: 16 (R4)
BEXTU.L	R4, R3, #256
; current_col end address is: 12 (R3)
;matrixrgb_firmware.c,736 :: 		for( m = 0; m < width; m++ )
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
L_write_letter96:
; m start address is: 52 (R13)
; col start address is: 48 (R12)
; row start address is: 44 (R11)
; width start address is: 40 (R10)
; text_frame start address is: 36 (R9)
CMP.B	R13, R10
JMPC	R30, C, #0, L_write_letter97
;matrixrgb_firmware.c,739 :: 		for( k = 0; k < 16; k++ )
; k start address is: 56 (R14)
LDK.L	R14, #0
; text_frame end address is: 36 (R9)
; width end address is: 40 (R10)
; row end address is: 44 (R11)
; col end address is: 48 (R12)
; k end address is: 56 (R14)
; m end address is: 52 (R13)
L_write_letter99:
; k start address is: 56 (R14)
; text_frame start address is: 36 (R9)
; width start address is: 40 (R10)
; row start address is: 44 (R11)
; col start address is: 48 (R12)
; m start address is: 52 (R13)
CMP.B	R14, #16
JMPC	R30, C, #0, L_write_letter100
;matrixrgb_firmware.c,741 :: 		red = text_frame[( k * 16 + m )] & 0x04;
BEXTU.L	R4, R14, #256
ASHL.L	R4, R4, #4
BEXTS.L	R4, R4, #0
ADD.L	R4, R4, R13
BEXTS.L	R4, R4, #0
ADD.L	R4, R9, R4
LDI.B	R4, R4, #0
AND.L	R8, R4, #4
;matrixrgb_firmware.c,742 :: 		green = text_frame[( k * 16 + m )] & 0x02;
AND.L	R7, R4, #2
;matrixrgb_firmware.c,743 :: 		blue = text_frame[( k * 16 + m )] & 0x01;
AND.L	R6, R4, #1
;matrixrgb_firmware.c,744 :: 		write_pixel( row + k, col + m, red, green, blue );
ADD.L	R5, R12, R13
ADD.L	R4, R11, R14
BEXTU.L	R3, R7, #256
BEXTU.L	R2, R8, #256
BEXTS.L	R1, R5, #0
BEXTS.L	R0, R4, #0
BEXTU.L	R4, R6, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,739 :: 		for( k = 0; k < 16; k++ )
ADD.L	R14, R14, #1
BEXTU.L	R14, R14, #256
;matrixrgb_firmware.c,746 :: 		}
; k end address is: 56 (R14)
JMP	L_write_letter99
L_write_letter100:
;matrixrgb_firmware.c,736 :: 		for( m = 0; m < width; m++ )
ADD.L	R13, R13, #1
BEXTU.L	R13, R13, #256
;matrixrgb_firmware.c,748 :: 		}
; text_frame end address is: 36 (R9)
; width end address is: 40 (R10)
; row end address is: 44 (R11)
; col end address is: 48 (R12)
; m end address is: 52 (R13)
JMP	L_write_letter96
L_write_letter97:
;matrixrgb_firmware.c,751 :: 		}
L_end_write_letter:
UNLINK	LR
RETURN	
; end of _write_letter
_image_load:
;matrixrgb_firmware.c,753 :: 		void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
; cnt start address is: 44 (R11)
; bmp start address is: 0 (R0)
LINK	LR, #4
;matrixrgb_firmware.c,758 :: 		cnt = 0;
;matrixrgb_firmware.c,753 :: 		void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
;matrixrgb_firmware.c,758 :: 		cnt = 0;
;matrixrgb_firmware.c,753 :: 		void image_load( uint8_t *bmp, uint8_t width, uint8_t height )         //Image format : Each byte = xxxxxRGB  Write_pxl_img can take Byte format 565.. it converts it to xxxxxRGB
MOVE.L	R1, R0
; cnt end address is: 44 (R11)
; bmp end address is: 0 (R0)
; bmp start address is: 4 (R1)
;matrixrgb_firmware.c,758 :: 		cnt = 0;
; cnt start address is: 44 (R11)
LDK.L	R11, #0
;matrixrgb_firmware.c,760 :: 		for(row = 0; row < 16; row++)
; row start address is: 0 (R0)
LDK.L	R0, #0
; bmp end address is: 4 (R1)
; row end address is: 0 (R0)
; cnt end address is: 44 (R11)
MOVE.L	R8, R1
BEXTS.L	R9, R0, #0
L_image_load102:
; row start address is: 36 (R9)
; cnt start address is: 44 (R11)
; bmp start address is: 32 (R8)
CMP.S	R9, #16
JMPC	R30, GTE, #1, L_image_load103
;matrixrgb_firmware.c,761 :: 		for(column = 0; column < 64; column++)
; column start address is: 40 (R10)
LDK.L	R10, #0
; bmp end address is: 32 (R8)
; cnt end address is: 44 (R11)
; column end address is: 40 (R10)
; row end address is: 36 (R9)
L_image_load105:
; column start address is: 40 (R10)
; bmp start address is: 32 (R8)
; cnt start address is: 44 (R11)
; row start address is: 36 (R9)
CMP.S	R10, #64
JMPC	R30, GTE, #1, L_image_load106
;matrixrgb_firmware.c,763 :: 		tmpCol = bmp[cnt] + (bmp[cnt+1] << 8);
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
;matrixrgb_firmware.c,765 :: 		if(tmpCol != 0)
CMP.S	R3, #0
JMPC	R30, Z, #1, L_image_load108
;matrixrgb_firmware.c,766 :: 		asm nop;
NOP	
L_image_load108:
;matrixrgb_firmware.c,768 :: 		red = tmpCol >> 11;
BEXTU.L	R3, R0, #0
LSHR.L	R5, R3, #11
;matrixrgb_firmware.c,769 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R3, #2047
AND.L	R3, R0, R3
BEXTU.L	R3, R3, #0
LSHR.L	R4, R3, #5
;matrixrgb_firmware.c,770 :: 		blue = tmpCol & 0x1F;
AND.L	R3, R0, #31
; tmpCol end address is: 0 (R0)
;matrixrgb_firmware.c,771 :: 		write_pixel_img(row, column, red, green, blue);
STI.S	SP, #0, R4
BEXTU.L	R2, R5, #256
BEXTS.L	R1, R10, #0
BEXTS.L	R0, R9, #0
BEXTU.L	R4, R3, #256
LDI.B	R3, SP, #0
CALL	_write_pixel_img+0
;matrixrgb_firmware.c,772 :: 		cnt += 2;
ADD.L	R11, R11, #2
BEXTU.L	R11, R11, #0
;matrixrgb_firmware.c,761 :: 		for(column = 0; column < 64; column++)
ADD.L	R10, R10, #1
BEXTS.L	R10, R10, #0
;matrixrgb_firmware.c,773 :: 		}
; column end address is: 40 (R10)
JMP	L_image_load105
L_image_load106:
;matrixrgb_firmware.c,760 :: 		for(row = 0; row < 16; row++)
ADD.L	R9, R9, #1
BEXTS.L	R9, R9, #0
;matrixrgb_firmware.c,773 :: 		}
; bmp end address is: 32 (R8)
; cnt end address is: 44 (R11)
; row end address is: 36 (R9)
JMP	L_image_load102
L_image_load103:
;matrixrgb_firmware.c,774 :: 		}
L_end_image_load:
UNLINK	LR
RETURN	
; end of _image_load
_scroll_image_right:
;matrixrgb_firmware.c,776 :: 		void scroll_image_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
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
;matrixrgb_firmware.c,782 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,783 :: 		cnt = 0;
; cnt start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,785 :: 		for( row = 0; row < 16; row++ )
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
L_scroll_image_right109:
; row start address is: 24 (R6)
; cnt start address is: 32 (R8)
; speed start address is: 12 (R3)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; bmp start address is: 0 (R0)
CMP.S	R6, #16
JMPC	R30, GTE, #1, L_scroll_image_right110
;matrixrgb_firmware.c,786 :: 		for(column = 0; column < ( ( height * width ) * 32 ); column++)
; column start address is: 28 (R7)
LDK.L	R7, #0
; bmp end address is: 0 (R0)
; width end address is: 4 (R1)
; height end address is: 8 (R2)
; speed end address is: 12 (R3)
; cnt end address is: 32 (R8)
; column end address is: 28 (R7)
; row end address is: 24 (R6)
L_scroll_image_right112:
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
JMPC	R30, GTE, #1, L_scroll_image_right113
;matrixrgb_firmware.c,788 :: 		buffer = 0;
; buffer start address is: 36 (R9)
LDK.L	R9, #0
;matrixrgb_firmware.c,789 :: 		tmpCol = bmp[cnt] + (bmp[cnt+1] << 8);
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
;matrixrgb_firmware.c,791 :: 		if(tmpCol != 0)
CMP.S	R4, #0
JMPC	R30, Z, #1, L_scroll_image_right115
;matrixrgb_firmware.c,792 :: 		asm nop;
NOP	
L_scroll_image_right115:
;matrixrgb_firmware.c,794 :: 		red = tmpCol >> 11;
BEXTU.L	R4, R11, #0
LSHR.L	R5, R4, #11
;matrixrgb_firmware.c,795 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R4, #2047
AND.L	R4, R11, R4
BEXTU.L	R4, R4, #0
LSHR.L	R4, R4, #5
; green start address is: 40 (R10)
BEXTU.L	R10, R4, #256
;matrixrgb_firmware.c,796 :: 		blue = tmpCol & 0x1F;
AND.L	R4, R11, #31
; tmpCol end address is: 44 (R11)
; blue start address is: 44 (R11)
BEXTU.L	R11, R4, #256
;matrixrgb_firmware.c,797 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R4, R5, #256
AND.L	R4, R4, #24
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_right339
;matrixrgb_firmware.c,798 :: 		buffer |= 0x04;
OR.L	R5, R9, #4
BEXTU.L	R5, R5, #256
; buffer end address is: 36 (R9)
; buffer start address is: 20 (R5)
; buffer end address is: 20 (R5)
JMP	L_scroll_image_right116
L__scroll_image_right339:
;matrixrgb_firmware.c,797 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R5, R9, #256
;matrixrgb_firmware.c,798 :: 		buffer |= 0x04;
L_scroll_image_right116:
;matrixrgb_firmware.c,799 :: 		if( ( green & 0x38 ) > 0 )
; buffer start address is: 20 (R5)
AND.L	R4, R10, #56
; green end address is: 40 (R10)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_right340
;matrixrgb_firmware.c,800 :: 		buffer |= 0x02;
OR.L	R4, R5, #2
BEXTU.L	R5, R4, #256
; buffer end address is: 20 (R5)
BEXTU.L	R9, R5, #256
JMP	L_scroll_image_right117
L__scroll_image_right340:
;matrixrgb_firmware.c,799 :: 		if( ( green & 0x38 ) > 0 )
BEXTU.L	R9, R5, #256
;matrixrgb_firmware.c,800 :: 		buffer |= 0x02;
L_scroll_image_right117:
;matrixrgb_firmware.c,801 :: 		if( ( blue & 0x18 ) > 0 )
; buffer start address is: 36 (R9)
AND.L	R4, R11, #24
; blue end address is: 44 (R11)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_right341
;matrixrgb_firmware.c,802 :: 		buffer |= 0x01;
OR.L	R9, R9, #1
BEXTU.L	R9, R9, #256
; buffer end address is: 36 (R9)
JMP	L_scroll_image_right118
L__scroll_image_right341:
;matrixrgb_firmware.c,801 :: 		if( ( blue & 0x18 ) > 0 )
;matrixrgb_firmware.c,802 :: 		buffer |= 0x01;
L_scroll_image_right118:
;matrixrgb_firmware.c,803 :: 		image_frame[( row * shift_reg ) + column] = buffer;
; buffer start address is: 36 (R9)
LDA.L	R4, _shift_reg+0
MUL.L	R4, R6, R4
ADD.L	R5, R4, R7
ADD.L	R4, SP, #0
ADD.L	R4, R4, R5
STI.B	R4, #0, R9
; buffer end address is: 36 (R9)
;matrixrgb_firmware.c,804 :: 		cnt += 2;
ADD.L	R8, R8, #2
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,786 :: 		for(column = 0; column < ( ( height * width ) * 32 ); column++)
ADD.L	R7, R7, #1
BEXTS.L	R7, R7, #0
;matrixrgb_firmware.c,805 :: 		}
; column end address is: 28 (R7)
JMP	L_scroll_image_right112
L_scroll_image_right113:
;matrixrgb_firmware.c,785 :: 		for( row = 0; row < 16; row++ )
ADD.L	R6, R6, #1
BEXTS.L	R6, R6, #0
;matrixrgb_firmware.c,805 :: 		}
; bmp end address is: 0 (R0)
; cnt end address is: 32 (R8)
; row end address is: 24 (R6)
JMP	L_scroll_image_right109
L_scroll_image_right110:
;matrixrgb_firmware.c,806 :: 		scroll_image_onto_left( image_frame, width, height, speed );
ADD.L	R4, SP, #0
; speed end address is: 12 (R3)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
MOVE.L	R0, R4
CALL	_scroll_image_onto_left+0
;matrixrgb_firmware.c,807 :: 		}
L_end_scroll_image_right:
UNLINK	LR
RETURN	
; end of _scroll_image_right
_scroll_image_onto_left:
;matrixrgb_firmware.c,809 :: 		void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
; m start address is: 48 (R12)
; height start address is: 8 (R2)
LINK	LR, #12
;matrixrgb_firmware.c,816 :: 		for( m = 1; m <= width; m++ )
;matrixrgb_firmware.c,809 :: 		void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.L	SP, #0, R0
STI.B	SP, #4, R1
BEXTU.L	R10, R2, #256
;matrixrgb_firmware.c,816 :: 		for( m = 1; m <= width; m++ )
;matrixrgb_firmware.c,809 :: 		void scroll_image_onto_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.S	SP, #8, R3
; m end address is: 48 (R12)
; height end address is: 8 (R2)
; height start address is: 40 (R10)
;matrixrgb_firmware.c,812 :: 		uint16_t i = 0, j = 64;
;matrixrgb_firmware.c,813 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,816 :: 		for( m = 1; m <= width; m++ )
; m start address is: 48 (R12)
LDK.L	R12, #1
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_left119:
; m start address is: 48 (R12)
; height start address is: 40 (R10)
LDI.B	R4, SP, #4
CMP.B	R12, R4
JMPC	R30, A, #1, L_scroll_image_onto_left120
;matrixrgb_firmware.c,818 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,820 :: 		for( k = 0; k < height; k++ )
; k start address is: 32 (R8)
LDK.L	R8, #0
; k end address is: 32 (R8)
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_left122:
; k start address is: 32 (R8)
; height start address is: 40 (R10)
; m start address is: 48 (R12)
CMP.B	R8, R10
JMPC	R30, C, #0, L_scroll_image_onto_left123
;matrixrgb_firmware.c,822 :: 		buffer = bmp[( ( k + 1 ) * width ) - m];
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
;matrixrgb_firmware.c,823 :: 		red   = ( buffer & 0x04 );
AND.L	R6, R4, #4
;matrixrgb_firmware.c,824 :: 		green = ( buffer & 0x02 );
AND.L	R5, R4, #2
;matrixrgb_firmware.c,825 :: 		blue  = ( buffer & 0x01 );
AND.L	R4, R4, #1
;matrixrgb_firmware.c,826 :: 		write_pixel( k, 0, red, green, blue );
BEXTU.L	R3, R5, #256
BEXTU.L	R2, R6, #256
LDK.L	R1, #0
BEXTU.L	R0, R8, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,820 :: 		for( k = 0; k < height; k++ )
ADD.L	R4, R8, #1
; k end address is: 32 (R8)
; k start address is: 52 (R13)
BEXTU.L	R13, R4, #256
;matrixrgb_firmware.c,827 :: 		}
; k end address is: 52 (R13)
BEXTU.L	R8, R13, #256
JMP	L_scroll_image_onto_left122
L_scroll_image_onto_left123:
;matrixrgb_firmware.c,829 :: 		for( p = 0; p < speed; p++ )
; p start address is: 56 (R14)
LDK.L	R14, #0
; height end address is: 40 (R10)
; p end address is: 56 (R14)
; m end address is: 48 (R12)
BEXTU.L	R13, R12, #256
BEXTU.L	R9, R14, #256
L_scroll_image_onto_left125:
; p start address is: 36 (R9)
; m start address is: 52 (R13)
; height start address is: 40 (R10)
LDI.S	R4, SP, #8
CMP.S	R9, R4
JMPC	R30, C, #0, L_scroll_image_onto_left126
;matrixrgb_firmware.c,830 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,829 :: 		for( p = 0; p < speed; p++ )
ADD.L	R4, R9, #1
; p end address is: 36 (R9)
; p start address is: 56 (R14)
BEXTU.L	R14, R4, #256
;matrixrgb_firmware.c,830 :: 		refresh();
; p end address is: 56 (R14)
BEXTU.L	R9, R14, #256
JMP	L_scroll_image_onto_left125
L_scroll_image_onto_left126:
;matrixrgb_firmware.c,816 :: 		for( m = 1; m <= width; m++ )
ADD.L	R4, R13, #1
; m end address is: 52 (R13)
; m start address is: 48 (R12)
BEXTU.L	R12, R4, #256
;matrixrgb_firmware.c,832 :: 		}
; height end address is: 40 (R10)
; m end address is: 48 (R12)
JMP	L_scroll_image_onto_left119
L_scroll_image_onto_left120:
;matrixrgb_firmware.c,834 :: 		}
L_end_scroll_image_onto_left:
UNLINK	LR
RETURN	
; end of _scroll_image_onto_left
_scroll_image_left:
;matrixrgb_firmware.c,836 :: 		void scroll_image_left( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
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
;matrixrgb_firmware.c,842 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,843 :: 		cnt = 0;
; cnt start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,845 :: 		for(row = 0; row < 16; row++)
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
L_scroll_image_left128:
; row start address is: 24 (R6)
; cnt start address is: 32 (R8)
; speed start address is: 12 (R3)
; height start address is: 8 (R2)
; width start address is: 4 (R1)
; bmp start address is: 0 (R0)
CMP.S	R6, #16
JMPC	R30, GTE, #1, L_scroll_image_left129
;matrixrgb_firmware.c,846 :: 		for(column = 0; column < ( ( height * width ) * 32 ); column++)
; column start address is: 28 (R7)
LDK.L	R7, #0
; bmp end address is: 0 (R0)
; width end address is: 4 (R1)
; height end address is: 8 (R2)
; speed end address is: 12 (R3)
; cnt end address is: 32 (R8)
; column end address is: 28 (R7)
; row end address is: 24 (R6)
L_scroll_image_left131:
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
JMPC	R30, GTE, #1, L_scroll_image_left132
;matrixrgb_firmware.c,848 :: 		buffer = 0;
; buffer start address is: 36 (R9)
LDK.L	R9, #0
;matrixrgb_firmware.c,849 :: 		tmpCol = bmp[cnt] + (bmp[cnt+1] << 8);
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
;matrixrgb_firmware.c,851 :: 		if(tmpCol != 0)
CMP.S	R4, #0
JMPC	R30, Z, #1, L_scroll_image_left134
;matrixrgb_firmware.c,852 :: 		asm nop;
NOP	
L_scroll_image_left134:
;matrixrgb_firmware.c,854 :: 		red = tmpCol >> 11;
BEXTU.L	R4, R11, #0
LSHR.L	R5, R4, #11
;matrixrgb_firmware.c,855 :: 		green = (tmpCol & 0x7FF) >> 5;
LDK.L	R4, #2047
AND.L	R4, R11, R4
BEXTU.L	R4, R4, #0
LSHR.L	R4, R4, #5
; green start address is: 40 (R10)
BEXTU.L	R10, R4, #256
;matrixrgb_firmware.c,856 :: 		blue = tmpCol & 0x1F;
AND.L	R4, R11, #31
; tmpCol end address is: 44 (R11)
; blue start address is: 44 (R11)
BEXTU.L	R11, R4, #256
;matrixrgb_firmware.c,857 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R4, R5, #256
AND.L	R4, R4, #24
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_left342
;matrixrgb_firmware.c,858 :: 		buffer |= 0x04;
OR.L	R5, R9, #4
BEXTU.L	R5, R5, #256
; buffer end address is: 36 (R9)
; buffer start address is: 20 (R5)
; buffer end address is: 20 (R5)
JMP	L_scroll_image_left135
L__scroll_image_left342:
;matrixrgb_firmware.c,857 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R5, R9, #256
;matrixrgb_firmware.c,858 :: 		buffer |= 0x04;
L_scroll_image_left135:
;matrixrgb_firmware.c,859 :: 		if( ( green & 0x38 ) > 0 )
; buffer start address is: 20 (R5)
AND.L	R4, R10, #56
; green end address is: 40 (R10)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_left343
;matrixrgb_firmware.c,860 :: 		buffer |= 0x02;
OR.L	R4, R5, #2
BEXTU.L	R5, R4, #256
; buffer end address is: 20 (R5)
BEXTU.L	R9, R5, #256
JMP	L_scroll_image_left136
L__scroll_image_left343:
;matrixrgb_firmware.c,859 :: 		if( ( green & 0x38 ) > 0 )
BEXTU.L	R9, R5, #256
;matrixrgb_firmware.c,860 :: 		buffer |= 0x02;
L_scroll_image_left136:
;matrixrgb_firmware.c,861 :: 		if( ( blue & 0x18 ) > 0 )
; buffer start address is: 36 (R9)
AND.L	R4, R11, #24
; blue end address is: 44 (R11)
CMP.B	R4, #0
JMPC	R30, A, #0, L__scroll_image_left344
;matrixrgb_firmware.c,862 :: 		buffer |= 0x01;
OR.L	R9, R9, #1
BEXTU.L	R9, R9, #256
; buffer end address is: 36 (R9)
JMP	L_scroll_image_left137
L__scroll_image_left344:
;matrixrgb_firmware.c,861 :: 		if( ( blue & 0x18 ) > 0 )
;matrixrgb_firmware.c,862 :: 		buffer |= 0x01;
L_scroll_image_left137:
;matrixrgb_firmware.c,863 :: 		image_frame[( row * shift_reg ) + column] = buffer;
; buffer start address is: 36 (R9)
LDA.L	R4, _shift_reg+0
MUL.L	R4, R6, R4
ADD.L	R5, R4, R7
ADD.L	R4, SP, #0
ADD.L	R4, R4, R5
STI.B	R4, #0, R9
; buffer end address is: 36 (R9)
;matrixrgb_firmware.c,864 :: 		cnt += 2;
ADD.L	R8, R8, #2
BEXTU.L	R8, R8, #0
;matrixrgb_firmware.c,846 :: 		for(column = 0; column < ( ( height * width ) * 32 ); column++)
ADD.L	R7, R7, #1
BEXTS.L	R7, R7, #0
;matrixrgb_firmware.c,865 :: 		}
; column end address is: 28 (R7)
JMP	L_scroll_image_left131
L_scroll_image_left132:
;matrixrgb_firmware.c,845 :: 		for(row = 0; row < 16; row++)
ADD.L	R6, R6, #1
BEXTS.L	R6, R6, #0
;matrixrgb_firmware.c,865 :: 		}
; bmp end address is: 0 (R0)
; cnt end address is: 32 (R8)
; row end address is: 24 (R6)
JMP	L_scroll_image_left128
L_scroll_image_left129:
;matrixrgb_firmware.c,867 :: 		scroll_image_onto_right( image_frame, width, height, speed );
ADD.L	R4, SP, #0
; speed end address is: 12 (R3)
; height end address is: 8 (R2)
; width end address is: 4 (R1)
MOVE.L	R0, R4
CALL	_scroll_image_onto_right+0
;matrixrgb_firmware.c,869 :: 		}
L_end_scroll_image_left:
UNLINK	LR
RETURN	
; end of _scroll_image_left
_scroll_image_onto_right:
;matrixrgb_firmware.c,871 :: 		void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
; m start address is: 48 (R12)
; height start address is: 8 (R2)
LINK	LR, #12
;matrixrgb_firmware.c,878 :: 		for( m = 0; m < width; m++ )
;matrixrgb_firmware.c,871 :: 		void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.L	SP, #0, R0
STI.B	SP, #4, R1
BEXTU.L	R10, R2, #256
;matrixrgb_firmware.c,878 :: 		for( m = 0; m < width; m++ )
;matrixrgb_firmware.c,871 :: 		void scroll_image_onto_right( uint8_t *bmp, uint8_t width, uint8_t height, uint16_t speed )
STI.S	SP, #8, R3
; m end address is: 48 (R12)
; height end address is: 8 (R2)
; height start address is: 40 (R10)
;matrixrgb_firmware.c,874 :: 		uint16_t i = 0, j = 64;
;matrixrgb_firmware.c,875 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,878 :: 		for( m = 0; m < width; m++ )
; m start address is: 48 (R12)
LDK.L	R12, #0
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_right138:
; m start address is: 48 (R12)
; height start address is: 40 (R10)
LDI.B	R4, SP, #4
CMP.B	R12, R4
JMPC	R30, C, #0, L_scroll_image_onto_right139
;matrixrgb_firmware.c,880 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,882 :: 		for( k = 0; k < height; k++ )
; k start address is: 32 (R8)
LDK.L	R8, #0
; k end address is: 32 (R8)
; height end address is: 40 (R10)
; m end address is: 48 (R12)
L_scroll_image_onto_right141:
; k start address is: 32 (R8)
; height start address is: 40 (R10)
; m start address is: 48 (R12)
CMP.B	R8, R10
JMPC	R30, C, #0, L_scroll_image_onto_right142
;matrixrgb_firmware.c,884 :: 		buffer = bmp[( k * width + m )];
LDI.B	R4, SP, #4
MUL.L	R4, R8, R4
BEXTS.L	R4, R4, #0
ADD.L	R5, R4, R12
BEXTS.L	R5, R5, #0
LDI.L	R4, SP, #0
ADD.L	R4, R4, R5
LDI.B	R4, R4, #0
;matrixrgb_firmware.c,885 :: 		red   = ( buffer & 0x04 );
AND.L	R7, R4, #4
;matrixrgb_firmware.c,886 :: 		green = ( buffer & 0x02 );
AND.L	R6, R4, #2
;matrixrgb_firmware.c,887 :: 		blue  = ( buffer & 0x01 );
AND.L	R5, R4, #1
;matrixrgb_firmware.c,888 :: 		write_pixel( k, ( p_width - 1 ), red, green, blue );
LDA.B	R4, _p_width+0
SUB.L	R4, R4, #1
BEXTU.L	R3, R6, #256
BEXTU.L	R2, R7, #256
BEXTS.L	R1, R4, #0
BEXTU.L	R4, R5, #256
BEXTU.L	R0, R8, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,882 :: 		for( k = 0; k < height; k++ )
ADD.L	R4, R8, #1
; k end address is: 32 (R8)
; k start address is: 52 (R13)
BEXTU.L	R13, R4, #256
;matrixrgb_firmware.c,889 :: 		}
; k end address is: 52 (R13)
BEXTU.L	R8, R13, #256
JMP	L_scroll_image_onto_right141
L_scroll_image_onto_right142:
;matrixrgb_firmware.c,891 :: 		for( p = 0; p < speed; p++ )
; p start address is: 56 (R14)
LDK.L	R14, #0
; height end address is: 40 (R10)
; p end address is: 56 (R14)
; m end address is: 48 (R12)
BEXTU.L	R13, R12, #256
BEXTU.L	R9, R14, #256
L_scroll_image_onto_right144:
; p start address is: 36 (R9)
; m start address is: 52 (R13)
; height start address is: 40 (R10)
LDI.S	R4, SP, #8
CMP.S	R9, R4
JMPC	R30, C, #0, L_scroll_image_onto_right145
;matrixrgb_firmware.c,892 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,891 :: 		for( p = 0; p < speed; p++ )
ADD.L	R4, R9, #1
; p end address is: 36 (R9)
; p start address is: 56 (R14)
BEXTU.L	R14, R4, #256
;matrixrgb_firmware.c,892 :: 		refresh();
; p end address is: 56 (R14)
BEXTU.L	R9, R14, #256
JMP	L_scroll_image_onto_right144
L_scroll_image_onto_right145:
;matrixrgb_firmware.c,878 :: 		for( m = 0; m < width; m++ )
ADD.L	R4, R13, #1
; m end address is: 52 (R13)
; m start address is: 48 (R12)
BEXTU.L	R12, R4, #256
;matrixrgb_firmware.c,894 :: 		}
; height end address is: 40 (R10)
; m end address is: 48 (R12)
JMP	L_scroll_image_onto_right138
L_scroll_image_onto_right139:
;matrixrgb_firmware.c,896 :: 		}
L_end_scroll_image_onto_right:
UNLINK	LR
RETURN	
; end of _scroll_image_onto_right
_scroll_text_left:
;matrixrgb_firmware.c,898 :: 		void scroll_text_left( char *text, color_t color, uint16_t speed )
; speed start address is: 4 (R1)
; text start address is: 0 (R0)
LINK	LR, #256
MOVE.L	R2, R0
; speed end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 8 (R2)
; speed start address is: 4 (R1)
;matrixrgb_firmware.c,900 :: 		char *ptr = text;
; ptr start address is: 0 (R0)
MOVE.L	R0, R2
; text end address is: 8 (R2)
;matrixrgb_firmware.c,901 :: 		uint8_t text_frame[256] = { 0 };
ADD.L	R27, SP, #0
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_left_text_frame_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,904 :: 		uint8_t cnt = 0;
;matrixrgb_firmware.c,906 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 12 (R3)
LDK.L	R3, #0
;matrixrgb_firmware.c,908 :: 		if( ptr == NULL )           //Sanity check
CMP.L	R0, #0
JMPC	R30, Z, #0, L_scroll_text_left147
; speed end address is: 4 (R1)
; ptr end address is: 0 (R0)
; color_buffer end address is: 12 (R3)
;matrixrgb_firmware.c,909 :: 		return;
JMP	L_end_scroll_text_left
L_scroll_text_left147:
;matrixrgb_firmware.c,911 :: 		if( color.red  > 0 )        //Create color for frame
; color_buffer start address is: 12 (R3)
; ptr start address is: 0 (R0)
; speed start address is: 4 (R1)
ADD.L	R2, SP, #264
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_left333
;matrixrgb_firmware.c,912 :: 		color_buffer |= 0x04;
OR.L	R3, R3, #4
BEXTU.L	R3, R3, #256
; color_buffer end address is: 12 (R3)
JMP	L_scroll_text_left148
L__scroll_text_left333:
;matrixrgb_firmware.c,911 :: 		if( color.red  > 0 )        //Create color for frame
;matrixrgb_firmware.c,912 :: 		color_buffer |= 0x04;
L_scroll_text_left148:
;matrixrgb_firmware.c,913 :: 		if( color.green > 0 )
; color_buffer start address is: 12 (R3)
ADD.L	R2, SP, #265
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_left334
;matrixrgb_firmware.c,914 :: 		color_buffer |= 0x02;
OR.L	R3, R3, #2
BEXTU.L	R3, R3, #256
; color_buffer end address is: 12 (R3)
JMP	L_scroll_text_left149
L__scroll_text_left334:
;matrixrgb_firmware.c,913 :: 		if( color.green > 0 )
;matrixrgb_firmware.c,914 :: 		color_buffer |= 0x02;
L_scroll_text_left149:
;matrixrgb_firmware.c,915 :: 		if( color.blue > 0 )
; color_buffer start address is: 12 (R3)
ADD.L	R2, SP, #266
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_left335
;matrixrgb_firmware.c,916 :: 		color_buffer |= 0x01;
OR.L	R2, R3, #1
BEXTU.L	R3, R2, #256
; color_buffer end address is: 12 (R3)
BEXTU.L	R14, R3, #256
JMP	L_scroll_text_left150
L__scroll_text_left335:
;matrixrgb_firmware.c,915 :: 		if( color.blue > 0 )
BEXTU.L	R14, R3, #256
;matrixrgb_firmware.c,916 :: 		color_buffer |= 0x01;
L_scroll_text_left150:
;matrixrgb_firmware.c,918 :: 		while( *ptr != NULL )
; color_buffer start address is: 56 (R14)
BEXTU.L	R10, R1, #0
; speed end address is: 4 (R1)
; ptr end address is: 0 (R0)
; color_buffer end address is: 56 (R14)
MOVE.L	R15, R0
L_scroll_text_left151:
; color_buffer start address is: 56 (R14)
; ptr start address is: 60 (R15)
; speed start address is: 40 (R10)
LDI.B	R2, R15, #0
CMP.B	R2, #0
JMPC	R30, Z, #1, L_scroll_text_left152
;matrixrgb_firmware.c,920 :: 		cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,921 :: 		for( k = 0; k < 16; k++ )
; k start address is: 36 (R9)
LDK.L	R9, #0
; cnt end address is: 0 (R0)
; speed end address is: 40 (R10)
; color_buffer end address is: 56 (R14)
; k end address is: 36 (R9)
; ptr end address is: 60 (R15)
L_scroll_text_left153:
; k start address is: 36 (R9)
; cnt start address is: 0 (R0)
; speed start address is: 40 (R10)
; ptr start address is: 60 (R15)
; color_buffer start address is: 56 (R14)
CMP.B	R9, #16
JMPC	R30, C, #0, L_scroll_text_left154
;matrixrgb_firmware.c,923 :: 		temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
LDI.B	R2, R15, #0
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
;matrixrgb_firmware.c,924 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
ADD.L	R2, R4, #1
BEXTS.L	R2, R2, #0
ADD.L	R2, R3, R2
LPMI.B	R1, R2, #0
; temp_2 start address is: 4 (R1)
;matrixrgb_firmware.c,925 :: 		for( j = 0; j < 8; j++ )
; j start address is: 20 (R5)
LDK.L	R5, #0
; temp_2 end address is: 4 (R1)
; cnt end address is: 0 (R0)
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
; speed end address is: 40 (R10)
; color_buffer end address is: 56 (R14)
; k end address is: 36 (R9)
; ptr end address is: 60 (R15)
BEXTU.L	R8, R10, #0
MOVE.L	R7, R15
BEXTU.L	R4, R14, #256
L_scroll_text_left156:
; j start address is: 20 (R5)
; temp_2 start address is: 4 (R1)
; temp start address is: 24 (R6)
; color_buffer start address is: 16 (R4)
; ptr start address is: 28 (R7)
; speed start address is: 32 (R8)
; cnt start address is: 0 (R0)
; k start address is: 36 (R9)
CMP.B	R5, #8
JMPC	R30, C, #0, L_scroll_text_left157
;matrixrgb_firmware.c,927 :: 		if( ( temp & 0x80 ) > 0x00 )
AND.L	R2, R6, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_left159
;matrixrgb_firmware.c,928 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R9, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R5
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R4
JMP	L_scroll_text_left160
L_scroll_text_left159:
;matrixrgb_firmware.c,930 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R9, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R5
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_left160:
;matrixrgb_firmware.c,931 :: 		temp = ( temp << 1 );
BEXTU.L	R2, R6, #256
; temp end address is: 24 (R6)
ASHL.L	R2, R2, #1
; temp start address is: 24 (R6)
BEXTU.L	R6, R2, #256
;matrixrgb_firmware.c,925 :: 		for( j = 0; j < 8; j++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,932 :: 		}
; temp end address is: 24 (R6)
; j end address is: 20 (R5)
JMP	L_scroll_text_left156
L_scroll_text_left157:
;matrixrgb_firmware.c,933 :: 		for( j = 8; j < 16; j++ )
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
BEXTU.L	R14, R4, #256
BEXTU.L	R4, R2, #256
MOVE.L	R15, R7
BEXTU.L	R10, R8, #0
L_scroll_text_left161:
; j start address is: 16 (R4)
; k start address is: 0 (R0)
; cnt start address is: 4 (R1)
; speed start address is: 40 (R10)
; ptr start address is: 60 (R15)
; color_buffer start address is: 56 (R14)
; temp_2 start address is: 20 (R5)
CMP.B	R4, #16
JMPC	R30, C, #0, L_scroll_text_left162
;matrixrgb_firmware.c,935 :: 		if( ( temp_2 & 0x80 ) > 0x00 )
AND.L	R2, R5, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_left164
;matrixrgb_firmware.c,936 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R14
JMP	L_scroll_text_left165
L_scroll_text_left164:
;matrixrgb_firmware.c,938 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_left165:
;matrixrgb_firmware.c,939 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R2, R5, #256
; temp_2 end address is: 20 (R5)
ASHL.L	R2, R2, #1
; temp_2 start address is: 20 (R5)
BEXTU.L	R5, R2, #256
;matrixrgb_firmware.c,933 :: 		for( j = 8; j < 16; j++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #256
;matrixrgb_firmware.c,940 :: 		}
; temp_2 end address is: 20 (R5)
; j end address is: 16 (R4)
JMP	L_scroll_text_left161
L_scroll_text_left162:
;matrixrgb_firmware.c,941 :: 		cnt+= 2;
ADD.L	R2, R1, #2
BEXTU.L	R1, R2, #256
;matrixrgb_firmware.c,921 :: 		for( k = 0; k < 16; k++ )
ADD.L	R2, R0, #1
; k end address is: 0 (R0)
; k start address is: 36 (R9)
BEXTU.L	R9, R2, #256
;matrixrgb_firmware.c,942 :: 		}
; cnt end address is: 4 (R1)
; k end address is: 36 (R9)
BEXTU.L	R0, R1, #256
JMP	L_scroll_text_left153
L_scroll_text_left154:
;matrixrgb_firmware.c,944 :: 		font_width = Dejavu18_Widths[ *ptr - 32 ];
LDI.B	R2, R15, #0
SUB.L	R3, R2, #32
BEXTS.L	R3, R3, #0
LDK.L	R2, #_Dejavu18_Widths+0
ADD.L	R2, R2, R3
LDI.B	R3, R2, #0
;matrixrgb_firmware.c,945 :: 		shift_lett_onto_right( text_frame, font_width, speed );
ADD.L	R2, SP, #0
BEXTU.L	R1, R3, #256
MOVE.L	R0, R2
BEXTU.L	R2, R10, #0
CALL	_shift_lett_onto_right+0
;matrixrgb_firmware.c,946 :: 		ptr++;
ADD.L	R15, R15, #1
;matrixrgb_firmware.c,947 :: 		}
; speed end address is: 40 (R10)
; color_buffer end address is: 56 (R14)
; ptr end address is: 60 (R15)
JMP	L_scroll_text_left151
L_scroll_text_left152:
;matrixrgb_firmware.c,948 :: 		}
L_end_scroll_text_left:
UNLINK	LR
RETURN	
; end of _scroll_text_left
_shift_lett_onto_right:
;matrixrgb_firmware.c,950 :: 		void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
; m start address is: 44 (R11)
LINK	LR, #12
;matrixrgb_firmware.c,957 :: 		for( m = 0; m < font_width; m++ )
;matrixrgb_firmware.c,950 :: 		void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
STI.L	SP, #0, R0
STI.B	SP, #4, R1
;matrixrgb_firmware.c,957 :: 		for( m = 0; m < font_width; m++ )
;matrixrgb_firmware.c,950 :: 		void shift_lett_onto_right( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
STI.S	SP, #8, R2
; m end address is: 44 (R11)
;matrixrgb_firmware.c,953 :: 		uint16_t i = 0, j = 63;
;matrixrgb_firmware.c,955 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,957 :: 		for( m = 0; m < font_width; m++ )
; m start address is: 44 (R11)
LDK.L	R11, #0
; m end address is: 44 (R11)
L_shift_lett_onto_right166:
; m start address is: 44 (R11)
LDI.B	R3, SP, #4
CMP.B	R11, R3
JMPC	R30, C, #0, L_shift_lett_onto_right167
;matrixrgb_firmware.c,959 :: 		for( k = 0; k < 16; k++ )
; k start address is: 48 (R12)
LDK.L	R12, #0
; k end address is: 48 (R12)
; m end address is: 44 (R11)
BEXTU.L	R8, R12, #256
L_shift_lett_onto_right169:
; k start address is: 32 (R8)
; m start address is: 44 (R11)
CMP.B	R8, #16
JMPC	R30, C, #0, L_shift_lett_onto_right170
;matrixrgb_firmware.c,961 :: 		buffer = text_frame[( k * 16 + m )];
BEXTU.L	R3, R8, #256
ASHL.L	R3, R3, #4
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R11
BEXTS.L	R4, R4, #0
LDI.L	R3, SP, #0
ADD.L	R3, R3, R4
LDI.B	R3, R3, #0
;matrixrgb_firmware.c,962 :: 		red   = ( buffer & 0x04 );
AND.L	R6, R3, #4
;matrixrgb_firmware.c,963 :: 		green = ( buffer & 0x02 );
AND.L	R5, R3, #2
;matrixrgb_firmware.c,964 :: 		blue  = ( buffer & 0x01 );
AND.L	R4, R3, #1
;matrixrgb_firmware.c,965 :: 		write_pixel( k, ( p_width - 1 ), red, green, blue );
LDA.B	R3, _p_width+0
SUB.L	R3, R3, #1
BEXTU.L	R2, R6, #256
BEXTS.L	R1, R3, #0
BEXTU.L	R3, R5, #256
BEXTU.L	R0, R8, #256
CALL	_write_pixel+0
;matrixrgb_firmware.c,959 :: 		for( k = 0; k < 16; k++ )
ADD.L	R3, R8, #1
; k end address is: 32 (R8)
; k start address is: 48 (R12)
BEXTU.L	R12, R3, #256
;matrixrgb_firmware.c,966 :: 		}
; k end address is: 48 (R12)
BEXTU.L	R8, R12, #256
JMP	L_shift_lett_onto_right169
L_shift_lett_onto_right170:
;matrixrgb_firmware.c,968 :: 		for( p = 0; p < speed; p++ )
; p start address is: 52 (R13)
LDK.L	R13, #0
; p end address is: 52 (R13)
; m end address is: 44 (R11)
BEXTU.L	R12, R11, #256
BEXTU.L	R9, R13, #256
L_shift_lett_onto_right172:
; p start address is: 36 (R9)
; m start address is: 48 (R12)
LDI.S	R3, SP, #8
CMP.S	R9, R3
JMPC	R30, C, #0, L_shift_lett_onto_right173
;matrixrgb_firmware.c,969 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,968 :: 		for( p = 0; p < speed; p++ )
ADD.L	R3, R9, #1
; p end address is: 36 (R9)
; p start address is: 52 (R13)
BEXTU.L	R13, R3, #256
;matrixrgb_firmware.c,969 :: 		refresh();
; p end address is: 52 (R13)
BEXTU.L	R9, R13, #256
JMP	L_shift_lett_onto_right172
L_shift_lett_onto_right173:
;matrixrgb_firmware.c,971 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,957 :: 		for( m = 0; m < font_width; m++ )
ADD.L	R3, R12, #1
; m end address is: 48 (R12)
; m start address is: 44 (R11)
BEXTU.L	R11, R3, #256
;matrixrgb_firmware.c,972 :: 		}
; m end address is: 44 (R11)
JMP	L_shift_lett_onto_right166
L_shift_lett_onto_right167:
;matrixrgb_firmware.c,973 :: 		}
L_end_shift_lett_onto_right:
UNLINK	LR
RETURN	
; end of _shift_lett_onto_right
_scroll_text_right:
;matrixrgb_firmware.c,975 :: 		void scroll_text_right( char *text, color_t color, uint16_t speed )
; speed start address is: 4 (R1)
; text start address is: 0 (R0)
LINK	LR, #256
MOVE.L	R2, R0
; speed end address is: 4 (R1)
; text end address is: 0 (R0)
; text start address is: 8 (R2)
; speed start address is: 4 (R1)
;matrixrgb_firmware.c,977 :: 		char *ptr = text;
; ptr start address is: 0 (R0)
MOVE.L	R0, R2
; text end address is: 8 (R2)
;matrixrgb_firmware.c,978 :: 		uint8_t text_frame[256] = { 0 };
ADD.L	R27, SP, #0
ADD.L	R26, R27, #256
LDK.L	R28, #?ICSscroll_text_right_text_frame_L0+0
CALL	___CC2DB+0
;matrixrgb_firmware.c,981 :: 		uint8_t cnt = 0;
;matrixrgb_firmware.c,983 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,984 :: 		uint8_t text_length = 0;
; text_length start address is: 12 (R3)
LDK.L	R3, #0
;matrixrgb_firmware.c,986 :: 		if( ptr == NULL )           //Sanity check
CMP.L	R0, #0
JMPC	R30, Z, #0, L_scroll_text_right175
; ptr end address is: 0 (R0)
; color_buffer end address is: 16 (R4)
; speed end address is: 4 (R1)
; text_length end address is: 12 (R3)
;matrixrgb_firmware.c,987 :: 		return;
JMP	L_end_scroll_text_right
L_scroll_text_right175:
;matrixrgb_firmware.c,989 :: 		if( color.red  > 0 )        //Create color for frame
; text_length start address is: 12 (R3)
; speed start address is: 4 (R1)
; color_buffer start address is: 16 (R4)
; ptr start address is: 0 (R0)
ADD.L	R2, SP, #264
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_right336
;matrixrgb_firmware.c,990 :: 		color_buffer |= 0x04;
OR.L	R4, R4, #4
BEXTU.L	R4, R4, #256
; color_buffer end address is: 16 (R4)
JMP	L_scroll_text_right176
L__scroll_text_right336:
;matrixrgb_firmware.c,989 :: 		if( color.red  > 0 )        //Create color for frame
;matrixrgb_firmware.c,990 :: 		color_buffer |= 0x04;
L_scroll_text_right176:
;matrixrgb_firmware.c,991 :: 		if( color.green > 0 )
; color_buffer start address is: 16 (R4)
ADD.L	R2, SP, #265
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_right337
;matrixrgb_firmware.c,992 :: 		color_buffer |= 0x02;
OR.L	R4, R4, #2
BEXTU.L	R4, R4, #256
; color_buffer end address is: 16 (R4)
JMP	L_scroll_text_right177
L__scroll_text_right337:
;matrixrgb_firmware.c,991 :: 		if( color.green > 0 )
;matrixrgb_firmware.c,992 :: 		color_buffer |= 0x02;
L_scroll_text_right177:
;matrixrgb_firmware.c,993 :: 		if( color.blue > 0 )
; color_buffer start address is: 16 (R4)
ADD.L	R2, SP, #266
LDI.B	R2, R2, #0
CMP.B	R2, #0
JMPC	R30, A, #0, L__scroll_text_right338
;matrixrgb_firmware.c,994 :: 		color_buffer |= 0x01;
OR.L	R2, R4, #1
BEXTU.L	R4, R2, #256
; color_buffer end address is: 16 (R4)
BEXTU.L	R2, R4, #256
JMP	L_scroll_text_right178
L__scroll_text_right338:
;matrixrgb_firmware.c,993 :: 		if( color.blue > 0 )
BEXTU.L	R2, R4, #256
;matrixrgb_firmware.c,994 :: 		color_buffer |= 0x01;
L_scroll_text_right178:
;matrixrgb_firmware.c,996 :: 		while( *ptr != NULL )
; color_buffer start address is: 8 (R2)
; ptr end address is: 0 (R0)
; color_buffer end address is: 8 (R2)
; speed end address is: 4 (R1)
; text_length end address is: 12 (R3)
MOVE.L	R4, R0
BEXTU.L	R0, R2, #256
L_scroll_text_right179:
; color_buffer start address is: 0 (R0)
; text_length start address is: 12 (R3)
; ptr start address is: 16 (R4)
; speed start address is: 4 (R1)
LDI.B	R2, R4, #0
CMP.B	R2, #0
JMPC	R30, Z, #1, L_scroll_text_right180
;matrixrgb_firmware.c,998 :: 		ptr++;
ADD.L	R4, R4, #1
;matrixrgb_firmware.c,999 :: 		text_length++;
ADD.L	R3, R3, #1
BEXTU.L	R3, R3, #256
;matrixrgb_firmware.c,1000 :: 		}
JMP	L_scroll_text_right179
L_scroll_text_right180:
;matrixrgb_firmware.c,1002 :: 		ptr--;
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
;matrixrgb_firmware.c,1003 :: 		while( text_length > 0 )
L_scroll_text_right181:
; ptr start address is: 68 (R17)
; speed start address is: 56 (R14)
; text_length start address is: 0 (R0)
; color_buffer start address is: 64 (R16)
CMP.B	R0, #0
JMPC	R30, A, #0, L_scroll_text_right182
;matrixrgb_firmware.c,1005 :: 		text_length--;
SUB.L	R15, R0, #1
BEXTU.L	R15, R15, #256
; text_length end address is: 0 (R0)
; text_length start address is: 60 (R15)
;matrixrgb_firmware.c,1006 :: 		cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1007 :: 		for( k = 0; k < 16; k++ )
; k start address is: 40 (R10)
LDK.L	R10, #0
; cnt end address is: 0 (R0)
; text_length end address is: 60 (R15)
; color_buffer end address is: 64 (R16)
; speed end address is: 56 (R14)
; k end address is: 40 (R10)
; ptr end address is: 68 (R17)
L_scroll_text_right183:
; k start address is: 40 (R10)
; cnt start address is: 0 (R0)
; text_length start address is: 60 (R15)
; color_buffer start address is: 64 (R16)
; speed start address is: 56 (R14)
; ptr start address is: 68 (R17)
CMP.B	R10, #16
JMPC	R30, C, #0, L_scroll_text_right184
;matrixrgb_firmware.c,1009 :: 		temp   = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
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
;matrixrgb_firmware.c,1010 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) +  cnt + 1 ];
ADD.L	R2, R4, #1
BEXTS.L	R2, R2, #0
ADD.L	R2, R3, R2
LPMI.B	R1, R2, #0
; temp_2 start address is: 4 (R1)
;matrixrgb_firmware.c,1011 :: 		for( j = 0; j < 8; j++ )
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
L_scroll_text_right186:
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
JMPC	R30, C, #0, L_scroll_text_right187
;matrixrgb_firmware.c,1013 :: 		if( ( temp & 0x80 ) > 0x00 )
AND.L	R2, R5, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_right189
;matrixrgb_firmware.c,1014 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R10, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R8
JMP	L_scroll_text_right190
L_scroll_text_right189:
;matrixrgb_firmware.c,1016 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R10, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_right190:
;matrixrgb_firmware.c,1017 :: 		temp = ( temp << 1 );
BEXTU.L	R2, R5, #256
; temp end address is: 20 (R5)
ASHL.L	R2, R2, #1
; temp start address is: 20 (R5)
BEXTU.L	R5, R2, #256
;matrixrgb_firmware.c,1011 :: 		for( j = 0; j < 8; j++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #256
;matrixrgb_firmware.c,1018 :: 		}
; temp end address is: 20 (R5)
; j end address is: 16 (R4)
JMP	L_scroll_text_right186
L_scroll_text_right187:
;matrixrgb_firmware.c,1019 :: 		for( j = 8; j < 16; j++ )
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
L_scroll_text_right191:
; j start address is: 16 (R4)
; k start address is: 0 (R0)
; cnt start address is: 4 (R1)
; text_length start address is: 60 (R15)
; color_buffer start address is: 64 (R16)
; speed start address is: 56 (R14)
; ptr start address is: 68 (R17)
; temp_2 start address is: 20 (R5)
CMP.B	R4, #16
JMPC	R30, C, #0, L_scroll_text_right192
;matrixrgb_firmware.c,1021 :: 		if( ( temp_2 & 0x80 ) > 0x00 )
AND.L	R2, R5, #128
CMP.B	R2, #0
JMPC	R30, A, #0, L_scroll_text_right194
;matrixrgb_firmware.c,1022 :: 		text_frame[( k * 16 ) + j] = color_buffer;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R2, R2, R3
STI.B	R2, #0, R16
JMP	L_scroll_text_right195
L_scroll_text_right194:
;matrixrgb_firmware.c,1024 :: 		text_frame[( k * 16 ) + j] = 0x00;
BEXTU.L	R2, R0, #256
ASHL.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ADD.L	R3, R2, R4
BEXTS.L	R3, R3, #0
ADD.L	R2, SP, #0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
L_scroll_text_right195:
;matrixrgb_firmware.c,1025 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R2, R5, #256
; temp_2 end address is: 20 (R5)
ASHL.L	R2, R2, #1
; temp_2 start address is: 20 (R5)
BEXTU.L	R5, R2, #256
;matrixrgb_firmware.c,1019 :: 		for( j = 8; j < 16; j++ )
ADD.L	R4, R4, #1
BEXTU.L	R4, R4, #256
;matrixrgb_firmware.c,1026 :: 		}
; temp_2 end address is: 20 (R5)
; j end address is: 16 (R4)
JMP	L_scroll_text_right191
L_scroll_text_right192:
;matrixrgb_firmware.c,1027 :: 		cnt+= 2;
ADD.L	R2, R1, #2
BEXTU.L	R1, R2, #256
;matrixrgb_firmware.c,1007 :: 		for( k = 0; k < 16; k++ )
ADD.L	R2, R0, #1
; k end address is: 0 (R0)
; k start address is: 40 (R10)
BEXTU.L	R10, R2, #256
;matrixrgb_firmware.c,1028 :: 		}
; cnt end address is: 4 (R1)
; k end address is: 40 (R10)
BEXTU.L	R0, R1, #256
JMP	L_scroll_text_right183
L_scroll_text_right184:
;matrixrgb_firmware.c,1030 :: 		font_width = Dejavu18_Widths[ *ptr - 32 ];
LDI.B	R2, R17, #0
SUB.L	R3, R2, #32
BEXTS.L	R3, R3, #0
LDK.L	R2, #_Dejavu18_Widths+0
ADD.L	R2, R2, R3
LDI.B	R3, R2, #0
;matrixrgb_firmware.c,1031 :: 		shift_lett_onto_left( text_frame, font_width, speed );
ADD.L	R2, SP, #0
BEXTU.L	R1, R3, #256
MOVE.L	R0, R2
BEXTU.L	R2, R14, #0
CALL	_shift_lett_onto_left+0
;matrixrgb_firmware.c,1032 :: 		ptr--;
SUB.L	R17, R17, #1
;matrixrgb_firmware.c,1033 :: 		}
; text_length end address is: 60 (R15)
; color_buffer end address is: 64 (R16)
; speed end address is: 56 (R14)
; ptr end address is: 68 (R17)
BEXTU.L	R0, R15, #256
JMP	L_scroll_text_right181
L_scroll_text_right182:
;matrixrgb_firmware.c,1034 :: 		}
L_end_scroll_text_right:
UNLINK	LR
RETURN	
; end of _scroll_text_right
_shift_lett_onto_left:
;matrixrgb_firmware.c,1036 :: 		void shift_lett_onto_left( uint8_t *text_frame, uint8_t font_width, uint16_t speed )
; font_width start address is: 4 (R1)
LINK	LR, #12
STI.L	SP, #4, R0
BEXTU.L	R9, R1, #256
STI.S	SP, #8, R2
; font_width end address is: 4 (R1)
; font_width start address is: 36 (R9)
;matrixrgb_firmware.c,1039 :: 		uint16_t i = 0, j = 64;
;matrixrgb_firmware.c,1040 :: 		uint8_t difference = 16 - font_width;
LDK.L	R3, #16
SUB.L	R3, R3, R9
; difference start address is: 0 (R0)
BEXTU.L	R0, R3, #256
;matrixrgb_firmware.c,1042 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,1044 :: 		for( m = difference; m < ( 16 - font_width ) + font_width ; m++ )
; m start address is: 44 (R11)
BEXTU.L	R11, R0, #256
; difference end address is: 0 (R0)
; font_width end address is: 36 (R9)
; m end address is: 44 (R11)
L_shift_lett_onto_left196:
; m start address is: 44 (R11)
; font_width start address is: 36 (R9)
LDK.L	R3, #16
SUB.L	R3, R3, R9
BEXTS.L	R3, R3, #0
ADD.L	R3, R3, R9
CMP.S	R11, R3
JMPC	R30, GTE, #1, L_shift_lett_onto_left197
;matrixrgb_firmware.c,1046 :: 		for( k = 0; k < 16; k++ )
; k start address is: 48 (R12)
LDK.L	R12, #0
; font_width end address is: 36 (R9)
; k end address is: 48 (R12)
; m end address is: 44 (R11)
BEXTU.L	R8, R12, #256
L_shift_lett_onto_left199:
; k start address is: 32 (R8)
; font_width start address is: 36 (R9)
; m start address is: 44 (R11)
CMP.B	R8, #16
JMPC	R30, C, #0, L_shift_lett_onto_left200
;matrixrgb_firmware.c,1048 :: 		buffer = text_frame[k * 16 + ( 15 - m )];
BEXTU.L	R3, R8, #256
ASHL.L	R4, R3, #4
BEXTS.L	R4, R4, #0
LDK.L	R3, #15
SUB.L	R3, R3, R11
BEXTS.L	R3, R3, #0
ADD.L	R4, R4, R3
BEXTS.L	R4, R4, #0
LDI.L	R3, SP, #4
ADD.L	R3, R3, R4
LDI.B	R3, R3, #0
;matrixrgb_firmware.c,1049 :: 		red   = ( buffer & 0x04 );
AND.L	R5, R3, #4
;matrixrgb_firmware.c,1050 :: 		green = ( buffer & 0x02 );
AND.L	R4, R3, #2
;matrixrgb_firmware.c,1051 :: 		blue  = ( buffer & 0x01 );
AND.L	R3, R3, #1
;matrixrgb_firmware.c,1052 :: 		write_pixel( k, 0, red, green, blue );
STI.B	SP, #0, R4
BEXTU.L	R2, R5, #256
LDK.L	R1, #0
BEXTU.L	R0, R8, #256
BEXTU.L	R4, R3, #256
LDI.B	R3, SP, #0
CALL	_write_pixel+0
;matrixrgb_firmware.c,1046 :: 		for( k = 0; k < 16; k++ )
ADD.L	R3, R8, #1
; k end address is: 32 (R8)
; k start address is: 48 (R12)
BEXTU.L	R12, R3, #256
;matrixrgb_firmware.c,1053 :: 		}
; k end address is: 48 (R12)
BEXTU.L	R8, R12, #256
JMP	L_shift_lett_onto_left199
L_shift_lett_onto_left200:
;matrixrgb_firmware.c,1055 :: 		for( p = 0; p < speed; p++ )
; p start address is: 52 (R13)
LDK.L	R13, #0
; font_width end address is: 36 (R9)
; p end address is: 52 (R13)
; m end address is: 44 (R11)
BEXTU.L	R10, R9, #256
BEXTU.L	R12, R13, #256
L_shift_lett_onto_left202:
; p start address is: 48 (R12)
; m start address is: 44 (R11)
; font_width start address is: 40 (R10)
LDI.S	R3, SP, #8
CMP.S	R12, R3
JMPC	R30, C, #0, L_shift_lett_onto_left203
;matrixrgb_firmware.c,1056 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1055 :: 		for( p = 0; p < speed; p++ )
ADD.L	R3, R12, #1
; p end address is: 48 (R12)
; p start address is: 52 (R13)
BEXTU.L	R13, R3, #256
;matrixrgb_firmware.c,1056 :: 		refresh();
; p end address is: 52 (R13)
BEXTU.L	R12, R13, #256
JMP	L_shift_lett_onto_left202
L_shift_lett_onto_left203:
;matrixrgb_firmware.c,1058 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,1044 :: 		for( m = difference; m < ( 16 - font_width ) + font_width ; m++ )
ADD.L	R11, R11, #1
BEXTU.L	R11, R11, #256
;matrixrgb_firmware.c,1059 :: 		}
BEXTU.L	R9, R10, #256
; font_width end address is: 40 (R10)
; m end address is: 44 (R11)
JMP	L_shift_lett_onto_left196
L_shift_lett_onto_left197:
;matrixrgb_firmware.c,1060 :: 		}
L_end_shift_lett_onto_left:
UNLINK	LR
RETURN	
; end of _shift_lett_onto_left
_load_text:
;matrixrgb_firmware.c,1062 :: 		void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
; ptr start address is: 24 (R6)
; text start address is: 0 (R0)
;matrixrgb_firmware.c,1065 :: 		char *ptr = text;
;matrixrgb_firmware.c,1062 :: 		void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
;matrixrgb_firmware.c,1065 :: 		char *ptr = text;
;matrixrgb_firmware.c,1062 :: 		void load_text( char *text, uint8_t text_width, uint8_t text_height, color_t color )
; ptr end address is: 24 (R6)
; text end address is: 0 (R0)
; text start address is: 0 (R0)
;matrixrgb_firmware.c,1065 :: 		char *ptr = text;
; ptr start address is: 24 (R6)
MOVE.L	R6, R0
; text end address is: 0 (R0)
;matrixrgb_firmware.c,1069 :: 		uint8_t cnt = 0;
; cnt start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1070 :: 		uint8_t color_buffer = 0;
; color_buffer start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1072 :: 		if( ptr == NULL )
CMP.L	R6, #0
JMPC	R30, Z, #0, L_load_text205
; color_buffer end address is: 4 (R1)
; cnt end address is: 0 (R0)
; ptr end address is: 24 (R6)
;matrixrgb_firmware.c,1073 :: 		return;
JMP	L_end_load_text
L_load_text205:
;matrixrgb_firmware.c,1075 :: 		if( color.red  > 0 )
; ptr start address is: 24 (R6)
; cnt start address is: 0 (R0)
; color_buffer start address is: 4 (R1)
LDI.B	R3, SP, #4
CMP.B	R3, #0
JMPC	R30, A, #0, L__load_text345
;matrixrgb_firmware.c,1076 :: 		color_buffer |= 0x04;
OR.L	R1, R1, #4
BEXTU.L	R1, R1, #256
; color_buffer end address is: 4 (R1)
JMP	L_load_text206
L__load_text345:
;matrixrgb_firmware.c,1075 :: 		if( color.red  > 0 )
;matrixrgb_firmware.c,1076 :: 		color_buffer |= 0x04;
L_load_text206:
;matrixrgb_firmware.c,1077 :: 		if( color.green > 0 )
; color_buffer start address is: 4 (R1)
LDI.B	R3, SP, #5
CMP.B	R3, #0
JMPC	R30, A, #0, L__load_text346
;matrixrgb_firmware.c,1078 :: 		color_buffer |= 0x02;
OR.L	R1, R1, #2
BEXTU.L	R1, R1, #256
; color_buffer end address is: 4 (R1)
JMP	L_load_text207
L__load_text346:
;matrixrgb_firmware.c,1077 :: 		if( color.green > 0 )
;matrixrgb_firmware.c,1078 :: 		color_buffer |= 0x02;
L_load_text207:
;matrixrgb_firmware.c,1079 :: 		if( color.blue > 0 )
; color_buffer start address is: 4 (R1)
LDI.B	R3, SP, #6
CMP.B	R3, #0
JMPC	R30, A, #0, L__load_text347
;matrixrgb_firmware.c,1080 :: 		color_buffer |= 0x01;
OR.L	R3, R1, #1
BEXTU.L	R1, R3, #256
; color_buffer end address is: 4 (R1)
BEXTU.L	R7, R1, #256
JMP	L_load_text208
L__load_text347:
;matrixrgb_firmware.c,1079 :: 		if( color.blue > 0 )
BEXTU.L	R7, R1, #256
;matrixrgb_firmware.c,1080 :: 		color_buffer |= 0x01;
L_load_text208:
;matrixrgb_firmware.c,1082 :: 		for( k = 0; k < 16; k++ )
; color_buffer start address is: 28 (R7)
; k start address is: 32 (R8)
LDK.L	R8, #0
; cnt end address is: 0 (R0)
; color_buffer end address is: 28 (R7)
; ptr end address is: 24 (R6)
; k end address is: 32 (R8)
L_load_text209:
; k start address is: 32 (R8)
; color_buffer start address is: 28 (R7)
; cnt start address is: 0 (R0)
; ptr start address is: 24 (R6)
CMP.B	R8, #16
JMPC	R30, C, #0, L_load_text210
;matrixrgb_firmware.c,1084 :: 		temp = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + cnt ];
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
;matrixrgb_firmware.c,1085 :: 		temp_2 = Dejavu18_Bitmaps[ ( *ptr * 32 ) - ( 32 * 32 ) + ( cnt + 1 ) ];
ADD.L	R3, R0, #1
BEXTS.L	R3, R3, #0
ADD.L	R3, R5, R3
BEXTS.L	R3, R3, #0
ADD.L	R3, R4, R3
LPMI.B	R3, R3, #0
; temp_2 start address is: 12 (R3)
;matrixrgb_firmware.c,1086 :: 		for( j = 0; j < 8; j++ )
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
L_load_text212:
; j start address is: 8 (R2)
; temp_2 start address is: 4 (R1)
; temp start address is: 20 (R5)
; ptr start address is: 24 (R6)
; cnt start address is: 0 (R0)
; color_buffer start address is: 28 (R7)
; k start address is: 32 (R8)
CMP.B	R2, #8
JMPC	R30, C, #0, L_load_text213
;matrixrgb_firmware.c,1088 :: 		if( ( temp & 0x80 ) > 0 )
AND.L	R3, R5, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_load_text215
;matrixrgb_firmware.c,1089 :: 		FB[(k * 64) + j] = color_buffer;
BEXTU.L	R3, R8, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R3, R3, R4
STI.B	R3, #0, R7
JMP	L_load_text216
L_load_text215:
;matrixrgb_firmware.c,1091 :: 		FB[(k * 64) + j] = 0x00;
BEXTU.L	R3, R8, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R2
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_load_text216:
;matrixrgb_firmware.c,1092 :: 		temp = ( temp << 1 );
BEXTU.L	R3, R5, #256
; temp end address is: 20 (R5)
ASHL.L	R3, R3, #1
; temp start address is: 20 (R5)
BEXTU.L	R5, R3, #256
;matrixrgb_firmware.c,1086 :: 		for( j = 0; j < 8; j++ )
ADD.L	R2, R2, #1
BEXTU.L	R2, R2, #256
;matrixrgb_firmware.c,1093 :: 		}
; temp end address is: 20 (R5)
; j end address is: 8 (R2)
JMP	L_load_text212
L_load_text213:
;matrixrgb_firmware.c,1094 :: 		for( j = 8; j < 16; j++ )
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
L_load_text217:
; j start address is: 20 (R5)
; k start address is: 4 (R1)
; color_buffer start address is: 0 (R0)
; cnt start address is: 8 (R2)
; ptr start address is: 24 (R6)
; temp_2 start address is: 28 (R7)
CMP.B	R5, #16
JMPC	R30, C, #0, L_load_text218
;matrixrgb_firmware.c,1096 :: 		if( ( temp_2 & 0x80 ) > 0 )
AND.L	R3, R7, #128
CMP.B	R3, #0
JMPC	R30, A, #0, L_load_text220
;matrixrgb_firmware.c,1097 :: 		FB[(k * 64) + j] = color_buffer;
BEXTU.L	R3, R1, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R3, R3, R4
STI.B	R3, #0, R0
JMP	L_load_text221
L_load_text220:
;matrixrgb_firmware.c,1099 :: 		FB[(k * 64) + j] = 0x00;
BEXTU.L	R3, R1, #256
ASHL.L	R3, R3, #6
BEXTS.L	R3, R3, #0
ADD.L	R4, R3, R5
BEXTS.L	R4, R4, #0
LDA.L	R3, _FB+0
ADD.L	R4, R3, R4
LDK.L	R3, #0
STI.B	R4, #0, R3
L_load_text221:
;matrixrgb_firmware.c,1100 :: 		temp_2 = ( temp_2 << 1 );
BEXTU.L	R3, R7, #256
; temp_2 end address is: 28 (R7)
ASHL.L	R3, R3, #1
; temp_2 start address is: 28 (R7)
BEXTU.L	R7, R3, #256
;matrixrgb_firmware.c,1094 :: 		for( j = 8; j < 16; j++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1101 :: 		}
; temp_2 end address is: 28 (R7)
; j end address is: 20 (R5)
JMP	L_load_text217
L_load_text218:
;matrixrgb_firmware.c,1102 :: 		cnt+= 2;
ADD.L	R3, R2, #2
BEXTU.L	R2, R3, #256
;matrixrgb_firmware.c,1082 :: 		for( k = 0; k < 16; k++ )
ADD.L	R3, R1, #1
; k end address is: 4 (R1)
; k start address is: 32 (R8)
BEXTU.L	R8, R3, #256
;matrixrgb_firmware.c,1103 :: 		}
; color_buffer end address is: 0 (R0)
; ptr end address is: 24 (R6)
; cnt end address is: 8 (R2)
; k end address is: 32 (R8)
BEXTU.L	R7, R0, #256
BEXTU.L	R0, R2, #256
JMP	L_load_text209
L_load_text210:
;matrixrgb_firmware.c,1105 :: 		}
L_end_load_text:
RETURN	
; end of _load_text
_scroll_off_screen_left:
;matrixrgb_firmware.c,1107 :: 		void scroll_off_screen_left( uint16_t speed )
; speed start address is: 0 (R0)
BEXTU.L	R1, R0, #0
; speed end address is: 0 (R0)
; speed start address is: 4 (R1)
;matrixrgb_firmware.c,1111 :: 		for( i = 0; i < p_width; i++ )
; i start address is: 0 (R0)
LDK.L	R0, #0
; speed end address is: 4 (R1)
; i end address is: 0 (R0)
BEXTU.L	R9, R1, #0
BEXTU.L	R10, R0, #256
L_scroll_off_screen_left222:
; i start address is: 40 (R10)
; speed start address is: 36 (R9)
LDA.B	R1, _p_width+0
CMP.B	R10, R1
JMPC	R30, C, #0, L_scroll_off_screen_left223
;matrixrgb_firmware.c,1113 :: 		display_shift_left();
CALL	_display_shift_left+0
;matrixrgb_firmware.c,1114 :: 		for( p = 0; p < speed; p++ )
; p start address is: 44 (R11)
LDK.L	R11, #0
; speed end address is: 36 (R9)
; p end address is: 44 (R11)
; i end address is: 40 (R10)
L_scroll_off_screen_left225:
; p start address is: 44 (R11)
; speed start address is: 36 (R9)
; i start address is: 40 (R10)
CMP.S	R11, R9
JMPC	R30, C, #0, L_scroll_off_screen_left226
;matrixrgb_firmware.c,1115 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1114 :: 		for( p = 0; p < speed; p++ )
ADD.L	R11, R11, #1
BEXTU.L	R11, R11, #256
;matrixrgb_firmware.c,1115 :: 		refresh();
; p end address is: 44 (R11)
JMP	L_scroll_off_screen_left225
L_scroll_off_screen_left226:
;matrixrgb_firmware.c,1111 :: 		for( i = 0; i < p_width; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #256
;matrixrgb_firmware.c,1116 :: 		}
; speed end address is: 36 (R9)
; i end address is: 40 (R10)
JMP	L_scroll_off_screen_left222
L_scroll_off_screen_left223:
;matrixrgb_firmware.c,1117 :: 		}
L_end_scroll_off_screen_left:
RETURN	
; end of _scroll_off_screen_left
_scroll_off_screen_right:
;matrixrgb_firmware.c,1119 :: 		void scroll_off_screen_right( uint16_t speed )
; speed start address is: 0 (R0)
BEXTU.L	R1, R0, #0
; speed end address is: 0 (R0)
; speed start address is: 4 (R1)
;matrixrgb_firmware.c,1123 :: 		for( i = 0; i < p_width; i++ )
; i start address is: 0 (R0)
LDK.L	R0, #0
; speed end address is: 4 (R1)
; i end address is: 0 (R0)
BEXTU.L	R9, R1, #0
BEXTU.L	R10, R0, #256
L_scroll_off_screen_right228:
; i start address is: 40 (R10)
; speed start address is: 36 (R9)
LDA.B	R1, _p_width+0
CMP.B	R10, R1
JMPC	R30, C, #0, L_scroll_off_screen_right229
;matrixrgb_firmware.c,1125 :: 		display_shift_right();
CALL	_display_shift_right+0
;matrixrgb_firmware.c,1126 :: 		for( p = 0; p < speed; p++ )
; p start address is: 44 (R11)
LDK.L	R11, #0
; speed end address is: 36 (R9)
; p end address is: 44 (R11)
; i end address is: 40 (R10)
L_scroll_off_screen_right231:
; p start address is: 44 (R11)
; speed start address is: 36 (R9)
; i start address is: 40 (R10)
CMP.S	R11, R9
JMPC	R30, C, #0, L_scroll_off_screen_right232
;matrixrgb_firmware.c,1127 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1126 :: 		for( p = 0; p < speed; p++ )
ADD.L	R11, R11, #1
BEXTU.L	R11, R11, #256
;matrixrgb_firmware.c,1127 :: 		refresh();
; p end address is: 44 (R11)
JMP	L_scroll_off_screen_right231
L_scroll_off_screen_right232:
;matrixrgb_firmware.c,1123 :: 		for( i = 0; i < p_width; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #256
;matrixrgb_firmware.c,1128 :: 		}
; speed end address is: 36 (R9)
; i end address is: 40 (R10)
JMP	L_scroll_off_screen_right228
L_scroll_off_screen_right229:
;matrixrgb_firmware.c,1131 :: 		}
L_end_scroll_off_screen_right:
RETURN	
; end of _scroll_off_screen_right
_display_shift_left:
;matrixrgb_firmware.c,1132 :: 		void display_shift_left( void )
;matrixrgb_firmware.c,1134 :: 		uint8_t row          = 0;
;matrixrgb_firmware.c,1135 :: 		uint8_t column       = 0;
;matrixrgb_firmware.c,1136 :: 		uint8_t temp_col     = 0;
;matrixrgb_firmware.c,1137 :: 		uint8_t temp_col_2   = 0;
;matrixrgb_firmware.c,1138 :: 		uint8_t temp_row     = 0;
;matrixrgb_firmware.c,1139 :: 		uint8_t buffer       = 0;
;matrixrgb_firmware.c,1140 :: 		uint8_t incrementer  = 0;
;matrixrgb_firmware.c,1141 :: 		uint8_t starter      = 0;
;matrixrgb_firmware.c,1144 :: 		for( row = 0; row < p_height; row++ )
; row start address is: 20 (R5)
LDK.L	R5, #0
; row end address is: 20 (R5)
L_display_shift_left234:
; row start address is: 20 (R5)
LDA.B	R0, _p_height+0
CMP.B	R5, R0
JMPC	R30, C, #0, L_display_shift_left235
;matrixrgb_firmware.c,1146 :: 		for( column = 0; column <= ( p_width - 1 ); column++ )
; column start address is: 24 (R6)
LDK.L	R6, #0
; column end address is: 24 (R6)
; row end address is: 20 (R5)
L_display_shift_left237:
; column start address is: 24 (R6)
; row start address is: 20 (R5)
LDA.B	R0, _p_width+0
SUB.L	R0, R0, #1
CMP.S	R6, R0
JMPC	R30, GT, #1, L_display_shift_left238
;matrixrgb_firmware.c,1149 :: 		temp_col   = column;
; temp_col start address is: 12 (R3)
BEXTU.L	R3, R6, #256
;matrixrgb_firmware.c,1150 :: 		temp_col_2 = column + 1;
ADD.L	R0, R6, #1
; temp_col_2 start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,1151 :: 		if( row == 0 )
CMP.B	R5, #0
JMPC	R30, Z, #0, L_display_shift_left240
;matrixrgb_firmware.c,1153 :: 		starter = 0;
; starter start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,1154 :: 		incrementer = 0;
; incrementer start address is: 28 (R7)
LDK.L	R7, #0
;matrixrgb_firmware.c,1155 :: 		}
; incrementer end address is: 28 (R7)
; starter end address is: 32 (R8)
JMP	L_display_shift_left241
L_display_shift_left240:
;matrixrgb_firmware.c,1158 :: 		starter = row % 16;
AND.L	R8, R5, #15
BEXTU.L	R8, R8, #256
; starter start address is: 32 (R8)
;matrixrgb_firmware.c,1159 :: 		incrementer = ( row / 16 ) * 32;
BEXTU.L	R0, R5, #256
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 28 (R7)
BEXTU.L	R7, R0, #256
; incrementer end address is: 28 (R7)
; starter end address is: 32 (R8)
;matrixrgb_firmware.c,1160 :: 		}
L_display_shift_left241:
;matrixrgb_firmware.c,1161 :: 		temp_col+= ( temp_col / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; incrementer start address is: 28 (R7)
; starter start address is: 32 (R8)
BEXTU.L	R0, R3, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R1, R3, R0
BEXTS.L	R1, R1, #0
; temp_col end address is: 12 (R3)
;matrixrgb_firmware.c,1162 :: 		temp_col_2+= ( temp_col_2 / 32 ) * 32;
BEXTU.L	R0, R2, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R4, R2, R0
BEXTS.L	R4, R4, #0
; temp_col_2 end address is: 8 (R2)
;matrixrgb_firmware.c,1163 :: 		FB[ incrementer + ( starter *  shift_reg ) + temp_col] = FB[ incrementer + ( starter *  shift_reg ) + temp_col_2];
LDA.L	R0, _shift_reg+0
MUL.L	R0, R8, R0
; starter end address is: 32 (R8)
ADD.L	R3, R7, R0
; incrementer end address is: 28 (R7)
BEXTU.L	R0, R1, #256
ADD.L	R0, R3, R0
LDA.L	R2, _FB+0
ADD.L	R1, R2, R0
BEXTU.L	R0, R4, #256
ADD.L	R0, R3, R0
ADD.L	R0, R2, R0
LDI.B	R0, R0, #0
STI.B	R1, #0, R0
;matrixrgb_firmware.c,1146 :: 		for( column = 0; column <= ( p_width - 1 ); column++ )
ADD.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,1164 :: 		}
; column end address is: 24 (R6)
JMP	L_display_shift_left237
L_display_shift_left238:
;matrixrgb_firmware.c,1165 :: 		erase_pixel( row, ( p_width - 1 ) );
LDA.B	R0, _p_width+0
SUB.L	R0, R0, #1
BEXTS.L	R1, R0, #0
BEXTU.L	R0, R5, #256
CALL	_erase_pixel+0
;matrixrgb_firmware.c,1144 :: 		for( row = 0; row < p_height; row++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1166 :: 		}
; row end address is: 20 (R5)
JMP	L_display_shift_left234
L_display_shift_left235:
;matrixrgb_firmware.c,1168 :: 		}
L_end_display_shift_left:
RETURN	
; end of _display_shift_left
_display_shift_right:
;matrixrgb_firmware.c,1169 :: 		void display_shift_right( void )
;matrixrgb_firmware.c,1171 :: 		uint8_t row          = 0;
;matrixrgb_firmware.c,1172 :: 		uint8_t column       = 0;
;matrixrgb_firmware.c,1173 :: 		uint8_t temp_col     = 0;
;matrixrgb_firmware.c,1174 :: 		uint8_t temp_col_2   = 0;
;matrixrgb_firmware.c,1175 :: 		uint8_t temp_row     = 0;
;matrixrgb_firmware.c,1176 :: 		uint8_t buffer       = 0;
;matrixrgb_firmware.c,1177 :: 		uint8_t incrementer  = 0;
;matrixrgb_firmware.c,1178 :: 		uint8_t starter      = 0;
;matrixrgb_firmware.c,1181 :: 		for( row = 0; row < p_height; row++ )
; row start address is: 20 (R5)
LDK.L	R5, #0
; row end address is: 20 (R5)
L_display_shift_right242:
; row start address is: 20 (R5)
LDA.B	R0, _p_height+0
CMP.B	R5, R0
JMPC	R30, C, #0, L_display_shift_right243
;matrixrgb_firmware.c,1183 :: 		for( column = ( p_width - 1 ); column > 0; column-- )
LDA.B	R0, _p_width+0
SUB.L	R0, R0, #1
; column start address is: 24 (R6)
BEXTU.L	R6, R0, #256
; column end address is: 24 (R6)
; row end address is: 20 (R5)
L_display_shift_right245:
; column start address is: 24 (R6)
; row start address is: 20 (R5)
CMP.B	R6, #0
JMPC	R30, A, #0, L_display_shift_right246
;matrixrgb_firmware.c,1186 :: 		temp_col   = column;
; temp_col start address is: 12 (R3)
BEXTU.L	R3, R6, #256
;matrixrgb_firmware.c,1187 :: 		temp_col_2 = column - 1;
SUB.L	R0, R6, #1
; temp_col_2 start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,1188 :: 		if( row == 0 )
CMP.B	R5, #0
JMPC	R30, Z, #0, L_display_shift_right248
;matrixrgb_firmware.c,1190 :: 		starter = 0;
; starter start address is: 32 (R8)
LDK.L	R8, #0
;matrixrgb_firmware.c,1191 :: 		incrementer = 0;
; incrementer start address is: 28 (R7)
LDK.L	R7, #0
;matrixrgb_firmware.c,1192 :: 		}
; incrementer end address is: 28 (R7)
; starter end address is: 32 (R8)
JMP	L_display_shift_right249
L_display_shift_right248:
;matrixrgb_firmware.c,1195 :: 		starter = row % 16;
AND.L	R8, R5, #15
BEXTU.L	R8, R8, #256
; starter start address is: 32 (R8)
;matrixrgb_firmware.c,1196 :: 		incrementer = ( row / 16 ) * 32;
BEXTU.L	R0, R5, #256
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 28 (R7)
BEXTU.L	R7, R0, #256
; incrementer end address is: 28 (R7)
; starter end address is: 32 (R8)
;matrixrgb_firmware.c,1197 :: 		}
L_display_shift_right249:
;matrixrgb_firmware.c,1198 :: 		temp_col+= ( temp_col / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; incrementer start address is: 28 (R7)
; starter start address is: 32 (R8)
BEXTU.L	R0, R3, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R1, R3, R0
BEXTS.L	R1, R1, #0
; temp_col end address is: 12 (R3)
;matrixrgb_firmware.c,1199 :: 		temp_col_2+= ( temp_col_2 / 32 ) * 32;
BEXTU.L	R0, R2, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R4, R2, R0
BEXTS.L	R4, R4, #0
; temp_col_2 end address is: 8 (R2)
;matrixrgb_firmware.c,1200 :: 		FB[ incrementer + ( starter *  shift_reg ) + temp_col] = FB[ incrementer + ( starter *  shift_reg ) + temp_col_2];
LDA.L	R0, _shift_reg+0
MUL.L	R0, R8, R0
; starter end address is: 32 (R8)
ADD.L	R3, R7, R0
; incrementer end address is: 28 (R7)
BEXTU.L	R0, R1, #256
ADD.L	R0, R3, R0
LDA.L	R2, _FB+0
ADD.L	R1, R2, R0
BEXTU.L	R0, R4, #256
ADD.L	R0, R3, R0
ADD.L	R0, R2, R0
LDI.B	R0, R0, #0
STI.B	R1, #0, R0
;matrixrgb_firmware.c,1183 :: 		for( column = ( p_width - 1 ); column > 0; column-- )
SUB.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,1201 :: 		}
; column end address is: 24 (R6)
JMP	L_display_shift_right245
L_display_shift_right246:
;matrixrgb_firmware.c,1202 :: 		erase_pixel( row, 0 );
LDK.L	R1, #0
BEXTU.L	R0, R5, #256
CALL	_erase_pixel+0
;matrixrgb_firmware.c,1181 :: 		for( row = 0; row < p_height; row++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1203 :: 		}
; row end address is: 20 (R5)
JMP	L_display_shift_right242
L_display_shift_right243:
;matrixrgb_firmware.c,1205 :: 		}
L_end_display_shift_right:
RETURN	
; end of _display_shift_right
_display_shift_up:
;matrixrgb_firmware.c,1207 :: 		void display_shift_up( void )
LINK	LR, #4
;matrixrgb_firmware.c,1209 :: 		uint8_t row          = 0;
;matrixrgb_firmware.c,1210 :: 		uint8_t column       = 0;
;matrixrgb_firmware.c,1211 :: 		uint8_t temp_col     = 0;
;matrixrgb_firmware.c,1212 :: 		uint8_t temp_row     = 0;
;matrixrgb_firmware.c,1213 :: 		uint8_t buffer       = 0;
;matrixrgb_firmware.c,1214 :: 		uint8_t incrementer  = 0;
;matrixrgb_firmware.c,1215 :: 		uint8_t starter      = 0;
;matrixrgb_firmware.c,1218 :: 		for( row = 0; row < p_height; row++ )
; row start address is: 20 (R5)
LDK.L	R5, #0
; row end address is: 20 (R5)
L_display_shift_up250:
; row start address is: 20 (R5)
LDA.B	R0, _p_height+0
CMP.B	R5, R0
JMPC	R30, C, #0, L_display_shift_up251
;matrixrgb_firmware.c,1220 :: 		for( column = ( p_width - 1 ); column > 0; column-- )
LDA.B	R0, _p_width+0
SUB.L	R0, R0, #1
; column start address is: 24 (R6)
BEXTU.L	R6, R0, #256
; column end address is: 24 (R6)
; row end address is: 20 (R5)
L_display_shift_up253:
; column start address is: 24 (R6)
; row start address is: 20 (R5)
CMP.B	R6, #0
JMPC	R30, A, #0, L_display_shift_up254
;matrixrgb_firmware.c,1222 :: 		if( row == ( p_height - 1 ) )
LDA.B	R0, _p_height+0
SUB.L	R0, R0, #1
CMP.S	R5, R0
JMPC	R30, Z, #0, L_display_shift_up256
;matrixrgb_firmware.c,1223 :: 		erase_pixel( row, column );
BEXTU.L	R1, R6, #256
BEXTU.L	R0, R5, #256
CALL	_erase_pixel+0
JMP	L_display_shift_up257
L_display_shift_up256:
;matrixrgb_firmware.c,1227 :: 		temp_col   = column;
; temp_col start address is: 4 (R1)
BEXTU.L	R1, R6, #256
;matrixrgb_firmware.c,1228 :: 		temp_row   = row + 1;
ADD.L	R0, R5, #1
; temp_row start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,1229 :: 		if( temp_row == 0 )
BEXTU.L	R0, R0, #256
CMP.B	R0, #0
JMPC	R30, Z, #0, L_display_shift_up258
; temp_row end address is: 8 (R2)
;matrixrgb_firmware.c,1231 :: 		starter = 0;
; starter start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1232 :: 		incrementer = 0;
; incrementer start address is: 12 (R3)
LDK.L	R3, #0
;matrixrgb_firmware.c,1233 :: 		}
; incrementer end address is: 12 (R3)
; starter end address is: 16 (R4)
JMP	L_display_shift_up259
L_display_shift_up258:
;matrixrgb_firmware.c,1236 :: 		starter = temp_row % 16;
; temp_row start address is: 8 (R2)
AND.L	R4, R2, #15
BEXTU.L	R4, R4, #256
; starter start address is: 16 (R4)
;matrixrgb_firmware.c,1237 :: 		incrementer = ( temp_row / 16 ) * 32;
BEXTU.L	R0, R2, #256
; temp_row end address is: 8 (R2)
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 12 (R3)
BEXTU.L	R3, R0, #256
; incrementer end address is: 12 (R3)
; starter end address is: 16 (R4)
;matrixrgb_firmware.c,1238 :: 		}
L_display_shift_up259:
;matrixrgb_firmware.c,1239 :: 		if( temp_col == 0 )
; incrementer start address is: 12 (R3)
; starter start address is: 16 (R4)
CMP.B	R1, #0
JMPC	R30, Z, #0, L_display_shift_up260
;matrixrgb_firmware.c,1240 :: 		temp_col += 0;
BEXTU.L	R0, R1, #256
; temp_col end address is: 4 (R1)
; temp_col start address is: 8 (R2)
BEXTU.L	R2, R0, #256
; temp_col end address is: 8 (R2)
JMP	L_display_shift_up261
L_display_shift_up260:
;matrixrgb_firmware.c,1242 :: 		temp_col+= ( temp_col / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; temp_col start address is: 4 (R1)
BEXTU.L	R0, R1, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R0, R1, R0
; temp_col end address is: 4 (R1)
; temp_col start address is: 8 (R2)
BEXTU.L	R2, R0, #256
; temp_col end address is: 8 (R2)
L_display_shift_up261:
;matrixrgb_firmware.c,1243 :: 		buffer = FB[ incrementer + ( starter *  shift_reg ) + temp_col];
; temp_col start address is: 8 (R2)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R4, R0
; starter end address is: 16 (R4)
ADD.L	R0, R3, R0
; incrementer end address is: 12 (R3)
ADD.L	R1, R0, R2
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
LDI.B	R3, R0, #0
; buffer start address is: 12 (R3)
;matrixrgb_firmware.c,1245 :: 		if( row == 0 )
CMP.B	R5, #0
JMPC	R30, Z, #0, L_display_shift_up262
;matrixrgb_firmware.c,1247 :: 		starter = 0;
; starter start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1248 :: 		incrementer = 0;
; incrementer start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1249 :: 		}
; incrementer end address is: 4 (R1)
; starter end address is: 16 (R4)
JMP	L_display_shift_up263
L_display_shift_up262:
;matrixrgb_firmware.c,1252 :: 		starter = row % 16;
AND.L	R1, R5, #15
BEXTU.L	R1, R1, #256
; starter start address is: 4 (R1)
;matrixrgb_firmware.c,1253 :: 		incrementer = ( row / 16 ) * 32;
BEXTU.L	R0, R5, #256
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 16 (R4)
BEXTU.L	R4, R0, #256
; starter end address is: 4 (R1)
; incrementer end address is: 16 (R4)
STI.B	SP, #0, R4
BEXTU.L	R4, R1, #256
LDI.B	R1, SP, #0
;matrixrgb_firmware.c,1254 :: 		}
L_display_shift_up263:
;matrixrgb_firmware.c,1255 :: 		FB[ incrementer + ( starter *  shift_reg ) + temp_col] = buffer;
; incrementer start address is: 4 (R1)
; starter start address is: 16 (R4)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R4, R0
; starter end address is: 16 (R4)
ADD.L	R0, R1, R0
; incrementer end address is: 4 (R1)
ADD.L	R1, R0, R2
; temp_col end address is: 8 (R2)
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R3
; buffer end address is: 12 (R3)
;matrixrgb_firmware.c,1256 :: 		}
L_display_shift_up257:
;matrixrgb_firmware.c,1220 :: 		for( column = ( p_width - 1 ); column > 0; column-- )
SUB.L	R6, R6, #1
BEXTU.L	R6, R6, #256
;matrixrgb_firmware.c,1257 :: 		}
; column end address is: 24 (R6)
JMP	L_display_shift_up253
L_display_shift_up254:
;matrixrgb_firmware.c,1259 :: 		temp_col   = 0;
; temp_col start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1260 :: 		temp_row   = row + 1;
ADD.L	R0, R5, #1
; temp_row start address is: 8 (R2)
BEXTU.L	R2, R0, #256
;matrixrgb_firmware.c,1261 :: 		if( temp_row == 0 )
BEXTU.L	R0, R0, #256
CMP.B	R0, #0
JMPC	R30, Z, #0, L_display_shift_up264
; temp_row end address is: 8 (R2)
;matrixrgb_firmware.c,1263 :: 		starter = 0;
; starter start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1264 :: 		incrementer = 0;
; incrementer start address is: 12 (R3)
LDK.L	R3, #0
;matrixrgb_firmware.c,1265 :: 		}
; incrementer end address is: 12 (R3)
; starter end address is: 16 (R4)
JMP	L_display_shift_up265
L_display_shift_up264:
;matrixrgb_firmware.c,1268 :: 		starter = temp_row % 16;
; temp_row start address is: 8 (R2)
AND.L	R4, R2, #15
BEXTU.L	R4, R4, #256
; starter start address is: 16 (R4)
;matrixrgb_firmware.c,1269 :: 		incrementer = ( temp_row / 16 ) * 32;
BEXTU.L	R0, R2, #256
; temp_row end address is: 8 (R2)
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 12 (R3)
BEXTU.L	R3, R0, #256
; incrementer end address is: 12 (R3)
; starter end address is: 16 (R4)
;matrixrgb_firmware.c,1270 :: 		}
L_display_shift_up265:
;matrixrgb_firmware.c,1271 :: 		if( temp_col == 0 )
; incrementer start address is: 12 (R3)
; starter start address is: 16 (R4)
CMP.B	R1, #0
JMPC	R30, Z, #0, L_display_shift_up266
;matrixrgb_firmware.c,1272 :: 		temp_col += 0;
BEXTU.L	R0, R1, #256
; temp_col end address is: 4 (R1)
; temp_col start address is: 8 (R2)
BEXTU.L	R2, R0, #256
; temp_col end address is: 8 (R2)
JMP	L_display_shift_up267
L_display_shift_up266:
;matrixrgb_firmware.c,1274 :: 		temp_col+= ( temp_col / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; temp_col start address is: 4 (R1)
BEXTU.L	R0, R1, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R0, R1, R0
; temp_col end address is: 4 (R1)
; temp_col start address is: 8 (R2)
BEXTU.L	R2, R0, #256
; temp_col end address is: 8 (R2)
L_display_shift_up267:
;matrixrgb_firmware.c,1275 :: 		buffer = FB[ incrementer + ( starter *  shift_reg ) + temp_col];
; temp_col start address is: 8 (R2)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R4, R0
; starter end address is: 16 (R4)
ADD.L	R0, R3, R0
; incrementer end address is: 12 (R3)
ADD.L	R1, R0, R2
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
LDI.B	R0, R0, #0
; buffer start address is: 12 (R3)
BEXTU.L	R3, R0, #256
;matrixrgb_firmware.c,1277 :: 		if( row == 0 )
CMP.B	R5, #0
JMPC	R30, Z, #0, L_display_shift_up268
;matrixrgb_firmware.c,1279 :: 		starter = 0;
; starter start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1280 :: 		incrementer = 0;
; incrementer start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1281 :: 		}
; incrementer end address is: 4 (R1)
; starter end address is: 16 (R4)
JMP	L_display_shift_up269
L_display_shift_up268:
;matrixrgb_firmware.c,1284 :: 		starter = row % 16;
AND.L	R0, R5, #15
; starter start address is: 4 (R1)
BEXTU.L	R1, R0, #256
;matrixrgb_firmware.c,1285 :: 		incrementer = ( row / 16 ) * 32;
BEXTU.L	R0, R5, #256
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 16 (R4)
BEXTU.L	R4, R0, #256
; starter end address is: 4 (R1)
; incrementer end address is: 16 (R4)
STI.B	SP, #0, R4
BEXTU.L	R4, R1, #256
LDI.B	R1, SP, #0
;matrixrgb_firmware.c,1286 :: 		}
L_display_shift_up269:
;matrixrgb_firmware.c,1287 :: 		FB[ incrementer + ( starter *  shift_reg ) + temp_col] = buffer;
; incrementer start address is: 4 (R1)
; starter start address is: 16 (R4)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R4, R0
; starter end address is: 16 (R4)
ADD.L	R0, R1, R0
; incrementer end address is: 4 (R1)
ADD.L	R1, R0, R2
; temp_col end address is: 8 (R2)
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R3
; buffer end address is: 12 (R3)
;matrixrgb_firmware.c,1218 :: 		for( row = 0; row < p_height; row++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1288 :: 		}
; row end address is: 20 (R5)
JMP	L_display_shift_up250
L_display_shift_up251:
;matrixrgb_firmware.c,1290 :: 		}
L_end_display_shift_up:
UNLINK	LR
RETURN	
; end of _display_shift_up
_display_shift_down:
;matrixrgb_firmware.c,1292 :: 		void display_shift_down( void )
LINK	LR, #4
;matrixrgb_firmware.c,1294 :: 		uint8_t i            = 0;
;matrixrgb_firmware.c,1295 :: 		uint8_t row          = 0;
;matrixrgb_firmware.c,1296 :: 		uint8_t column       = 0;
;matrixrgb_firmware.c,1297 :: 		uint8_t temp_col     = 0;
;matrixrgb_firmware.c,1298 :: 		uint8_t temp_row     = 0;
;matrixrgb_firmware.c,1299 :: 		uint8_t buffer       = 0;
;matrixrgb_firmware.c,1300 :: 		uint8_t incrementer  = 0;
;matrixrgb_firmware.c,1301 :: 		uint8_t starter      = 0;
;matrixrgb_firmware.c,1304 :: 		for( row = ( p_height - 1 ); row > 0; row-- )
LDA.B	R0, _p_height+0
SUB.L	R0, R0, #1
; row start address is: 8 (R2)
BEXTU.L	R2, R0, #256
; row end address is: 8 (R2)
L_display_shift_down270:
; row start address is: 8 (R2)
CMP.B	R2, #0
JMPC	R30, A, #0, L_display_shift_down271
;matrixrgb_firmware.c,1306 :: 		for( column = ( p_width - 1 ); column > 0; column-- )
LDA.B	R0, _p_width+0
SUB.L	R0, R0, #1
; column start address is: 12 (R3)
BEXTU.L	R3, R0, #256
; column end address is: 12 (R3)
; row end address is: 8 (R2)
L_display_shift_down273:
; column start address is: 12 (R3)
; row start address is: 8 (R2)
CMP.B	R3, #0
JMPC	R30, A, #0, L_display_shift_down274
;matrixrgb_firmware.c,1313 :: 		temp_col   = column;
; temp_col start address is: 4 (R1)
BEXTU.L	R1, R3, #256
;matrixrgb_firmware.c,1314 :: 		temp_row   = row - 1;
SUB.L	R0, R2, #1
; temp_row start address is: 16 (R4)
BEXTU.L	R4, R0, #256
;matrixrgb_firmware.c,1315 :: 		if( temp_row == 0 )
BEXTU.L	R0, R0, #256
CMP.B	R0, #0
JMPC	R30, Z, #0, L_display_shift_down276
; temp_row end address is: 16 (R4)
;matrixrgb_firmware.c,1317 :: 		starter = 0;
; starter start address is: 24 (R6)
LDK.L	R6, #0
;matrixrgb_firmware.c,1318 :: 		incrementer = 0;
; incrementer start address is: 20 (R5)
LDK.L	R5, #0
;matrixrgb_firmware.c,1319 :: 		}
; starter end address is: 24 (R6)
; incrementer end address is: 20 (R5)
JMP	L_display_shift_down277
L_display_shift_down276:
;matrixrgb_firmware.c,1322 :: 		starter = temp_row % 16;
; temp_row start address is: 16 (R4)
AND.L	R6, R4, #15
BEXTU.L	R6, R6, #256
; starter start address is: 24 (R6)
;matrixrgb_firmware.c,1323 :: 		incrementer = ( temp_row / 16 ) * 32;
BEXTU.L	R0, R4, #256
; temp_row end address is: 16 (R4)
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 20 (R5)
BEXTU.L	R5, R0, #256
; starter end address is: 24 (R6)
; incrementer end address is: 20 (R5)
;matrixrgb_firmware.c,1324 :: 		}
L_display_shift_down277:
;matrixrgb_firmware.c,1325 :: 		if( temp_col == 0 )
; incrementer start address is: 20 (R5)
; starter start address is: 24 (R6)
CMP.B	R1, #0
JMPC	R30, Z, #0, L_display_shift_down278
;matrixrgb_firmware.c,1326 :: 		temp_col += 0;
BEXTU.L	R0, R1, #256
; temp_col end address is: 4 (R1)
; temp_col start address is: 16 (R4)
BEXTU.L	R4, R0, #256
; temp_col end address is: 16 (R4)
JMP	L_display_shift_down279
L_display_shift_down278:
;matrixrgb_firmware.c,1328 :: 		temp_col+= ( temp_col / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; temp_col start address is: 4 (R1)
BEXTU.L	R0, R1, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R0, R1, R0
; temp_col end address is: 4 (R1)
; temp_col start address is: 16 (R4)
BEXTU.L	R4, R0, #256
; temp_col end address is: 16 (R4)
L_display_shift_down279:
;matrixrgb_firmware.c,1329 :: 		buffer = FB[ incrementer + ( starter *  shift_reg ) + temp_col];
; temp_col start address is: 16 (R4)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R6, R0
; starter end address is: 24 (R6)
ADD.L	R0, R5, R0
; incrementer end address is: 20 (R5)
ADD.L	R1, R0, R4
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
LDI.B	R0, R0, #0
; buffer start address is: 20 (R5)
BEXTU.L	R5, R0, #256
;matrixrgb_firmware.c,1331 :: 		if( row == 0 )
CMP.B	R2, #0
JMPC	R30, Z, #0, L_display_shift_down280
;matrixrgb_firmware.c,1333 :: 		starter = 0;
; starter start address is: 24 (R6)
LDK.L	R6, #0
;matrixrgb_firmware.c,1334 :: 		incrementer = 0;
; incrementer start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1335 :: 		}
; starter end address is: 24 (R6)
; incrementer end address is: 4 (R1)
JMP	L_display_shift_down281
L_display_shift_down280:
;matrixrgb_firmware.c,1338 :: 		starter = row % 16;
AND.L	R1, R2, #15
BEXTU.L	R1, R1, #256
; starter start address is: 4 (R1)
;matrixrgb_firmware.c,1339 :: 		incrementer = ( row / 16 ) * 32;
BEXTU.L	R0, R2, #256
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 24 (R6)
BEXTU.L	R6, R0, #256
; incrementer end address is: 24 (R6)
; starter end address is: 4 (R1)
STI.B	SP, #0, R6
BEXTU.L	R6, R1, #256
LDI.B	R1, SP, #0
;matrixrgb_firmware.c,1340 :: 		}
L_display_shift_down281:
;matrixrgb_firmware.c,1341 :: 		FB[ incrementer + ( starter *  shift_reg ) + temp_col] = buffer;
; incrementer start address is: 4 (R1)
; starter start address is: 24 (R6)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R6, R0
; starter end address is: 24 (R6)
ADD.L	R0, R1, R0
; incrementer end address is: 4 (R1)
ADD.L	R1, R0, R4
; temp_col end address is: 16 (R4)
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R5
; buffer end address is: 20 (R5)
;matrixrgb_firmware.c,1306 :: 		for( column = ( p_width - 1 ); column > 0; column-- )
SUB.L	R3, R3, #1
BEXTU.L	R3, R3, #256
;matrixrgb_firmware.c,1343 :: 		}
; column end address is: 12 (R3)
JMP	L_display_shift_down273
L_display_shift_down274:
;matrixrgb_firmware.c,1345 :: 		temp_col   = 0;
; temp_col start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1346 :: 		temp_row   = row - 1;
SUB.L	R0, R2, #1
; temp_row start address is: 12 (R3)
BEXTU.L	R3, R0, #256
;matrixrgb_firmware.c,1347 :: 		if( temp_row == 0 )
BEXTU.L	R0, R0, #256
CMP.B	R0, #0
JMPC	R30, Z, #0, L_display_shift_down282
; temp_row end address is: 12 (R3)
;matrixrgb_firmware.c,1349 :: 		starter = 0;
; starter start address is: 20 (R5)
LDK.L	R5, #0
;matrixrgb_firmware.c,1350 :: 		incrementer = 0;
; incrementer start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1351 :: 		}
; incrementer end address is: 16 (R4)
; starter end address is: 20 (R5)
JMP	L_display_shift_down283
L_display_shift_down282:
;matrixrgb_firmware.c,1354 :: 		starter = temp_row % 16;
; temp_row start address is: 12 (R3)
AND.L	R5, R3, #15
BEXTU.L	R5, R5, #256
; starter start address is: 20 (R5)
;matrixrgb_firmware.c,1355 :: 		incrementer = ( temp_row / 16 ) * 32;
BEXTU.L	R0, R3, #256
; temp_row end address is: 12 (R3)
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 16 (R4)
BEXTU.L	R4, R0, #256
; incrementer end address is: 16 (R4)
; starter end address is: 20 (R5)
;matrixrgb_firmware.c,1356 :: 		}
L_display_shift_down283:
;matrixrgb_firmware.c,1357 :: 		if( temp_col == 0 )
; incrementer start address is: 16 (R4)
; starter start address is: 20 (R5)
CMP.B	R1, #0
JMPC	R30, Z, #0, L_display_shift_down284
;matrixrgb_firmware.c,1358 :: 		temp_col += 0;
BEXTU.L	R0, R1, #256
; temp_col end address is: 4 (R1)
; temp_col start address is: 12 (R3)
BEXTU.L	R3, R0, #256
; temp_col end address is: 12 (R3)
JMP	L_display_shift_down285
L_display_shift_down284:
;matrixrgb_firmware.c,1360 :: 		temp_col+= ( temp_col / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; temp_col start address is: 4 (R1)
BEXTU.L	R0, R1, #256
LSHR.L	R0, R0, #5
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
BEXTS.L	R0, R0, #0
ADD.L	R0, R1, R0
; temp_col end address is: 4 (R1)
; temp_col start address is: 12 (R3)
BEXTU.L	R3, R0, #256
; temp_col end address is: 12 (R3)
L_display_shift_down285:
;matrixrgb_firmware.c,1361 :: 		buffer = FB[ incrementer + ( starter *  shift_reg ) + temp_col];
; temp_col start address is: 12 (R3)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R5, R0
; starter end address is: 20 (R5)
ADD.L	R0, R4, R0
; incrementer end address is: 16 (R4)
ADD.L	R1, R0, R3
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
LDI.B	R0, R0, #0
; buffer start address is: 16 (R4)
BEXTU.L	R4, R0, #256
;matrixrgb_firmware.c,1363 :: 		if( row == 0 )
CMP.B	R2, #0
JMPC	R30, Z, #0, L_display_shift_down286
;matrixrgb_firmware.c,1365 :: 		starter = 0;
; starter start address is: 20 (R5)
LDK.L	R5, #0
;matrixrgb_firmware.c,1366 :: 		incrementer = 0;
; incrementer start address is: 4 (R1)
LDK.L	R1, #0
;matrixrgb_firmware.c,1367 :: 		}
; incrementer end address is: 4 (R1)
; starter end address is: 20 (R5)
JMP	L_display_shift_down287
L_display_shift_down286:
;matrixrgb_firmware.c,1370 :: 		starter = row % 16;
AND.L	R0, R2, #15
; starter start address is: 4 (R1)
BEXTU.L	R1, R0, #256
;matrixrgb_firmware.c,1371 :: 		incrementer = ( row / 16 ) * 32;
BEXTU.L	R0, R2, #256
LSHR.L	R0, R0, #4
BEXTU.L	R0, R0, #256
ASHL.L	R0, R0, #5
; incrementer start address is: 20 (R5)
BEXTU.L	R5, R0, #256
; starter end address is: 4 (R1)
; incrementer end address is: 20 (R5)
STI.B	SP, #0, R5
BEXTU.L	R5, R1, #256
LDI.B	R1, SP, #0
;matrixrgb_firmware.c,1372 :: 		}
L_display_shift_down287:
;matrixrgb_firmware.c,1373 :: 		FB[ incrementer + ( starter *  shift_reg ) + temp_col] = buffer;
; incrementer start address is: 4 (R1)
; starter start address is: 20 (R5)
LDA.L	R0, _shift_reg+0
MUL.L	R0, R5, R0
; starter end address is: 20 (R5)
ADD.L	R0, R1, R0
; incrementer end address is: 4 (R1)
ADD.L	R1, R0, R3
; temp_col end address is: 12 (R3)
LDA.L	R0, _FB+0
ADD.L	R0, R0, R1
STI.B	R0, #0, R4
; buffer end address is: 16 (R4)
;matrixrgb_firmware.c,1304 :: 		for( row = ( p_height - 1 ); row > 0; row-- )
SUB.L	R2, R2, #1
BEXTU.L	R2, R2, #256
;matrixrgb_firmware.c,1374 :: 		}
; row end address is: 8 (R2)
JMP	L_display_shift_down270
L_display_shift_down271:
;matrixrgb_firmware.c,1375 :: 		for( i = 0; i < p_width; i++ )
; i start address is: 20 (R5)
LDK.L	R5, #0
; i end address is: 20 (R5)
L_display_shift_down288:
; i start address is: 20 (R5)
LDA.B	R0, _p_width+0
CMP.B	R5, R0
JMPC	R30, C, #0, L_display_shift_down289
;matrixrgb_firmware.c,1376 :: 		erase_pixel( 0, i );
BEXTU.L	R1, R5, #256
LDK.L	R0, #0
CALL	_erase_pixel+0
;matrixrgb_firmware.c,1375 :: 		for( i = 0; i < p_width; i++ )
ADD.L	R5, R5, #1
BEXTU.L	R5, R5, #256
;matrixrgb_firmware.c,1376 :: 		erase_pixel( 0, i );
; i end address is: 20 (R5)
JMP	L_display_shift_down288
L_display_shift_down289:
;matrixrgb_firmware.c,1378 :: 		}
L_end_display_shift_down:
UNLINK	LR
RETURN	
; end of _display_shift_down
_scroll_off_screen_up:
;matrixrgb_firmware.c,1380 :: 		void scroll_off_screen_up( uint16_t speed )
; speed start address is: 0 (R0)
; speed end address is: 0 (R0)
; speed start address is: 0 (R0)
;matrixrgb_firmware.c,1384 :: 		for( i = 0; i < p_height; i++ )
; i start address is: 40 (R10)
LDK.L	R10, #0
; speed end address is: 0 (R0)
; i end address is: 40 (R10)
BEXTU.L	R9, R0, #0
L_scroll_off_screen_up291:
; i start address is: 40 (R10)
; speed start address is: 36 (R9)
LDA.B	R1, _p_height+0
CMP.S	R10, R1
JMPC	R30, C, #0, L_scroll_off_screen_up292
;matrixrgb_firmware.c,1386 :: 		display_shift_up();
CALL	_display_shift_up+0
;matrixrgb_firmware.c,1387 :: 		for( j = 0; j < speed; j++ )
; j start address is: 44 (R11)
LDK.L	R11, #0
; speed end address is: 36 (R9)
; j end address is: 44 (R11)
; i end address is: 40 (R10)
L_scroll_off_screen_up294:
; j start address is: 44 (R11)
; speed start address is: 36 (R9)
; i start address is: 40 (R10)
CMP.S	R11, R9
JMPC	R30, C, #0, L_scroll_off_screen_up295
;matrixrgb_firmware.c,1388 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1387 :: 		for( j = 0; j < speed; j++ )
ADD.L	R11, R11, #1
BEXTU.L	R11, R11, #0
;matrixrgb_firmware.c,1388 :: 		refresh();
; j end address is: 44 (R11)
JMP	L_scroll_off_screen_up294
L_scroll_off_screen_up295:
;matrixrgb_firmware.c,1384 :: 		for( i = 0; i < p_height; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #0
;matrixrgb_firmware.c,1389 :: 		}
; speed end address is: 36 (R9)
; i end address is: 40 (R10)
JMP	L_scroll_off_screen_up291
L_scroll_off_screen_up292:
;matrixrgb_firmware.c,1390 :: 		}
L_end_scroll_off_screen_up:
RETURN	
; end of _scroll_off_screen_up
_scroll_off_screen_down:
;matrixrgb_firmware.c,1392 :: 		void scroll_off_screen_down( uint16_t speed )
; speed start address is: 0 (R0)
; speed end address is: 0 (R0)
; speed start address is: 0 (R0)
;matrixrgb_firmware.c,1396 :: 		for( i = 0; i < p_height; i++ )
; i start address is: 40 (R10)
LDK.L	R10, #0
; speed end address is: 0 (R0)
; i end address is: 40 (R10)
BEXTU.L	R9, R0, #0
L_scroll_off_screen_down297:
; i start address is: 40 (R10)
; speed start address is: 36 (R9)
LDA.B	R1, _p_height+0
CMP.S	R10, R1
JMPC	R30, C, #0, L_scroll_off_screen_down298
;matrixrgb_firmware.c,1398 :: 		display_shift_down();
CALL	_display_shift_down+0
;matrixrgb_firmware.c,1399 :: 		for( j = 0; j < speed; j++ )
; j start address is: 44 (R11)
LDK.L	R11, #0
; speed end address is: 36 (R9)
; j end address is: 44 (R11)
; i end address is: 40 (R10)
L_scroll_off_screen_down300:
; j start address is: 44 (R11)
; speed start address is: 36 (R9)
; i start address is: 40 (R10)
CMP.S	R11, R9
JMPC	R30, C, #0, L_scroll_off_screen_down301
;matrixrgb_firmware.c,1400 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware.c,1399 :: 		for( j = 0; j < speed; j++ )
ADD.L	R11, R11, #1
BEXTU.L	R11, R11, #0
;matrixrgb_firmware.c,1400 :: 		refresh();
; j end address is: 44 (R11)
JMP	L_scroll_off_screen_down300
L_scroll_off_screen_down301:
;matrixrgb_firmware.c,1396 :: 		for( i = 0; i < p_height; i++ )
ADD.L	R10, R10, #1
BEXTU.L	R10, R10, #0
;matrixrgb_firmware.c,1401 :: 		}
; speed end address is: 36 (R9)
; i end address is: 40 (R10)
JMP	L_scroll_off_screen_down297
L_scroll_off_screen_down298:
;matrixrgb_firmware.c,1403 :: 		}
L_end_scroll_off_screen_down:
RETURN	
; end of _scroll_off_screen_down
_write_pixel_img:
;matrixrgb_firmware.c,1405 :: 		void write_pixel_img( int row, int column, char red, char green, char blue)
; blue start address is: 16 (R4)
; green start address is: 12 (R3)
; red start address is: 8 (R2)
; column start address is: 4 (R1)
; row start address is: 0 (R0)
BEXTU.L	R6, R2, #256
; blue end address is: 16 (R4)
; green end address is: 12 (R3)
; red end address is: 8 (R2)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 0 (R0)
; column start address is: 4 (R1)
; red start address is: 24 (R6)
; green start address is: 12 (R3)
; blue start address is: 16 (R4)
;matrixrgb_firmware.c,1407 :: 		uint8_t buffer = 0;
; buffer start address is: 28 (R7)
LDK.L	R7, #0
;matrixrgb_firmware.c,1411 :: 		if( row == 0 )
CMP.S	R0, #0
JMPC	R30, Z, #0, L_write_pixel_img303
; row end address is: 0 (R0)
;matrixrgb_firmware.c,1413 :: 		starter = 0;
; starter start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,1414 :: 		incrementer = 0;
; incrementer start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1415 :: 		}
; incrementer end address is: 0 (R0)
; starter end address is: 8 (R2)
JMP	L_write_pixel_img304
L_write_pixel_img303:
;matrixrgb_firmware.c,1418 :: 		starter = row % 16;
; row start address is: 0 (R0)
MOD.L	R5, R0, #16
; starter start address is: 8 (R2)
BEXTU.L	R2, R5, #256
;matrixrgb_firmware.c,1419 :: 		incrementer = ( row / 16 ) * 32;
BEXTS.L	R5, R0, #0
; row end address is: 0 (R0)
ASHR.L	R5, R5, #4
BEXTS.L	R5, R5, #0
ASHL.L	R5, R5, #5
; incrementer start address is: 0 (R0)
BEXTU.L	R0, R5, #256
; incrementer end address is: 0 (R0)
; starter end address is: 8 (R2)
;matrixrgb_firmware.c,1420 :: 		}
L_write_pixel_img304:
;matrixrgb_firmware.c,1421 :: 		if( ( red & 0x18 ) > 0 )
; incrementer start address is: 0 (R0)
; starter start address is: 8 (R2)
AND.L	R5, R6, #24
; red end address is: 24 (R6)
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel_img324
;matrixrgb_firmware.c,1422 :: 		buffer |= 0x04;
OR.L	R6, R7, #4
BEXTU.L	R6, R6, #256
; buffer end address is: 28 (R7)
; buffer start address is: 24 (R6)
; buffer end address is: 24 (R6)
JMP	L_write_pixel_img305
L__write_pixel_img324:
;matrixrgb_firmware.c,1421 :: 		if( ( red & 0x18 ) > 0 )
BEXTU.L	R6, R7, #256
;matrixrgb_firmware.c,1422 :: 		buffer |= 0x04;
L_write_pixel_img305:
;matrixrgb_firmware.c,1423 :: 		if( ( green & 0x38 ) > 0 )
; buffer start address is: 24 (R6)
AND.L	R5, R3, #56
; green end address is: 12 (R3)
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel_img325
;matrixrgb_firmware.c,1424 :: 		buffer |= 0x02;
OR.L	R3, R6, #2
BEXTU.L	R3, R3, #256
; buffer end address is: 24 (R6)
; buffer start address is: 12 (R3)
; buffer end address is: 12 (R3)
JMP	L_write_pixel_img306
L__write_pixel_img325:
;matrixrgb_firmware.c,1423 :: 		if( ( green & 0x38 ) > 0 )
BEXTU.L	R3, R6, #256
;matrixrgb_firmware.c,1424 :: 		buffer |= 0x02;
L_write_pixel_img306:
;matrixrgb_firmware.c,1425 :: 		if( ( blue & 0x18 ) > 0 )
; buffer start address is: 12 (R3)
AND.L	R5, R4, #24
; blue end address is: 16 (R4)
CMP.B	R5, #0
JMPC	R30, A, #0, L__write_pixel_img326
;matrixrgb_firmware.c,1426 :: 		buffer |= 0x01;
OR.L	R3, R3, #1
BEXTU.L	R3, R3, #256
; buffer end address is: 12 (R3)
JMP	L_write_pixel_img307
L__write_pixel_img326:
;matrixrgb_firmware.c,1425 :: 		if( ( blue & 0x18 ) > 0 )
;matrixrgb_firmware.c,1426 :: 		buffer |= 0x01;
L_write_pixel_img307:
;matrixrgb_firmware.c,1427 :: 		column+= ( column / 32 ) * 32;
; buffer start address is: 12 (R3)
BEXTS.L	R5, R1, #0
ASHR.L	R5, R5, #5
BEXTS.L	R5, R5, #0
ASHL.L	R5, R5, #5
BEXTS.L	R5, R5, #0
ADD.L	R6, R1, R5
BEXTS.L	R6, R6, #0
; column end address is: 4 (R1)
;matrixrgb_firmware.c,1428 :: 		FB[ incrementer + ( starter *  shift_reg ) + column] |= buffer;
LDA.L	R5, _shift_reg+0
MUL.L	R5, R2, R5
; starter end address is: 8 (R2)
ADD.L	R5, R0, R5
; incrementer end address is: 0 (R0)
ADD.L	R6, R5, R6
LDA.L	R5, _FB+0
ADD.L	R6, R5, R6
LDI.B	R5, R6, #0
OR.L	R5, R5, R3
; buffer end address is: 12 (R3)
STI.B	R6, #0, R5
;matrixrgb_firmware.c,1429 :: 		}
L_end_write_pixel_img:
RETURN	
; end of _write_pixel_img
_write_pixel:
;matrixrgb_firmware.c,1431 :: 		void write_pixel( int row, int column, char red, char green, char blue)
; blue start address is: 16 (R4)
; green start address is: 12 (R3)
; red start address is: 8 (R2)
; column start address is: 4 (R1)
; row start address is: 0 (R0)
BEXTU.L	R6, R2, #256
; blue end address is: 16 (R4)
; green end address is: 12 (R3)
; red end address is: 8 (R2)
; column end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 0 (R0)
; column start address is: 4 (R1)
; red start address is: 24 (R6)
; green start address is: 12 (R3)
; blue start address is: 16 (R4)
;matrixrgb_firmware.c,1433 :: 		uint8_t buffer = 0;
; buffer start address is: 28 (R7)
LDK.L	R7, #0
;matrixrgb_firmware.c,1437 :: 		if( row == 0 )
CMP.S	R0, #0
JMPC	R30, Z, #0, L_write_pixel308
; row end address is: 0 (R0)
;matrixrgb_firmware.c,1439 :: 		starter = 0;
; starter start address is: 8 (R2)
LDK.L	R2, #0
;matrixrgb_firmware.c,1440 :: 		incrementer = 0;
; incrementer start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1441 :: 		}
; incrementer end address is: 0 (R0)
; starter end address is: 8 (R2)
JMP	L_write_pixel309
L_write_pixel308:
;matrixrgb_firmware.c,1444 :: 		starter = row % 16;
; row start address is: 0 (R0)
MOD.L	R5, R0, #16
; starter start address is: 8 (R2)
BEXTU.L	R2, R5, #256
;matrixrgb_firmware.c,1445 :: 		incrementer = ( row / 16 ) * 32;
BEXTS.L	R5, R0, #0
; row end address is: 0 (R0)
ASHR.L	R5, R5, #4
BEXTS.L	R5, R5, #0
ASHL.L	R5, R5, #5
; incrementer start address is: 0 (R0)
BEXTU.L	R0, R5, #256
; incrementer end address is: 0 (R0)
; starter end address is: 8 (R2)
;matrixrgb_firmware.c,1446 :: 		}
L_write_pixel309:
;matrixrgb_firmware.c,1447 :: 		if( red  > 0 )
; incrementer start address is: 0 (R0)
; starter start address is: 8 (R2)
CMP.B	R6, #0
JMPC	R30, A, #0, L__write_pixel316
; red end address is: 24 (R6)
;matrixrgb_firmware.c,1448 :: 		buffer |= 0x04;
OR.L	R6, R7, #4
BEXTU.L	R6, R6, #256
; buffer end address is: 28 (R7)
; buffer start address is: 24 (R6)
; buffer end address is: 24 (R6)
JMP	L_write_pixel310
L__write_pixel316:
;matrixrgb_firmware.c,1447 :: 		if( red  > 0 )
BEXTU.L	R6, R7, #256
;matrixrgb_firmware.c,1448 :: 		buffer |= 0x04;
L_write_pixel310:
;matrixrgb_firmware.c,1449 :: 		if( green > 0 )
; buffer start address is: 24 (R6)
CMP.B	R3, #0
JMPC	R30, A, #0, L__write_pixel317
; green end address is: 12 (R3)
;matrixrgb_firmware.c,1450 :: 		buffer |= 0x02;
OR.L	R3, R6, #2
BEXTU.L	R3, R3, #256
; buffer end address is: 24 (R6)
; buffer start address is: 12 (R3)
; buffer end address is: 12 (R3)
JMP	L_write_pixel311
L__write_pixel317:
;matrixrgb_firmware.c,1449 :: 		if( green > 0 )
BEXTU.L	R3, R6, #256
;matrixrgb_firmware.c,1450 :: 		buffer |= 0x02;
L_write_pixel311:
;matrixrgb_firmware.c,1451 :: 		if( blue > 0 )
; buffer start address is: 12 (R3)
CMP.B	R4, #0
JMPC	R30, A, #0, L__write_pixel318
; blue end address is: 16 (R4)
;matrixrgb_firmware.c,1452 :: 		buffer |= 0x01;
OR.L	R3, R3, #1
BEXTU.L	R3, R3, #256
; buffer end address is: 12 (R3)
JMP	L_write_pixel312
L__write_pixel318:
;matrixrgb_firmware.c,1451 :: 		if( blue > 0 )
;matrixrgb_firmware.c,1452 :: 		buffer |= 0x01;
L_write_pixel312:
;matrixrgb_firmware.c,1453 :: 		column+= ( column / 32 ) * 32;  //Used because panels come connected in 32 x 32 packages ... SOMETIMES :(
; buffer start address is: 12 (R3)
BEXTS.L	R5, R1, #0
ASHR.L	R5, R5, #5
BEXTS.L	R5, R5, #0
ASHL.L	R5, R5, #5
BEXTS.L	R5, R5, #0
ADD.L	R6, R1, R5
BEXTS.L	R6, R6, #0
; column end address is: 4 (R1)
;matrixrgb_firmware.c,1454 :: 		FB[ incrementer + ( starter *  shift_reg ) + column] |= buffer;
LDA.L	R5, _shift_reg+0
MUL.L	R5, R2, R5
; starter end address is: 8 (R2)
ADD.L	R5, R0, R5
; incrementer end address is: 0 (R0)
ADD.L	R6, R5, R6
LDA.L	R5, _FB+0
ADD.L	R6, R5, R6
LDI.B	R5, R6, #0
OR.L	R5, R5, R3
; buffer end address is: 12 (R3)
STI.B	R6, #0, R5
;matrixrgb_firmware.c,1456 :: 		}
L_end_write_pixel:
RETURN	
; end of _write_pixel
_erase_pixel:
;matrixrgb_firmware.c,1458 :: 		void erase_pixel( int row, int column )
; column start address is: 4 (R1)
; row start address is: 0 (R0)
BEXTS.L	R3, R0, #0
; column end address is: 4 (R1)
; row end address is: 0 (R0)
; row start address is: 12 (R3)
; column start address is: 4 (R1)
;matrixrgb_firmware.c,1460 :: 		uint8_t buffer = 0;
;matrixrgb_firmware.c,1464 :: 		if( row == 0 )
CMP.S	R3, #0
JMPC	R30, Z, #0, L_erase_pixel313
; row end address is: 12 (R3)
;matrixrgb_firmware.c,1466 :: 		starter = 0;
; starter start address is: 16 (R4)
LDK.L	R4, #0
;matrixrgb_firmware.c,1467 :: 		incrementer = 0;
; incrementer start address is: 0 (R0)
LDK.L	R0, #0
;matrixrgb_firmware.c,1468 :: 		}
; incrementer end address is: 0 (R0)
; starter end address is: 16 (R4)
JMP	L_erase_pixel314
L_erase_pixel313:
;matrixrgb_firmware.c,1471 :: 		starter = row % 16;
; row start address is: 12 (R3)
MOD.L	R2, R3, #16
; starter start address is: 0 (R0)
BEXTU.L	R0, R2, #256
;matrixrgb_firmware.c,1472 :: 		incrementer = ( row / 16 ) * 32;
BEXTS.L	R2, R3, #0
; row end address is: 12 (R3)
ASHR.L	R2, R2, #4
BEXTS.L	R2, R2, #0
ASHL.L	R2, R2, #5
; incrementer start address is: 12 (R3)
BEXTU.L	R3, R2, #256
; starter end address is: 0 (R0)
; incrementer end address is: 12 (R3)
BEXTU.L	R4, R0, #256
BEXTU.L	R0, R3, #256
;matrixrgb_firmware.c,1473 :: 		}
L_erase_pixel314:
;matrixrgb_firmware.c,1474 :: 		column+= ( column / 32 ) * 32;
; incrementer start address is: 0 (R0)
; starter start address is: 16 (R4)
BEXTS.L	R2, R1, #0
ASHR.L	R2, R2, #5
BEXTS.L	R2, R2, #0
ASHL.L	R2, R2, #5
BEXTS.L	R2, R2, #0
ADD.L	R3, R1, R2
BEXTS.L	R3, R3, #0
; column end address is: 4 (R1)
;matrixrgb_firmware.c,1475 :: 		FB[ incrementer + ( starter *  shift_reg ) + column] = 0x00;
LDA.L	R2, _shift_reg+0
MUL.L	R2, R4, R2
; starter end address is: 16 (R4)
ADD.L	R2, R0, R2
; incrementer end address is: 0 (R0)
ADD.L	R3, R2, R3
LDA.L	R2, _FB+0
ADD.L	R3, R2, R3
LDK.L	R2, #0
STI.B	R3, #0, R2
;matrixrgb_firmware.c,1476 :: 		}
L_end_erase_pixel:
RETURN	
; end of _erase_pixel
_setup_timer:
;matrixrgb_firmware.c,1478 :: 		void setup_timer( void )    //3 us
;matrixrgb_firmware.c,1480 :: 		TIMER_CONTROL_0 = 2;
LDK.L	R0, #2
STA.B	TIMER_CONTROL_0+0, R0
;matrixrgb_firmware.c,1481 :: 		TIMER_SELECT = 0;
LDK.L	R1, #0
STA.B	TIMER_SELECT+0, R1
;matrixrgb_firmware.c,1482 :: 		TIMER_PRESC_LS = 0;
STA.B	TIMER_PRESC_LS+0, R1
;matrixrgb_firmware.c,1483 :: 		TIMER_PRESC_MS = 0;
STA.B	TIMER_PRESC_MS+0, R1
;matrixrgb_firmware.c,1484 :: 		TIMER_WRITE_LS = 43;
LDK.L	R0, #43
STA.B	TIMER_WRITE_LS+0, R0
;matrixrgb_firmware.c,1485 :: 		TIMER_WRITE_MS = 1;
LDK.L	R0, #1
STA.B	TIMER_WRITE_MS+0, R0
;matrixrgb_firmware.c,1486 :: 		TIMER_CONTROL_3 = 0;
STA.B	TIMER_CONTROL_3+0, R1
;matrixrgb_firmware.c,1487 :: 		TIMER_CONTROL_4 |= 17;
LDA.B	R0, TIMER_CONTROL_4+0
OR.L	R0, R0, #17
STA.B	TIMER_CONTROL_4+0, R0
;matrixrgb_firmware.c,1488 :: 		TIMER_CONTROL_2 |= 0;
LDA.B	R0, TIMER_CONTROL_2+0
STA.B	TIMER_CONTROL_2+0, R0
;matrixrgb_firmware.c,1489 :: 		TIMER_INT |= 2;
LDA.B	R0, TIMER_INT+0
OR.L	R0, R0, #2
STA.B	TIMER_INT+0, R0
;matrixrgb_firmware.c,1490 :: 		TIMER_CONTROL_1 |= 1;
LDA.B	R0, TIMER_CONTROL_1+0
OR.L	R0, R0, #1
STA.B	TIMER_CONTROL_1+0, R0
;matrixrgb_firmware.c,1491 :: 		IRQ_CTRL.B31 = 0;
LDA.x	R0, #AlignedAddress(IRQ_CTRL+0)
BINS.L	R0, R0, #63
STI.x	IRQ_CTRL+0, #AlignedAddress(R0)
;matrixrgb_firmware.c,1492 :: 		}
L_end_setup_timer:
RETURN	
; end of _setup_timer
_TimerInterrupt:
;matrixrgb_firmware.c,1494 :: 		void TimerInterrupt(void) iv IVT_TIMERS_IRQ
;matrixrgb_firmware.c,1498 :: 		if (TIMER_INT_A_bit)
LDA.x	R0, #AlignedAddress(TIMER_INT_A_bit+0)
BEXTU.L	R0, R0, #BitPos(TIMER_INT_A_bit+0)
CMP.L	R0, #0
JMPC	R30, Z, #1, L_TimerInterrupt315
;matrixrgb_firmware.c,1499 :: 		TIMER_INT = (TIMER_INT & 0xAA) | (1 << 0);
LDA.B	R0, TIMER_INT+0
AND.L	R0, R0, #170
BEXTU.L	R0, R0, #256
OR.L	R0, R0, #1
STA.B	TIMER_INT+0, R0
L_TimerInterrupt315:
;matrixrgb_firmware.c,1500 :: 		}
L_end_TimerInterrupt:
RETI	
; end of _TimerInterrupt
