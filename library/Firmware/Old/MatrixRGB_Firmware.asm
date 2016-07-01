_main:
;MatrixRGB_Firmware.c,31 :: 		void main()
LDK.L	SP, #43605
LINK	LR, #4
;MatrixRGB_Firmware.c,35 :: 		uint16_t speed       = 30;
;MatrixRGB_Firmware.c,39 :: 		spi_bus_init();
CALL	_spi_bus_init+0
;MatrixRGB_Firmware.c,40 :: 		Delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_main0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main0
JMP	$+8
	#9999998
NOP	
;MatrixRGB_Firmware.c,42 :: 		while(1)
L_main2:
;MatrixRGB_Firmware.c,44 :: 		receive_data( &buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_buffer+0
CALL	_receive_data+0
;MatrixRGB_Firmware.c,46 :: 		switch( buffer[0] )
JMP	L_main4
;MatrixRGB_Firmware.c,48 :: 		case SETUP_CMD:
L_main6:
;MatrixRGB_Firmware.c,49 :: 		setup_command();
CALL	_setup_command+0
;MatrixRGB_Firmware.c,50 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,51 :: 		case IMAGE_LOAD_CMD:
L_main7:
;MatrixRGB_Firmware.c,52 :: 		image_load_command();
CALL	_image_load_command+0
;MatrixRGB_Firmware.c,53 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,54 :: 		case SCROLL_IMG_LEFT_CMD:
L_main8:
;MatrixRGB_Firmware.c,55 :: 		scroll_img_left_command();
CALL	_scroll_img_left_command+0
;MatrixRGB_Firmware.c,56 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,57 :: 		case SCROLL_IMG_RIGHT_CMD:
L_main9:
;MatrixRGB_Firmware.c,58 :: 		scroll_img_right_command();
CALL	_scroll_img_right_command+0
;MatrixRGB_Firmware.c,59 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,60 :: 		case WRITE_PXL_CMD:
L_main10:
;MatrixRGB_Firmware.c,61 :: 		write_pxl_command();
CALL	_write_pxl_command+0
;MatrixRGB_Firmware.c,62 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,63 :: 		case WRITE_PXL_IMG_CMD:
L_main11:
;MatrixRGB_Firmware.c,64 :: 		write_pxl_img_command();
CALL	_write_pxl_img_command+0
;MatrixRGB_Firmware.c,65 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,66 :: 		case ERASE_PXL_CMD:
L_main12:
;MatrixRGB_Firmware.c,67 :: 		erase_pxl_command();
CALL	_erase_pxl_command+0
;MatrixRGB_Firmware.c,68 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,69 :: 		case SCROLL_TEXT_LEFT_CMD:
L_main13:
;MatrixRGB_Firmware.c,70 :: 		scroll_text_left_command();
CALL	_scroll_text_left_command+0
;MatrixRGB_Firmware.c,71 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,72 :: 		case SCROLL_TEXT_RIGHT_CMD:
L_main14:
;MatrixRGB_Firmware.c,73 :: 		scroll_text_right_command();
CALL	_scroll_text_right_command+0
;MatrixRGB_Firmware.c,74 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,75 :: 		case DISPLAY_SHIFT_UP_CMD:
L_main15:
;MatrixRGB_Firmware.c,76 :: 		display_shift_up_command();
CALL	_display_shift_up_command+0
;MatrixRGB_Firmware.c,77 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,78 :: 		case DISPLAY_SHIFT_DOWN_CMD:
L_main16:
;MatrixRGB_Firmware.c,79 :: 		display_shift_down_command();
CALL	_display_shift_down_command+0
;MatrixRGB_Firmware.c,80 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,81 :: 		case DISPLAY_SHIFT_RIGHT_CMD:
L_main17:
;MatrixRGB_Firmware.c,82 :: 		display_shift_right_command();
CALL	_display_shift_right_command+0
;MatrixRGB_Firmware.c,83 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,84 :: 		case DISPLAY_SHIFT_LEFT_CMD:
L_main18:
;MatrixRGB_Firmware.c,85 :: 		display_shift_left_command();
CALL	_display_shift_left_command+0
;MatrixRGB_Firmware.c,86 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,87 :: 		case DISPLAY_SCROLL_OFF_SCRN_UP_CMD:
L_main19:
;MatrixRGB_Firmware.c,88 :: 		display_scroll_off_scrn_up_command();
CALL	_display_scroll_off_scrn_up_command+0
;MatrixRGB_Firmware.c,89 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,90 :: 		case DISPLAY_SCROLL_OFF_SCRN_DWN_CMD:
L_main20:
;MatrixRGB_Firmware.c,91 :: 		display_scroll_off_scrn_down_command();
CALL	_display_scroll_off_scrn_down_command+0
;MatrixRGB_Firmware.c,92 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,93 :: 		case DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD:
L_main21:
;MatrixRGB_Firmware.c,94 :: 		display_scroll_off_scrn_left_command();
CALL	_display_scroll_off_scrn_left_command+0
;MatrixRGB_Firmware.c,95 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,96 :: 		case DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD:
L_main22:
;MatrixRGB_Firmware.c,97 :: 		display_scroll_off_scrn_right_command();
CALL	_display_scroll_off_scrn_right_command+0
;MatrixRGB_Firmware.c,98 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,99 :: 		case REFRESH_CMD:
L_main23:
;MatrixRGB_Firmware.c,100 :: 		refresh();
CALL	_refresh+0
;MatrixRGB_Firmware.c,101 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,102 :: 		case CLR_SCRN_CMD:
L_main24:
;MatrixRGB_Firmware.c,103 :: 		clear_screen_command();
CALL	_clear_screen_command+0
;MatrixRGB_Firmware.c,104 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,105 :: 		default:
L_main25:
;MatrixRGB_Firmware.c,106 :: 		break;
JMP	L_main5
;MatrixRGB_Firmware.c,107 :: 		}
L_main4:
LDA.B	R0, _buffer+0
CMP.B	R0, #1
JMPC	R30, Z, #1, L_main6
LDA.B	R0, _buffer+0
CMP.B	R0, #2
JMPC	R30, Z, #1, L_main7
LDA.B	R0, _buffer+0
CMP.B	R0, #3
JMPC	R30, Z, #1, L_main8
LDA.B	R0, _buffer+0
CMP.B	R0, #4
JMPC	R30, Z, #1, L_main9
LDA.B	R0, _buffer+0
CMP.B	R0, #5
JMPC	R30, Z, #1, L_main10
LDA.B	R0, _buffer+0
CMP.B	R0, #6
JMPC	R30, Z, #1, L_main11
LDA.B	R0, _buffer+0
CMP.B	R0, #7
JMPC	R30, Z, #1, L_main12
LDA.B	R0, _buffer+0
CMP.B	R0, #8
JMPC	R30, Z, #1, L_main13
LDA.B	R0, _buffer+0
CMP.B	R0, #9
JMPC	R30, Z, #1, L_main14
LDA.B	R0, _buffer+0
CMP.B	R0, #10
JMPC	R30, Z, #1, L_main15
LDA.B	R0, _buffer+0
CMP.B	R0, #11
JMPC	R30, Z, #1, L_main16
LDA.B	R0, _buffer+0
CMP.B	R0, #12
JMPC	R30, Z, #1, L_main17
LDA.B	R0, _buffer+0
CMP.B	R0, #13
JMPC	R30, Z, #1, L_main18
LDA.B	R0, _buffer+0
CMP.B	R0, #14
JMPC	R30, Z, #1, L_main19
LDA.B	R0, _buffer+0
CMP.B	R0, #15
JMPC	R30, Z, #1, L_main20
LDA.B	R0, _buffer+0
CMP.B	R0, #16
JMPC	R30, Z, #1, L_main21
LDA.B	R0, _buffer+0
CMP.B	R0, #17
JMPC	R30, Z, #1, L_main22
LDA.B	R0, _buffer+0
CMP.B	R0, #18
JMPC	R30, Z, #1, L_main23
LDA.B	R0, _buffer+0
CMP.B	R0, #19
JMPC	R30, Z, #1, L_main24
JMP	L_main25
L_main5:
;MatrixRGB_Firmware.c,108 :: 		}
JMP	L_main2
;MatrixRGB_Firmware.c,109 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
