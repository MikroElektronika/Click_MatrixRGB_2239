_main:
;matrixrgb_firmware_main.c,31 :: 		void main()
LDK.L	SP, #43605
;matrixrgb_firmware_main.c,34 :: 		spi_bus_init();
CALL	_spi_bus_init+0
;matrixrgb_firmware_main.c,35 :: 		Delay_ms(300);
LPM.L	R28, #9999998
NOP	
L_main0:
SUB.L	R28, R28, #1
CMP.L	R28, #0
JMPC	R30, Z, #0, L_main0
JMP	$+8
	#9999998
NOP	
;matrixrgb_firmware_main.c,37 :: 		while (1)
L_main2:
;matrixrgb_firmware_main.c,39 :: 		receive_data( &buffer, 1 );
LDK.L	R1, #1
LDK.L	R0, #_buffer+0
CALL	_receive_data+0
;matrixrgb_firmware_main.c,41 :: 		switch ( buffer[0] )
JMP	L_main4
;matrixrgb_firmware_main.c,43 :: 		case SETUP_CMD:
L_main6:
;matrixrgb_firmware_main.c,44 :: 		setup_command();
CALL	_setup_command+0
;matrixrgb_firmware_main.c,45 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,46 :: 		case IMAGE_LOAD_CMD:
L_main7:
;matrixrgb_firmware_main.c,47 :: 		image_load_command();
CALL	_image_load_command+0
;matrixrgb_firmware_main.c,48 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,49 :: 		case SCROLL_IMG_LEFT_CMD:
L_main8:
;matrixrgb_firmware_main.c,50 :: 		scroll_img_left_command();
CALL	_scroll_img_left_command+0
;matrixrgb_firmware_main.c,51 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,52 :: 		case SCROLL_IMG_RIGHT_CMD:
L_main9:
;matrixrgb_firmware_main.c,53 :: 		scroll_img_right_command();
CALL	_scroll_img_right_command+0
;matrixrgb_firmware_main.c,54 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,55 :: 		case WRITE_PXL_CMD:
L_main10:
;matrixrgb_firmware_main.c,56 :: 		write_pxl_command();
CALL	_write_pxl_command+0
;matrixrgb_firmware_main.c,57 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,58 :: 		case WRITE_PXL_IMG_CMD:
L_main11:
;matrixrgb_firmware_main.c,59 :: 		write_pxl_img_command();
CALL	_write_pxl_img_command+0
;matrixrgb_firmware_main.c,60 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,61 :: 		case ERASE_PXL_CMD:
L_main12:
;matrixrgb_firmware_main.c,62 :: 		erase_pxl_command();
CALL	_erase_pxl_command+0
;matrixrgb_firmware_main.c,63 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,64 :: 		case SCROLL_TEXT_LEFT_CMD:
L_main13:
;matrixrgb_firmware_main.c,65 :: 		scroll_text_left_command();
CALL	_scroll_text_left_command+0
;matrixrgb_firmware_main.c,66 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,67 :: 		case SCROLL_TEXT_RIGHT_CMD:
L_main14:
;matrixrgb_firmware_main.c,68 :: 		scroll_text_right_command();
CALL	_scroll_text_right_command+0
;matrixrgb_firmware_main.c,69 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,70 :: 		case DISPLAY_SHIFT_UP_CMD:
L_main15:
;matrixrgb_firmware_main.c,71 :: 		display_shift_up_command();
CALL	_display_shift_up_command+0
;matrixrgb_firmware_main.c,72 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,73 :: 		case DISPLAY_SHIFT_DOWN_CMD:
L_main16:
;matrixrgb_firmware_main.c,74 :: 		display_shift_down_command();
CALL	_display_shift_down_command+0
;matrixrgb_firmware_main.c,75 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,76 :: 		case DISPLAY_SHIFT_RIGHT_CMD:
L_main17:
;matrixrgb_firmware_main.c,77 :: 		display_shift_right_command();
CALL	_display_shift_right_command+0
;matrixrgb_firmware_main.c,78 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,79 :: 		case DISPLAY_SHIFT_LEFT_CMD:
L_main18:
;matrixrgb_firmware_main.c,80 :: 		display_shift_left_command();
CALL	_display_shift_left_command+0
;matrixrgb_firmware_main.c,81 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,82 :: 		case DISPLAY_SCROLL_OFF_SCRN_UP_CMD:
L_main19:
;matrixrgb_firmware_main.c,83 :: 		display_scroll_off_scrn_up_command();
CALL	_display_scroll_off_scrn_up_command+0
;matrixrgb_firmware_main.c,84 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,85 :: 		case DISPLAY_SCROLL_OFF_SCRN_DWN_CMD:
L_main20:
;matrixrgb_firmware_main.c,86 :: 		display_scroll_off_scrn_down_command();
CALL	_display_scroll_off_scrn_down_command+0
;matrixrgb_firmware_main.c,87 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,88 :: 		case DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD:
L_main21:
;matrixrgb_firmware_main.c,89 :: 		display_scroll_off_scrn_left_command();
CALL	_display_scroll_off_scrn_left_command+0
;matrixrgb_firmware_main.c,90 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,91 :: 		case DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD:
L_main22:
;matrixrgb_firmware_main.c,92 :: 		display_scroll_off_scrn_right_command();
CALL	_display_scroll_off_scrn_right_command+0
;matrixrgb_firmware_main.c,93 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,94 :: 		case REFRESH_CMD:
L_main23:
;matrixrgb_firmware_main.c,95 :: 		refresh();
CALL	_refresh+0
;matrixrgb_firmware_main.c,96 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,97 :: 		case CLR_SCRN_CMD:
L_main24:
;matrixrgb_firmware_main.c,98 :: 		clear_screen_command();
CALL	_clear_screen_command+0
;matrixrgb_firmware_main.c,99 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,100 :: 		case WRITE_TEXT_CMD:
L_main25:
;matrixrgb_firmware_main.c,101 :: 		write_text_command();
CALL	_write_text_command+0
;matrixrgb_firmware_main.c,102 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,103 :: 		default:
L_main26:
;matrixrgb_firmware_main.c,104 :: 		break;
JMP	L_main5
;matrixrgb_firmware_main.c,105 :: 		}
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
LDA.B	R0, _buffer+0
CMP.B	R0, #20
JMPC	R30, Z, #1, L_main25
JMP	L_main26
L_main5:
;matrixrgb_firmware_main.c,106 :: 		}
JMP	L_main2
;matrixrgb_firmware_main.c,107 :: 		}
L_end_main:
L__main_end_loop:
JMP	L__main_end_loop
; end of _main
