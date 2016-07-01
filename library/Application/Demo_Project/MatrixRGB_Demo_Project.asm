_main:
;MatrixRGB_Demo_Project.c,109 :: 		void main()
SUB	SP, SP, #4
;MatrixRGB_Demo_Project.c,112 :: 		uint8_t bonus_level = 0;        /**<    Flag used for Bonus Level after winning on Hard */
MOVS	R0, #0
STRB	R0, [SP, #3]
;MatrixRGB_Demo_Project.c,116 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );      /**<    Color for text */
ADD	R0, SP, #0
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Demo_Project.c,117 :: 		system_setup( 100, 2, 2);                       /**<    Sets up ADC, SPI, MatrixRGB, Timer */
MOVS	R2, #2
MOVS	R1, #2
MOVS	R0, #100
BL	_system_setup+0
;MatrixRGB_Demo_Project.c,119 :: 		ball_speed = g_ball_speed;                      /**<    Setup initial ball speed */
MOVW	R0, #lo_addr(_g_ball_speed+0)
MOVT	R0, #hi_addr(_g_ball_speed+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_speed+0)
MOVT	R0, #hi_addr(_ball_speed+0)
STRH	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,120 :: 		wait_for_choice();                              /**<    Wait for choice from Main Menu */
BL	_wait_for_choice+0
;MatrixRGB_Demo_Project.c,121 :: 		matrixrgb_clear_screen();                       /**<    Setting up game functions */
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,122 :: 		setup_gameboard( void );
BL	_setup_gameboard+0
;MatrixRGB_Demo_Project.c,123 :: 		setup_player( void );
BL	_setup_player+0
;MatrixRGB_Demo_Project.c,124 :: 		setup_ball( void );
BL	_setup_ball+0
;MatrixRGB_Demo_Project.c,127 :: 		while ( 1 )  //Super Loop
L_main0:
;MatrixRGB_Demo_Project.c,129 :: 		matrixrgb_refresh();
BL	_matrixrgb_refresh+0
;MatrixRGB_Demo_Project.c,133 :: 		adc_pos = ADC1_Get_Sample(3);                         /**<  Get ADC value from corresponding channel */
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_pos+0)
MOVT	R1, #hi_addr(_adc_pos+0)
STR	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,135 :: 		if (Button(&GPIOA_IDR, 0, 1, 1))                      /**<  A0 Button press, Pause Game */
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_main2
;MatrixRGB_Demo_Project.c,137 :: 		while ( !Button(&GPIOA_IDR, 0, 1, 0 ) )           /**<  Wait for depress of A0 */
L_main3:
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L_main4
;MatrixRGB_Demo_Project.c,140 :: 		adc_pos = ADC1_Get_Sample(3);                 /**<  If CHEATING defined, allow moving of player */
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_pos+0)
MOVT	R1, #hi_addr(_adc_pos+0)
STR	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,141 :: 		move_player();
BL	_move_player+0
;MatrixRGB_Demo_Project.c,143 :: 		matrixrgb_refresh();                          /**<  Refresh while we wait for depress   */
BL	_matrixrgb_refresh+0
;MatrixRGB_Demo_Project.c,144 :: 		}
IT	AL
BAL	L_main3
L_main4:
;MatrixRGB_Demo_Project.c,145 :: 		while ( !Button(&GPIOA_IDR, 0, 1, 1) )            /**<  Wait Till pressed again to continue playing  */
L_main5:
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L_main6
;MatrixRGB_Demo_Project.c,146 :: 		matrixrgb_refresh();
BL	_matrixrgb_refresh+0
IT	AL
BAL	L_main5
L_main6:
;MatrixRGB_Demo_Project.c,148 :: 		while ( !Button(&GPIOA_IDR, 0, 1, 0 ) )           /**<  Wait for depress  */
L_main7:
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L_main8
;MatrixRGB_Demo_Project.c,149 :: 		matrixrgb_refresh();
BL	_matrixrgb_refresh+0
IT	AL
BAL	L_main7
L_main8:
;MatrixRGB_Demo_Project.c,150 :: 		}
L_main2:
;MatrixRGB_Demo_Project.c,154 :: 		if ( move_flag )                            /**< Wait for timer flag ( 200us ) to allow movement of player */
MOVW	R0, #lo_addr(_move_flag+0)
MOVT	R0, #hi_addr(_move_flag+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L_main9
;MatrixRGB_Demo_Project.c,156 :: 		move_player();
BL	_move_player+0
;MatrixRGB_Demo_Project.c,157 :: 		move_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_move_flag+0)
MOVT	R0, #hi_addr(_move_flag+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,158 :: 		}
L_main9:
;MatrixRGB_Demo_Project.c,159 :: 		if ( ball_count_flag >= ball_speed )        /**< Wait for the timer to increment "ball_speed" times before moving the ball again */
MOVW	R0, #lo_addr(_ball_speed+0)
MOVT	R0, #hi_addr(_ball_speed+0)
LDRH	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_count_flag+0)
MOVT	R0, #hi_addr(_ball_count_flag+0)
LDRH	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L_main10
;MatrixRGB_Demo_Project.c,161 :: 		move_ball();
BL	_move_ball+0
;MatrixRGB_Demo_Project.c,162 :: 		ball_count_flag = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_count_flag+0)
MOVT	R0, #hi_addr(_ball_count_flag+0)
STRH	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,163 :: 		}
L_main10:
;MatrixRGB_Demo_Project.c,165 :: 		if ( safe == false || playing == false )    /**< If the player has failed, or won the game ( done playing ) */
MOVW	R0, #lo_addr(_safe+0)
MOVT	R0, #hi_addr(_safe+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main513
MOVW	R0, #lo_addr(_playing+0)
MOVT	R0, #hi_addr(_playing+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__main512
IT	AL
BAL	L_main13
L__main513:
L__main512:
;MatrixRGB_Demo_Project.c,168 :: 		time_s = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_time_s+0)
MOVT	R0, #hi_addr(_time_s+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,177 :: 		if ( playing == false && g_ball_speed == 200 )   /**< If you beat Hard Mode */
MOVW	R0, #lo_addr(_playing+0)
MOVT	R0, #hi_addr(_playing+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L__main515
MOVW	R0, #lo_addr(_g_ball_speed+0)
MOVT	R0, #hi_addr(_g_ball_speed+0)
LDRH	R0, [R0, #0]
CMP	R0, #200
IT	NE
BNE	L__main514
L__main510:
;MatrixRGB_Demo_Project.c,179 :: 		bonus_level = 1;
MOVS	R0, #1
STRB	R0, [SP, #3]
;MatrixRGB_Demo_Project.c,180 :: 		display_bonuslevel();                       /**< Display Bonus Level Screen */
BL	_display_bonuslevel+0
;MatrixRGB_Demo_Project.c,177 :: 		if ( playing == false && g_ball_speed == 200 )   /**< If you beat Hard Mode */
L__main515:
L__main514:
;MatrixRGB_Demo_Project.c,183 :: 		matrixrgb_clear_screen();                       /**< Win or lose, Clear Screen */
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,188 :: 		matrixrgb_clear_screen();                       /**< Clear Screen ! */
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,189 :: 		if ( !bonus_level )                             /**< Check if HARD level was beat, if so Bonus Level time */
LDRB	R0, [SP, #3]
CMP	R0, #0
IT	NE
BNE	L_main17
;MatrixRGB_Demo_Project.c,190 :: 		setup_gameboard( void );
BL	_setup_gameboard+0
IT	AL
BAL	L_main18
L_main17:
;MatrixRGB_Demo_Project.c,192 :: 		setup_bonus_level();
BL	_setup_bonus_level+0
L_main18:
;MatrixRGB_Demo_Project.c,193 :: 		bonus_level = 0;
MOVS	R0, #0
STRB	R0, [SP, #3]
;MatrixRGB_Demo_Project.c,194 :: 		setup_player( void );                           /**< Setup Player at Default location to start */
BL	_setup_player+0
;MatrixRGB_Demo_Project.c,195 :: 		setup_ball( void );                             /**< Setup Ball at random location in random direction */
BL	_setup_ball+0
;MatrixRGB_Demo_Project.c,196 :: 		safe = true;                                    /**< Set flags for fail and win back to defaults */
MOVS	R1, #1
MOVW	R0, #lo_addr(_safe+0)
MOVT	R0, #hi_addr(_safe+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,197 :: 		playing = true;                                 /**< Ball direction set to up initially */
MOVS	R1, #1
MOVW	R0, #lo_addr(_playing+0)
MOVT	R0, #hi_addr(_playing+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,198 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,199 :: 		Delay_ms(50);
MOVW	R7, #10175
MOVT	R7, #9
NOP
NOP
L_main19:
SUBS	R7, R7, #1
BNE	L_main19
NOP
NOP
NOP
;MatrixRGB_Demo_Project.c,200 :: 		time = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_time+0)
MOVT	R0, #hi_addr(_time+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,201 :: 		}
L_main13:
;MatrixRGB_Demo_Project.c,202 :: 		matrixrgb_refresh();                               /**< Refresh every loop */
BL	_matrixrgb_refresh+0
;MatrixRGB_Demo_Project.c,203 :: 		} /**< Play Game Loop End *****************************/
IT	AL
BAL	L_main0
;MatrixRGB_Demo_Project.c,204 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_clear_time_zone:
;MatrixRGB_Demo_Project.c,206 :: 		void clear_time_zone( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,210 :: 		for ( i = 16; i < 29; i++ )
; i start address is: 4 (R1)
MOVS	R1, #16
; i end address is: 4 (R1)
L_clear_time_zone21:
; i start address is: 4 (R1)
CMP	R1, #29
IT	CS
BCS	L_clear_time_zone22
;MatrixRGB_Demo_Project.c,211 :: 		for ( j = 0; j < 31; j++ )
; j start address is: 8 (R2)
MOVS	R2, #0
; j end address is: 8 (R2)
; i end address is: 4 (R1)
L_clear_time_zone24:
; j start address is: 8 (R2)
; i start address is: 4 (R1)
CMP	R2, #31
IT	CS
BCS	L_clear_time_zone25
;MatrixRGB_Demo_Project.c,212 :: 		matrixrgb_erase_pixel( i, j );
STRB	R1, [SP, #4]
STRB	R2, [SP, #5]
UXTB	R0, R1
UXTB	R1, R2
BL	_matrixrgb_erase_pixel+0
LDRB	R2, [SP, #5]
LDRB	R1, [SP, #4]
;MatrixRGB_Demo_Project.c,211 :: 		for ( j = 0; j < 31; j++ )
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,212 :: 		matrixrgb_erase_pixel( i, j );
; j end address is: 8 (R2)
IT	AL
BAL	L_clear_time_zone24
L_clear_time_zone25:
;MatrixRGB_Demo_Project.c,210 :: 		for ( i = 16; i < 29; i++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,212 :: 		matrixrgb_erase_pixel( i, j );
; i end address is: 4 (R1)
IT	AL
BAL	L_clear_time_zone21
L_clear_time_zone22:
;MatrixRGB_Demo_Project.c,213 :: 		}
L_end_clear_time_zone:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _clear_time_zone
_display_time:
;MatrixRGB_Demo_Project.c,215 :: 		void display_time( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,220 :: 		if ( time >= 10000 )
MOVW	R0, #lo_addr(_time+0)
MOVT	R0, #hi_addr(_time+0)
LDR	R1, [R0, #0]
MOVW	R0, #10000
CMP	R1, R0
IT	CC
BCC	L_display_time27
;MatrixRGB_Demo_Project.c,222 :: 		clear_time_zone();
BL	_clear_time_zone+0
;MatrixRGB_Demo_Project.c,223 :: 		time_s++;
MOVW	R1, #lo_addr(_time_s+0)
MOVT	R1, #hi_addr(_time_s+0)
LDRB	R0, [R1, #0]
ADDS	R0, R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,224 :: 		time = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_time+0)
MOVT	R0, #hi_addr(_time+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,225 :: 		}
L_display_time27:
;MatrixRGB_Demo_Project.c,226 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD	R0, SP, #7
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Demo_Project.c,227 :: 		matrixrgb_write_text( "Time", my_color, 4, 0, 0 );
MOVW	R0, #lo_addr(?lstr1_MatrixRGB_Demo_Project+0)
MOVT	R0, #hi_addr(?lstr1_MatrixRGB_Demo_Project+0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #4
SUB	SP, SP, #4
ADD	R12, SP, #11
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_write_text+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,228 :: 		matrixrgb_write_text( ":", my_color, 1, 0, 27 );
MOVW	R0, #lo_addr(?lstr2_MatrixRGB_Demo_Project+0)
MOVT	R0, #hi_addr(?lstr2_MatrixRGB_Demo_Project+0)
MOVS	R3, #27
MOVS	R2, #0
MOVS	R1, #1
SUB	SP, SP, #4
ADD	R12, SP, #11
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_write_text+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,229 :: 		IntToStr( time_s, time_str );
ADD	R1, SP, #4
MOVW	R0, #lo_addr(_time_s+0)
MOVT	R0, #hi_addr(_time_s+0)
LDRB	R0, [R0, #0]
BL	_IntToStr+0
;MatrixRGB_Demo_Project.c,230 :: 		Ltrim( time_str );
ADD	R0, SP, #4
BL	_Ltrim+0
;MatrixRGB_Demo_Project.c,231 :: 		matrixrgb_write_text( time_str, my_color, 3, 16, 12 );
ADD	R0, SP, #4
MOVS	R3, #12
MOVS	R2, #16
MOVS	R1, #3
SUB	SP, SP, #4
ADD	R12, SP, #11
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_write_text+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,232 :: 		}
L_end_display_time:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _display_time
_display_youwin:
;MatrixRGB_Demo_Project.c,234 :: 		void display_youwin( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,236 :: 		bool wait = true;
MOVS	R0, #1
STRB	R0, [SP, #7]
;MatrixRGB_Demo_Project.c,238 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
ADD	R0, SP, #4
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Demo_Project.c,240 :: 		matrixrgb_clear_screen();                           /**< Clear Screen to prepare for WIN screen */
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,241 :: 		matrixrgb_write_text( " You  Win!", my_color, 10, 0, 0 );  /**< Display WIN Screen */
MOVW	R0, #lo_addr(?lstr3_MatrixRGB_Demo_Project+0)
MOVT	R0, #hi_addr(?lstr3_MatrixRGB_Demo_Project+0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #8
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_write_text+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,243 :: 		while ( wait )
L_display_youwin28:
LDRB	R0, [SP, #7]
CMP	R0, #0
IT	EQ
BEQ	L_display_youwin29
;MatrixRGB_Demo_Project.c,245 :: 		if (Button(&GPIOA_IDR, 0, 1, 1))                /**< Once A0 is pressed, wait for depress, and then exit function */
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_display_youwin30
;MatrixRGB_Demo_Project.c,247 :: 		matrixrgb_clear_screen();
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,248 :: 		while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );
L_display_youwin31:
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L_display_youwin32
IT	AL
BAL	L_display_youwin31
L_display_youwin32:
;MatrixRGB_Demo_Project.c,250 :: 		wait = false;
MOVS	R0, #0
STRB	R0, [SP, #7]
;MatrixRGB_Demo_Project.c,251 :: 		}
L_display_youwin30:
;MatrixRGB_Demo_Project.c,252 :: 		matrixrgb_refresh();                            /**< While nothing is pressed, continue to refresh WIN Screen */
BL	_matrixrgb_refresh+0
;MatrixRGB_Demo_Project.c,253 :: 		}
IT	AL
BAL	L_display_youwin28
L_display_youwin29:
;MatrixRGB_Demo_Project.c,254 :: 		}
L_end_display_youwin:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _display_youwin
_display_youlose:
;MatrixRGB_Demo_Project.c,256 :: 		void display_youlose( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,258 :: 		bool wait = true;
MOVS	R0, #1
STRB	R0, [SP, #7]
;MatrixRGB_Demo_Project.c,260 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
ADD	R0, SP, #4
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Demo_Project.c,262 :: 		matrixrgb_clear_screen();                           /**< Clear Screen to prepare for LOSE screen */
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,263 :: 		matrixrgb_write_text( "You  Lose!", my_color, 10, 0, 0 );   /**< Display LOSE Screen */
MOVW	R0, #lo_addr(?lstr4_MatrixRGB_Demo_Project+0)
MOVT	R0, #hi_addr(?lstr4_MatrixRGB_Demo_Project+0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #10
SUB	SP, SP, #4
ADD	R12, SP, #8
ADD	R11, SP, #0
ADD	R10, R11, #3
BL	___CC2DW+0
BL	_matrixrgb_write_text+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,265 :: 		while ( wait )
L_display_youlose33:
LDRB	R0, [SP, #7]
CMP	R0, #0
IT	EQ
BEQ	L_display_youlose34
;MatrixRGB_Demo_Project.c,267 :: 		if (Button(&GPIOA_IDR, 0, 1, 1))                /**< Once A0 is pressed, wait for depress, and then exit function */
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_display_youlose35
;MatrixRGB_Demo_Project.c,269 :: 		matrixrgb_clear_screen();
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,270 :: 		while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );
L_display_youlose36:
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L_display_youlose37
IT	AL
BAL	L_display_youlose36
L_display_youlose37:
;MatrixRGB_Demo_Project.c,272 :: 		wait = false;
MOVS	R0, #0
STRB	R0, [SP, #7]
;MatrixRGB_Demo_Project.c,273 :: 		}
L_display_youlose35:
;MatrixRGB_Demo_Project.c,274 :: 		matrixrgb_refresh();                            /**< While nothing is pressed, continue to refresh WIN Screen */
BL	_matrixrgb_refresh+0
;MatrixRGB_Demo_Project.c,275 :: 		}
IT	AL
BAL	L_display_youlose33
L_display_youlose34:
;MatrixRGB_Demo_Project.c,276 :: 		}
L_end_display_youlose:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _display_youlose
_display_bonuslevel:
;MatrixRGB_Demo_Project.c,278 :: 		void display_bonuslevel( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,280 :: 		bool wait = true;                                         /**< Clear Screen to prepare for BONUS LEVEL screen */
MOVS	R0, #1
STRB	R0, [SP, #4]
;MatrixRGB_Demo_Project.c,281 :: 		matrixrgb_clear_screen();                                 /**< Display BONUS LEVEL Screen */
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,282 :: 		matrixrgb_image_load(BonusLevelScreen_bmp, 32, 32 );
MOVS	R2, #32
MOVS	R1, #32
MOVW	R0, #lo_addr(_BonusLevelScreen_bmp+0)
MOVT	R0, #hi_addr(_BonusLevelScreen_bmp+0)
BL	_matrixrgb_image_load+0
;MatrixRGB_Demo_Project.c,284 :: 		while ( wait )
L_display_bonuslevel38:
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	EQ
BEQ	L_display_bonuslevel39
;MatrixRGB_Demo_Project.c,286 :: 		if (Button(&GPIOA_IDR, 0, 1, 1))                      /**< Once A0 is pressed, wait for depress, and then exit function */
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	EQ
BEQ	L_display_bonuslevel40
;MatrixRGB_Demo_Project.c,288 :: 		matrixrgb_clear_screen();
BL	_matrixrgb_clear_screen+0
;MatrixRGB_Demo_Project.c,289 :: 		while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );          /**< While nothing is pressed, continue to refresh BONUS LEVEL Screen */
L_display_bonuslevel41:
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #0
IT	NE
BNE	L_display_bonuslevel42
IT	AL
BAL	L_display_bonuslevel41
L_display_bonuslevel42:
;MatrixRGB_Demo_Project.c,291 :: 		wait = false;
MOVS	R0, #0
STRB	R0, [SP, #4]
;MatrixRGB_Demo_Project.c,292 :: 		}
L_display_bonuslevel40:
;MatrixRGB_Demo_Project.c,293 :: 		matrixrgb_refresh();
BL	_matrixrgb_refresh+0
;MatrixRGB_Demo_Project.c,294 :: 		}
IT	AL
BAL	L_display_bonuslevel38
L_display_bonuslevel39:
;MatrixRGB_Demo_Project.c,295 :: 		}
L_end_display_bonuslevel:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _display_bonuslevel
_wait_for_choice:
;MatrixRGB_Demo_Project.c,298 :: 		void wait_for_choice( void )
;MatrixRGB_Demo_Project.c,300 :: 		bool waiting = true;
;MatrixRGB_Demo_Project.c,321 :: 		g_ball_speed = 1;                                           /**< If AUTOPLAY is defined, ball speed is set to 2 */
MOVS	R1, #1
MOVW	R0, #lo_addr(_g_ball_speed+0)
MOVT	R0, #hi_addr(_g_ball_speed+0)
STRH	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,323 :: 		}
L_end_wait_for_choice:
BX	LR
; end of _wait_for_choice
_set_option:
;MatrixRGB_Demo_Project.c,325 :: 		void set_option( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,329 :: 		adc_pos = ADC1_Get_Sample(3);
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_pos+0)
MOVT	R1, #hi_addr(_adc_pos+0)
STR	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,330 :: 		position = adc_pos / 1365;                                  /**< Three different choices on Main Menu, so: 4096 / 3 = 1365 */
MOV	R0, R1
LDR	R1, [R0, #0]
MOVW	R0, #1365
UDIV	R0, R1, R0
STRB	R0, [SP, #4]
;MatrixRGB_Demo_Project.c,332 :: 		matrixrgb_erase_pixel( 10, 3 );                             /**< Reset colors to red */
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_matrixrgb_erase_pixel+0
;MatrixRGB_Demo_Project.c,333 :: 		matrixrgb_erase_pixel( 17, 3 );
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #17
SXTH	R0, R0
BL	_matrixrgb_erase_pixel+0
;MatrixRGB_Demo_Project.c,334 :: 		matrixrgb_erase_pixel( 24, 3 );
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #24
SXTH	R0, R0
BL	_matrixrgb_erase_pixel+0
;MatrixRGB_Demo_Project.c,335 :: 		matrixrgb_write_pixel( 10, 3 , 1, 0, 0 );
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,336 :: 		matrixrgb_write_pixel( 17, 3 , 1, 0, 0 );
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #17
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,337 :: 		matrixrgb_write_pixel( 24, 3 , 1, 0, 0 );
MOVS	R0, #0
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #24
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,339 :: 		if ( position == EASY )                                     /**< If position given is EASY, fill dot with white. ( Do for every choice ) */
LDRB	R0, [SP, #4]
CMP	R0, #0
IT	NE
BNE	L_set_option43
;MatrixRGB_Demo_Project.c,340 :: 		matrixrgb_write_pixel( 10, 3 , 1, 1, 1 );
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #10
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
IT	AL
BAL	L_set_option44
L_set_option43:
;MatrixRGB_Demo_Project.c,341 :: 		else if ( position == MEDIUM )
LDRB	R0, [SP, #4]
CMP	R0, #1
IT	NE
BNE	L_set_option45
;MatrixRGB_Demo_Project.c,342 :: 		matrixrgb_write_pixel( 17, 3 , 1, 1, 1 );
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #17
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
IT	AL
BAL	L_set_option46
L_set_option45:
;MatrixRGB_Demo_Project.c,343 :: 		else if ( position == HARD )
LDRB	R0, [SP, #4]
CMP	R0, #2
IT	NE
BNE	L_set_option47
;MatrixRGB_Demo_Project.c,344 :: 		matrixrgb_write_pixel( 24, 3 , 1, 1, 1 );
MOVS	R0, #1
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #1
MOVS	R1, #3
SXTH	R1, R1
MOVS	R0, #24
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
L_set_option47:
L_set_option46:
L_set_option44:
;MatrixRGB_Demo_Project.c,346 :: 		}
L_end_set_option:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _set_option
_get_option:
;MatrixRGB_Demo_Project.c,348 :: 		uint8_t get_option( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,353 :: 		adc_pos = ADC1_Get_Sample(3);
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
MOVW	R1, #lo_addr(_adc_pos+0)
MOVT	R1, #hi_addr(_adc_pos+0)
STR	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,354 :: 		position = adc_pos / 1365;                                  /**< Three different choices on Main Menu, so: 4096 / 3 = 1365 */
MOV	R0, R1
LDR	R1, [R0, #0]
MOVW	R0, #1365
UDIV	R0, R1, R0
; position start address is: 4 (R1)
UXTB	R1, R0
;MatrixRGB_Demo_Project.c,356 :: 		if ( position == EASY )
UXTB	R0, R0
CMP	R0, #0
IT	NE
BNE	L_get_option48
; position end address is: 4 (R1)
;MatrixRGB_Demo_Project.c,357 :: 		speed = 500;
MOVW	R0, #500
STRH	R0, [SP, #4]
IT	AL
BAL	L_get_option49
L_get_option48:
;MatrixRGB_Demo_Project.c,358 :: 		else if ( position == MEDIUM )
; position start address is: 4 (R1)
CMP	R1, #1
IT	NE
BNE	L_get_option50
; position end address is: 4 (R1)
;MatrixRGB_Demo_Project.c,359 :: 		speed = 400;
MOVW	R0, #400
STRH	R0, [SP, #4]
IT	AL
BAL	L_get_option51
L_get_option50:
;MatrixRGB_Demo_Project.c,360 :: 		else if ( position == HARD )
; position start address is: 4 (R1)
CMP	R1, #2
IT	NE
BNE	L_get_option52
; position end address is: 4 (R1)
;MatrixRGB_Demo_Project.c,361 :: 		speed = 200;
MOVS	R0, #200
STRH	R0, [SP, #4]
L_get_option52:
L_get_option51:
L_get_option49:
;MatrixRGB_Demo_Project.c,363 :: 		return speed;                                               /**< Return speed of ball depending on the choice by user */
LDRH	R0, [SP, #4]
;MatrixRGB_Demo_Project.c,364 :: 		}
L_end_get_option:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _get_option
_display_main_menu:
;MatrixRGB_Demo_Project.c,366 :: 		void display_main_menu( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,368 :: 		uint8_t i = 0;
;MatrixRGB_Demo_Project.c,370 :: 		matrixrgb_image_load( NewMainMenuBreakoutScreen_bmp, 32, 32 );   /**< Displays Main Menu Screen */
MOVS	R2, #32
MOVS	R1, #32
MOVW	R0, #lo_addr(_NewMainMenuBreakoutScreen_bmp+0)
MOVT	R0, #hi_addr(_NewMainMenuBreakoutScreen_bmp+0)
BL	_matrixrgb_image_load+0
;MatrixRGB_Demo_Project.c,373 :: 		}
L_end_display_main_menu:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _display_main_menu
_is_game_over:
;MatrixRGB_Demo_Project.c,375 :: 		bool is_game_over( void )
;MatrixRGB_Demo_Project.c,379 :: 		for ( i = 0; i < 48; i++ )                /**< Checks if ALL of the bricks are, active == false */
; i start address is: 8 (R2)
MOVS	R2, #0
; i end address is: 8 (R2)
L_is_game_over53:
; i start address is: 8 (R2)
CMP	R2, #48
IT	CS
BCS	L_is_game_over54
;MatrixRGB_Demo_Project.c,381 :: 		if ( bricks[i].active == true )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #5
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_is_game_over56
; i end address is: 8 (R2)
;MatrixRGB_Demo_Project.c,382 :: 		return true;
MOVS	R0, #1
IT	AL
BAL	L_end_is_game_over
L_is_game_over56:
;MatrixRGB_Demo_Project.c,379 :: 		for ( i = 0; i < 48; i++ )                /**< Checks if ALL of the bricks are, active == false */
; i start address is: 8 (R2)
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,383 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_is_game_over53
L_is_game_over54:
;MatrixRGB_Demo_Project.c,384 :: 		return false;
MOVS	R0, #0
;MatrixRGB_Demo_Project.c,385 :: 		}
L_end_is_game_over:
BX	LR
; end of _is_game_over
_set_ball_pos:
;MatrixRGB_Demo_Project.c,387 :: 		void set_ball_pos( uint8_t vector_amount )
; vector_amount start address is: 0 (R0)
; vector_amount end address is: 0 (R0)
; vector_amount start address is: 0 (R0)
;MatrixRGB_Demo_Project.c,389 :: 		if ( ball_dir_vert == UP )                                  /**< If the ball is traveling UP, the row is decremented */
MOVW	R1, #lo_addr(_ball_dir_vert+0)
MOVT	R1, #hi_addr(_ball_dir_vert+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_set_ball_pos57
;MatrixRGB_Demo_Project.c,390 :: 		ball_curr_pos.row--;
MOVW	R2, #lo_addr(_ball_curr_pos+0)
MOVT	R2, #hi_addr(_ball_curr_pos+0)
LDRB	R1, [R2, #0]
SUBS	R1, R1, #1
STRB	R1, [R2, #0]
IT	AL
BAL	L_set_ball_pos58
L_set_ball_pos57:
;MatrixRGB_Demo_Project.c,391 :: 		else if ( ball_dir_vert == DOWN )                           /**< If the ball is traveling DOWN, the row is incremented */
MOVW	R1, #lo_addr(_ball_dir_vert+0)
MOVT	R1, #hi_addr(_ball_dir_vert+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_set_ball_pos59
;MatrixRGB_Demo_Project.c,392 :: 		ball_curr_pos.row++;
MOVW	R2, #lo_addr(_ball_curr_pos+0)
MOVT	R2, #hi_addr(_ball_curr_pos+0)
LDRB	R1, [R2, #0]
ADDS	R1, R1, #1
STRB	R1, [R2, #0]
L_set_ball_pos59:
L_set_ball_pos58:
;MatrixRGB_Demo_Project.c,394 :: 		if ( ball_dir_horiz == LEFT )                               /**< If the ball is traveling LEFT, the column is decremented */
MOVW	R1, #lo_addr(_ball_dir_horiz+0)
MOVT	R1, #hi_addr(_ball_dir_horiz+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	NE
BNE	L_set_ball_pos60
;MatrixRGB_Demo_Project.c,395 :: 		ball_curr_pos.col -= vector_amount;
MOVW	R2, #lo_addr(_ball_curr_pos+1)
MOVT	R2, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R2, #0]
SUB	R1, R1, R0
; vector_amount end address is: 0 (R0)
STRB	R1, [R2, #0]
IT	AL
BAL	L_set_ball_pos61
L_set_ball_pos60:
;MatrixRGB_Demo_Project.c,396 :: 		else if ( ball_dir_horiz == RIGHT )                         /**< If the ball is traveling RIGHT, the column is incremented */
; vector_amount start address is: 0 (R0)
MOVW	R1, #lo_addr(_ball_dir_horiz+0)
MOVT	R1, #hi_addr(_ball_dir_horiz+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_set_ball_pos62
;MatrixRGB_Demo_Project.c,397 :: 		ball_curr_pos.col += vector_amount;
MOVW	R2, #lo_addr(_ball_curr_pos+1)
MOVT	R2, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R2, #0]
ADDS	R1, R1, R0
; vector_amount end address is: 0 (R0)
STRB	R1, [R2, #0]
L_set_ball_pos62:
L_set_ball_pos61:
;MatrixRGB_Demo_Project.c,399 :: 		if ( ball_curr_pos.col == 0 + offset || ball_curr_pos.col == ( 0 + offset - 1) || ball_curr_pos.col == 255 )   /**< Checks the Left side of screen boundary, 255 means it went past 0. ( When Vector amount is 2 ) */
MOVW	R1, #lo_addr(_offset+0)
MOVT	R1, #hi_addr(_offset+0)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__set_ball_pos498
MOVW	R1, #lo_addr(_offset+0)
MOVT	R1, #hi_addr(_offset+0)
LDRB	R1, [R1, #0]
SUBS	R2, R1, #1
SXTH	R2, R2
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__set_ball_pos497
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R1, #0]
CMP	R1, #255
IT	EQ
BEQ	L__set_ball_pos496
IT	AL
BAL	L_set_ball_pos65
L__set_ball_pos498:
L__set_ball_pos497:
L__set_ball_pos496:
;MatrixRGB_Demo_Project.c,401 :: 		ball_curr_pos.col = 0 + offset;
MOVW	R1, #lo_addr(_offset+0)
MOVT	R1, #hi_addr(_offset+0)
LDRB	R2, [R1, #0]
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
STRB	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,402 :: 		ball_dir_horiz = RIGHT;
MOVS	R2, #1
MOVW	R1, #lo_addr(_ball_dir_horiz+0)
MOVT	R1, #hi_addr(_ball_dir_horiz+0)
STRB	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,403 :: 		}
IT	AL
BAL	L_set_ball_pos66
L_set_ball_pos65:
;MatrixRGB_Demo_Project.c,404 :: 		else if ( ball_curr_pos.col == 31 + offset || ball_curr_pos.col == 32 + offset )  /**< Checks the Right side of screen boundary */
MOVW	R1, #lo_addr(_offset+0)
MOVT	R1, #hi_addr(_offset+0)
LDRB	R1, [R1, #0]
ADDW	R2, R1, #31
SXTH	R2, R2
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__set_ball_pos500
MOVW	R1, #lo_addr(_offset+0)
MOVT	R1, #hi_addr(_offset+0)
LDRB	R1, [R1, #0]
ADDW	R2, R1, #32
SXTH	R2, R2
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R1, #0]
CMP	R1, R2
IT	EQ
BEQ	L__set_ball_pos499
IT	AL
BAL	L_set_ball_pos69
L__set_ball_pos500:
L__set_ball_pos499:
;MatrixRGB_Demo_Project.c,406 :: 		ball_curr_pos.col = 31 + offset;
MOVW	R1, #lo_addr(_offset+0)
MOVT	R1, #hi_addr(_offset+0)
LDRB	R1, [R1, #0]
ADDW	R2, R1, #31
MOVW	R1, #lo_addr(_ball_curr_pos+1)
MOVT	R1, #hi_addr(_ball_curr_pos+1)
STRB	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,407 :: 		ball_dir_horiz = LEFT;
MOVS	R2, #0
MOVW	R1, #lo_addr(_ball_dir_horiz+0)
MOVT	R1, #hi_addr(_ball_dir_horiz+0)
STRB	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,408 :: 		}
L_set_ball_pos69:
L_set_ball_pos66:
;MatrixRGB_Demo_Project.c,409 :: 		}
L_end_set_ball_pos:
BX	LR
; end of _set_ball_pos
_set_vector:
;MatrixRGB_Demo_Project.c,411 :: 		void set_vector( uint8_t *amount )
; amount start address is: 0 (R0)
; amount end address is: 0 (R0)
; amount start address is: 0 (R0)
;MatrixRGB_Demo_Project.c,413 :: 		if ( player_surface == MIDDLE_SURFACE )                   /**< If the last surface of the player hit was middle, vector is normal */
MOVW	R1, #lo_addr(_player_surface+0)
MOVT	R1, #hi_addr(_player_surface+0)
LDRB	R1, [R1, #0]
CMP	R1, #1
IT	NE
BNE	L_set_vector70
;MatrixRGB_Demo_Project.c,415 :: 		*amount = 1;
MOVS	R1, #1
STRB	R1, [R0, #0]
; amount end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,416 :: 		ball_speed = g_ball_speed;
MOVW	R1, #lo_addr(_g_ball_speed+0)
MOVT	R1, #hi_addr(_g_ball_speed+0)
LDRH	R2, [R1, #0]
MOVW	R1, #lo_addr(_ball_speed+0)
MOVT	R1, #hi_addr(_ball_speed+0)
STRH	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,417 :: 		}
IT	AL
BAL	L_set_vector71
L_set_vector70:
;MatrixRGB_Demo_Project.c,418 :: 		else if ( player_surface == LEFT_SURFACE || player_surface == RIGHT_SURFACE )      /**< If the last surface of the player hit was on a side, vector is 2 */
; amount start address is: 0 (R0)
MOVW	R1, #lo_addr(_player_surface+0)
MOVT	R1, #hi_addr(_player_surface+0)
LDRB	R1, [R1, #0]
CMP	R1, #0
IT	EQ
BEQ	L__set_vector356
MOVW	R1, #lo_addr(_player_surface+0)
MOVT	R1, #hi_addr(_player_surface+0)
LDRB	R1, [R1, #0]
CMP	R1, #2
IT	EQ
BEQ	L__set_vector355
; amount end address is: 0 (R0)
IT	AL
BAL	L_set_vector74
L__set_vector356:
; amount start address is: 0 (R0)
L__set_vector355:
;MatrixRGB_Demo_Project.c,420 :: 		*amount = 2;
MOVS	R1, #2
STRB	R1, [R0, #0]
; amount end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,421 :: 		ball_speed = g_ball_speed + 5;                                                 /**< Slows down ( normalizes ) speed  */
MOVW	R1, #lo_addr(_g_ball_speed+0)
MOVT	R1, #hi_addr(_g_ball_speed+0)
LDRH	R1, [R1, #0]
ADDS	R2, R1, #5
MOVW	R1, #lo_addr(_ball_speed+0)
MOVT	R1, #hi_addr(_ball_speed+0)
STRH	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,422 :: 		}
L_set_vector74:
L_set_vector71:
;MatrixRGB_Demo_Project.c,423 :: 		}
L_end_set_vector:
BX	LR
; end of _set_vector
_erase_brick:
;MatrixRGB_Demo_Project.c,425 :: 		void erase_brick( uint8_t number )
SUB	SP, SP, #12
STR	LR, [SP, #0]
STRB	R0, [SP, #8]
;MatrixRGB_Demo_Project.c,429 :: 		for ( i = 0; i < 4; i++ )                 /**< Erases block with index "number" */
MOVS	R1, #0
STRB	R1, [SP, #4]
L_erase_brick75:
LDRB	R1, [SP, #4]
CMP	R1, #4
IT	CS
BCS	L_erase_brick76
;MatrixRGB_Demo_Project.c,431 :: 		matrixrgb_erase_pixel( bricks[number].row, ( bricks[number].col + i ) );
LDRB	R2, [SP, #8]
MOVS	R1, #6
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_bricks+0)
MOVT	R1, #hi_addr(_bricks+0)
ADDS	R3, R1, R2
ADDS	R1, R3, #4
LDRB	R2, [R1, #0]
LDRB	R1, [SP, #4]
ADDS	R2, R2, R1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
SXTH	R0, R1
SXTH	R1, R2
BL	_matrixrgb_erase_pixel+0
;MatrixRGB_Demo_Project.c,432 :: 		matrixrgb_erase_pixel( ( bricks[number].row + 1 ), ( bricks[number].col + i ) );
LDRB	R2, [SP, #8]
MOVS	R1, #6
MULS	R2, R1, R2
MOVW	R1, #lo_addr(_bricks+0)
MOVT	R1, #hi_addr(_bricks+0)
ADDS	R3, R1, R2
ADDS	R1, R3, #4
LDRB	R2, [R1, #0]
LDRB	R1, [SP, #4]
ADDS	R2, R2, R1
ADDS	R1, R3, #3
LDRB	R1, [R1, #0]
ADDS	R1, R1, #1
SXTH	R0, R1
SXTH	R1, R2
BL	_matrixrgb_erase_pixel+0
;MatrixRGB_Demo_Project.c,429 :: 		for ( i = 0; i < 4; i++ )                 /**< Erases block with index "number" */
LDRB	R1, [SP, #4]
ADDS	R1, R1, #1
STRB	R1, [SP, #4]
;MatrixRGB_Demo_Project.c,433 :: 		}
IT	AL
BAL	L_erase_brick75
L_erase_brick76:
;MatrixRGB_Demo_Project.c,435 :: 		}
L_end_erase_brick:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _erase_brick
_is_brick_hit:
;MatrixRGB_Demo_Project.c,437 :: 		bool is_brick_hit( void ) /**< Big function. Took alot of checks to efficiently check if bricks are hit. Works well */
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,440 :: 		bool is_hit = false;
; is_hit start address is: 12 (R3)
MOVS	R3, #0
;MatrixRGB_Demo_Project.c,442 :: 		for ( i = 0; i < 48; i++ )       /**< Checks every brick in the array to see if it is active, then if it has been hit */
; i start address is: 8 (R2)
MOVS	R2, #0
; is_hit end address is: 12 (R3)
; i end address is: 8 (R2)
L_is_brick_hit78:
; i start address is: 8 (R2)
; is_hit start address is: 12 (R3)
CMP	R2, #48
IT	CS
BCS	L_is_brick_hit79
;MatrixRGB_Demo_Project.c,444 :: 		if ( bricks[i].active )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #5
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__is_brick_hit490
;MatrixRGB_Demo_Project.c,446 :: 		if ( player_surface == MIDDLE_SURFACE )   /**< Hits depend on whether the vector is 1 ( MIDDLE_SURFACE ) or 2 ( RIGHT_SURFACE, LEFT_SURFACE ) */
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L_is_brick_hit82
;MatrixRGB_Demo_Project.c,448 :: 		if ( ball_dir_vert == UP )
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_is_brick_hit83
;MatrixRGB_Demo_Project.c,450 :: 		if ( ball_dir_horiz == LEFT )
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_is_brick_hit84
;MatrixRGB_Demo_Project.c,452 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col + 4 )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit399
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit398
IT	AL
BAL	L_is_brick_hit89
L__is_brick_hit399:
L__is_brick_hit398:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit400
; is_hit end address is: 12 (R3)
L__is_brick_hit396:
;MatrixRGB_Demo_Project.c,454 :: 		brick_side_horiz = RIGHT_SIDE;
MOVS	R1, #2
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,455 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,456 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,457 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,458 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,459 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,460 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit90
L_is_brick_hit89:
;MatrixRGB_Demo_Project.c,452 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col + 4 )
; is_hit start address is: 12 (R3)
L__is_brick_hit400:
;MatrixRGB_Demo_Project.c,461 :: 		else if ( ball_curr_pos.row == bricks[i].row + 2 && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit480
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit405
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit404
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit403
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit402
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit401
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit95
L__is_brick_hit405:
L__is_brick_hit404:
L__is_brick_hit403:
L__is_brick_hit402:
L__is_brick_hit401:
L__is_brick_hit394:
;MatrixRGB_Demo_Project.c,463 :: 		brick_side_vert = BOTTOM_SIDE;
MOVS	R1, #1
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,464 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,465 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,466 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,467 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,468 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,469 :: 		}
L_is_brick_hit95:
;MatrixRGB_Demo_Project.c,461 :: 		else if ( ball_curr_pos.row == bricks[i].row + 2 && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L__is_brick_hit406
L__is_brick_hit480:
UXTB	R0, R3
L__is_brick_hit406:
;MatrixRGB_Demo_Project.c,469 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit90:
;MatrixRGB_Demo_Project.c,470 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit96
L_is_brick_hit84:
;MatrixRGB_Demo_Project.c,471 :: 		else if ( ball_dir_horiz == RIGHT )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__is_brick_hit482
;MatrixRGB_Demo_Project.c,473 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col - 1 )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit408
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit407
IT	AL
BAL	L_is_brick_hit102
L__is_brick_hit408:
L__is_brick_hit407:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit409
; is_hit end address is: 12 (R3)
L__is_brick_hit392:
;MatrixRGB_Demo_Project.c,475 :: 		brick_side_horiz = LEFT_SIDE;
MOVS	R1, #3
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,476 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,477 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,478 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,479 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,480 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,481 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit103
L_is_brick_hit102:
;MatrixRGB_Demo_Project.c,473 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col - 1 )
; is_hit start address is: 12 (R3)
L__is_brick_hit409:
;MatrixRGB_Demo_Project.c,482 :: 		else if ( ball_curr_pos.row == bricks[i].row + 2 && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit481
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit414
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit413
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit412
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit411
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit410
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit108
L__is_brick_hit414:
L__is_brick_hit413:
L__is_brick_hit412:
L__is_brick_hit411:
L__is_brick_hit410:
L__is_brick_hit390:
;MatrixRGB_Demo_Project.c,484 :: 		brick_side_vert = BOTTOM_SIDE;
MOVS	R1, #1
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,485 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,486 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,487 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,488 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,489 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,490 :: 		}
L_is_brick_hit108:
;MatrixRGB_Demo_Project.c,482 :: 		else if ( ball_curr_pos.row == bricks[i].row + 2 && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L__is_brick_hit415
L__is_brick_hit481:
UXTB	R0, R3
L__is_brick_hit415:
;MatrixRGB_Demo_Project.c,490 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit103:
;MatrixRGB_Demo_Project.c,492 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit97
L__is_brick_hit482:
;MatrixRGB_Demo_Project.c,471 :: 		else if ( ball_dir_horiz == RIGHT )
UXTB	R0, R3
;MatrixRGB_Demo_Project.c,492 :: 		}
L_is_brick_hit97:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit96:
;MatrixRGB_Demo_Project.c,493 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit109
L_is_brick_hit83:
;MatrixRGB_Demo_Project.c,494 :: 		else if ( ball_dir_vert == DOWN )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__is_brick_hit486
;MatrixRGB_Demo_Project.c,496 :: 		if ( ball_dir_horiz == LEFT )
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_is_brick_hit111
;MatrixRGB_Demo_Project.c,498 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col + 4 )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit417
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit416
IT	AL
BAL	L_is_brick_hit116
L__is_brick_hit417:
L__is_brick_hit416:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit418
; is_hit end address is: 12 (R3)
L__is_brick_hit388:
;MatrixRGB_Demo_Project.c,500 :: 		brick_side_horiz = RIGHT_SIDE;
MOVS	R1, #2
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,501 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,502 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,503 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,504 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,505 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,506 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit117
L_is_brick_hit116:
;MatrixRGB_Demo_Project.c,498 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col + 4 )
; is_hit start address is: 12 (R3)
L__is_brick_hit418:
;MatrixRGB_Demo_Project.c,507 :: 		else if ( ball_curr_pos.row == bricks[i].row - 1 && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit483
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit423
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit422
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit421
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit420
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit419
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit122
L__is_brick_hit423:
L__is_brick_hit422:
L__is_brick_hit421:
L__is_brick_hit420:
L__is_brick_hit419:
L__is_brick_hit386:
;MatrixRGB_Demo_Project.c,509 :: 		brick_side_vert = TOP_SIDE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,510 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,511 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,512 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,513 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,514 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,515 :: 		}
L_is_brick_hit122:
;MatrixRGB_Demo_Project.c,507 :: 		else if ( ball_curr_pos.row == bricks[i].row - 1 && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L__is_brick_hit424
L__is_brick_hit483:
UXTB	R0, R3
L__is_brick_hit424:
;MatrixRGB_Demo_Project.c,515 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit117:
;MatrixRGB_Demo_Project.c,516 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit123
L_is_brick_hit111:
;MatrixRGB_Demo_Project.c,517 :: 		else if ( ball_dir_horiz == RIGHT )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__is_brick_hit485
;MatrixRGB_Demo_Project.c,519 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col - 1 )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit426
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit425
IT	AL
BAL	L_is_brick_hit129
L__is_brick_hit426:
L__is_brick_hit425:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit427
; is_hit end address is: 12 (R3)
L__is_brick_hit384:
;MatrixRGB_Demo_Project.c,521 :: 		brick_side_horiz = LEFT_SIDE;
MOVS	R1, #3
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,522 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,523 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,524 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,525 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,526 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,527 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit130
L_is_brick_hit129:
;MatrixRGB_Demo_Project.c,519 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col - 1 )
; is_hit start address is: 12 (R3)
L__is_brick_hit427:
;MatrixRGB_Demo_Project.c,528 :: 		else if ( ball_curr_pos.row == bricks[i].row - 1 && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L__is_brick_hit484
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit432
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit431
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit430
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit429
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit428
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit135
L__is_brick_hit432:
L__is_brick_hit431:
L__is_brick_hit430:
L__is_brick_hit429:
L__is_brick_hit428:
L__is_brick_hit382:
;MatrixRGB_Demo_Project.c,530 :: 		brick_side_vert = TOP_SIDE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,531 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,532 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,533 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,534 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,535 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,536 :: 		}
L_is_brick_hit135:
;MatrixRGB_Demo_Project.c,528 :: 		else if ( ball_curr_pos.row == bricks[i].row - 1 && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L__is_brick_hit433
L__is_brick_hit484:
UXTB	R0, R3
L__is_brick_hit433:
;MatrixRGB_Demo_Project.c,536 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit130:
;MatrixRGB_Demo_Project.c,538 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit124
L__is_brick_hit485:
;MatrixRGB_Demo_Project.c,517 :: 		else if ( ball_dir_horiz == RIGHT )
UXTB	R0, R3
;MatrixRGB_Demo_Project.c,538 :: 		}
L_is_brick_hit124:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit123:
;MatrixRGB_Demo_Project.c,539 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit110
L__is_brick_hit486:
;MatrixRGB_Demo_Project.c,494 :: 		else if ( ball_dir_vert == DOWN )
UXTB	R0, R3
;MatrixRGB_Demo_Project.c,539 :: 		}
L_is_brick_hit110:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit109:
;MatrixRGB_Demo_Project.c,540 :: 		}
; is_hit start address is: 0 (R0)
UXTB	R3, R0
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit136
L_is_brick_hit82:
;MatrixRGB_Demo_Project.c,541 :: 		else if ( player_surface == LEFT_SURFACE || player_surface == RIGHT_SURFACE )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	EQ
BEQ	L__is_brick_hit435
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
LDRB	R0, [R0, #0]
CMP	R0, #2
IT	EQ
BEQ	L__is_brick_hit434
UXTB	R0, R3
IT	AL
BAL	L_is_brick_hit139
L__is_brick_hit435:
L__is_brick_hit434:
;MatrixRGB_Demo_Project.c,543 :: 		if ( ball_dir_vert == UP )
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_is_brick_hit140
;MatrixRGB_Demo_Project.c,545 :: 		if ( ball_dir_horiz == LEFT )
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_is_brick_hit141
;MatrixRGB_Demo_Project.c,547 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col + 4 || ball_curr_pos.col == bricks[i].col + 3 ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit437
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit436
IT	AL
BAL	L_is_brick_hit148
L__is_brick_hit437:
L__is_brick_hit436:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit439
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit438
IT	AL
BAL	L_is_brick_hit148
; is_hit end address is: 12 (R3)
L__is_brick_hit439:
L__is_brick_hit438:
L__is_brick_hit378:
;MatrixRGB_Demo_Project.c,549 :: 		brick_side_horiz = RIGHT_SIDE;
MOVS	R1, #2
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,550 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,551 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,552 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,553 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,554 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,555 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit149
L_is_brick_hit148:
;MatrixRGB_Demo_Project.c,556 :: 		else if ( ( ball_curr_pos.row == bricks[i].row + 2 || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
; is_hit start address is: 12 (R3)
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit441
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit440
UXTB	R0, R3
IT	AL
BAL	L_is_brick_hit156
L__is_brick_hit441:
L__is_brick_hit440:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit446
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit445
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit444
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit443
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit442
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit156
L__is_brick_hit446:
L__is_brick_hit445:
L__is_brick_hit444:
L__is_brick_hit443:
L__is_brick_hit442:
L__is_brick_hit375:
;MatrixRGB_Demo_Project.c,558 :: 		brick_side_vert = BOTTOM_SIDE;
MOVS	R1, #1
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,559 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,560 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,561 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,562 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,563 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,564 :: 		}
L_is_brick_hit156:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit149:
;MatrixRGB_Demo_Project.c,565 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit157
L_is_brick_hit141:
;MatrixRGB_Demo_Project.c,566 :: 		else if ( ball_dir_horiz == RIGHT )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__is_brick_hit487
;MatrixRGB_Demo_Project.c,568 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit448
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit447
IT	AL
BAL	L_is_brick_hit165
L__is_brick_hit448:
L__is_brick_hit447:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit450
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit449
IT	AL
BAL	L_is_brick_hit165
; is_hit end address is: 12 (R3)
L__is_brick_hit450:
L__is_brick_hit449:
L__is_brick_hit372:
;MatrixRGB_Demo_Project.c,570 :: 		brick_side_horiz = LEFT_SIDE;
MOVS	R1, #3
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,571 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,572 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,573 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,574 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,575 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,576 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit166
L_is_brick_hit165:
;MatrixRGB_Demo_Project.c,577 :: 		else if ( ( ball_curr_pos.row == bricks[i].row + 2 || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
; is_hit start address is: 12 (R3)
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit452
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit451
UXTB	R0, R3
IT	AL
BAL	L_is_brick_hit173
L__is_brick_hit452:
L__is_brick_hit451:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit457
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit456
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit455
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit454
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit453
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit173
L__is_brick_hit457:
L__is_brick_hit456:
L__is_brick_hit455:
L__is_brick_hit454:
L__is_brick_hit453:
L__is_brick_hit369:
;MatrixRGB_Demo_Project.c,579 :: 		brick_side_vert = BOTTOM_SIDE;
MOVS	R1, #1
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,580 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,581 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,582 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,583 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,584 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,585 :: 		}
L_is_brick_hit173:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit166:
;MatrixRGB_Demo_Project.c,587 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit158
L__is_brick_hit487:
;MatrixRGB_Demo_Project.c,566 :: 		else if ( ball_dir_horiz == RIGHT )
UXTB	R0, R3
;MatrixRGB_Demo_Project.c,587 :: 		}
L_is_brick_hit158:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit157:
;MatrixRGB_Demo_Project.c,588 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit174
L_is_brick_hit140:
;MatrixRGB_Demo_Project.c,589 :: 		else if ( ball_dir_vert == DOWN )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__is_brick_hit489
;MatrixRGB_Demo_Project.c,591 :: 		if ( ball_dir_horiz == LEFT )
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_is_brick_hit176
;MatrixRGB_Demo_Project.c,593 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col + 4 || ball_curr_pos.col == bricks[i].col + 3 ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit459
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit458
IT	AL
BAL	L_is_brick_hit183
L__is_brick_hit459:
L__is_brick_hit458:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit461
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit460
IT	AL
BAL	L_is_brick_hit183
; is_hit end address is: 12 (R3)
L__is_brick_hit461:
L__is_brick_hit460:
L__is_brick_hit366:
;MatrixRGB_Demo_Project.c,595 :: 		brick_side_horiz = RIGHT_SIDE;
MOVS	R1, #2
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,596 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,597 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,598 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,599 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,600 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,601 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit184
L_is_brick_hit183:
;MatrixRGB_Demo_Project.c,602 :: 		else if ( ( ball_curr_pos.row == bricks[i].row - 1 || ball_curr_pos.row == bricks[i].row ) && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
; is_hit start address is: 12 (R3)
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit463
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit462
UXTB	R0, R3
IT	AL
BAL	L_is_brick_hit191
L__is_brick_hit463:
L__is_brick_hit462:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit468
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit467
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit466
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit465
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit464
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit191
L__is_brick_hit468:
L__is_brick_hit467:
L__is_brick_hit466:
L__is_brick_hit465:
L__is_brick_hit464:
L__is_brick_hit363:
;MatrixRGB_Demo_Project.c,604 :: 		brick_side_vert = TOP_SIDE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,605 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,606 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,607 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,608 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,609 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,610 :: 		}
L_is_brick_hit191:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit184:
;MatrixRGB_Demo_Project.c,611 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit192
L_is_brick_hit176:
;MatrixRGB_Demo_Project.c,612 :: 		else if ( ball_dir_horiz == RIGHT )
; is_hit start address is: 12 (R3)
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
LDRB	R0, [R0, #0]
CMP	R0, #1
IT	NE
BNE	L__is_brick_hit488
;MatrixRGB_Demo_Project.c,614 :: 		if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col ) )
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit470
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit469
IT	AL
BAL	L_is_brick_hit200
L__is_brick_hit470:
L__is_brick_hit469:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit472
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit471
IT	AL
BAL	L_is_brick_hit200
; is_hit end address is: 12 (R3)
L__is_brick_hit472:
L__is_brick_hit471:
L__is_brick_hit360:
;MatrixRGB_Demo_Project.c,616 :: 		brick_side_horiz = LEFT_SIDE;
MOVS	R1, #3
MOVW	R0, #lo_addr(_brick_side_horiz+0)
MOVT	R0, #hi_addr(_brick_side_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,617 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,618 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,619 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,620 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,621 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
;MatrixRGB_Demo_Project.c,622 :: 		}
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit201
L_is_brick_hit200:
;MatrixRGB_Demo_Project.c,623 :: 		else if ( ( ball_curr_pos.row == bricks[i].row - 1 || ball_curr_pos.row == bricks[i].row ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
; is_hit start address is: 12 (R3)
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit474
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #3
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit473
UXTB	R0, R3
IT	AL
BAL	L_is_brick_hit208
L__is_brick_hit474:
L__is_brick_hit473:
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
SUBS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit479
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit478
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #1
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit477
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit476
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	EQ
BEQ	L__is_brick_hit475
UXTB	R0, R3
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit208
L__is_brick_hit479:
L__is_brick_hit478:
L__is_brick_hit477:
L__is_brick_hit476:
L__is_brick_hit475:
L__is_brick_hit357:
;MatrixRGB_Demo_Project.c,625 :: 		brick_side_vert = TOP_SIDE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_brick_side_vert+0)
MOVT	R0, #hi_addr(_brick_side_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,626 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,627 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,628 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R2
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,629 :: 		erase_brick( i );
STRB	R2, [SP, #4]
UXTB	R0, R2
BL	_erase_brick+0
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,630 :: 		is_hit = true;
; is_hit start address is: 0 (R0)
MOVS	R0, #1
; is_hit end address is: 0 (R0)
;MatrixRGB_Demo_Project.c,631 :: 		}
L_is_brick_hit208:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit201:
;MatrixRGB_Demo_Project.c,633 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit193
L__is_brick_hit488:
;MatrixRGB_Demo_Project.c,612 :: 		else if ( ball_dir_horiz == RIGHT )
UXTB	R0, R3
;MatrixRGB_Demo_Project.c,633 :: 		}
L_is_brick_hit193:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit192:
;MatrixRGB_Demo_Project.c,634 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
IT	AL
BAL	L_is_brick_hit175
L__is_brick_hit489:
;MatrixRGB_Demo_Project.c,589 :: 		else if ( ball_dir_vert == DOWN )
UXTB	R0, R3
;MatrixRGB_Demo_Project.c,634 :: 		}
L_is_brick_hit175:
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit174:
;MatrixRGB_Demo_Project.c,636 :: 		}
; is_hit start address is: 0 (R0)
; is_hit end address is: 0 (R0)
L_is_brick_hit139:
; is_hit start address is: 0 (R0)
UXTB	R3, R0
; is_hit end address is: 0 (R0)
L_is_brick_hit136:
;MatrixRGB_Demo_Project.c,637 :: 		}
; is_hit start address is: 12 (R3)
; is_hit end address is: 12 (R3)
IT	AL
BAL	L_is_brick_hit81
L__is_brick_hit490:
;MatrixRGB_Demo_Project.c,444 :: 		if ( bricks[i].active )
;MatrixRGB_Demo_Project.c,637 :: 		}
L_is_brick_hit81:
;MatrixRGB_Demo_Project.c,442 :: 		for ( i = 0; i < 48; i++ )       /**< Checks every brick in the array to see if it is active, then if it has been hit */
; is_hit start address is: 12 (R3)
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,638 :: 		}
; i end address is: 8 (R2)
IT	AL
BAL	L_is_brick_hit78
L_is_brick_hit79:
;MatrixRGB_Demo_Project.c,640 :: 		return is_hit;
UXTB	R0, R3
; is_hit end address is: 12 (R3)
;MatrixRGB_Demo_Project.c,641 :: 		}
L_end_is_brick_hit:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _is_brick_hit
_is_player_there:
;MatrixRGB_Demo_Project.c,643 :: 		bool is_player_there( void )
;MatrixRGB_Demo_Project.c,646 :: 		ball_curr_pos.col < ( player_curr_pos.col + 6 ) )
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	CC
BCC	L__is_player_there493
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #6
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L__is_player_there492
L__is_player_there491:
;MatrixRGB_Demo_Project.c,648 :: 		if ( ball_curr_pos.col >= ( player_curr_pos.col + 4 ) )       /**< Checks if the ball hit the middle, left or right of the player */
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #4
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L_is_player_there212
;MatrixRGB_Demo_Project.c,649 :: 		player_surface = RIGHT_SURFACE;
MOVS	R1, #2
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_is_player_there213
L_is_player_there212:
;MatrixRGB_Demo_Project.c,650 :: 		else if ( ball_curr_pos.col > ( player_curr_pos.col + 2 ) )
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #2
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	LE
BLE	L_is_player_there214
;MatrixRGB_Demo_Project.c,651 :: 		player_surface = MIDDLE_SURFACE;
MOVS	R1, #1
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_is_player_there215
L_is_player_there214:
;MatrixRGB_Demo_Project.c,653 :: 		player_surface = LEFT_SURFACE;
MOVS	R1, #0
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
STRB	R1, [R0, #0]
L_is_player_there215:
L_is_player_there213:
;MatrixRGB_Demo_Project.c,654 :: 		return true;
MOVS	R0, #1
IT	AL
BAL	L_end_is_player_there
;MatrixRGB_Demo_Project.c,646 :: 		ball_curr_pos.col < ( player_curr_pos.col + 6 ) )
L__is_player_there493:
L__is_player_there492:
;MatrixRGB_Demo_Project.c,656 :: 		else return false;     /**< If the player was not there, return false, indicating a YOU lose! */
MOVS	R0, #0
;MatrixRGB_Demo_Project.c,658 :: 		}
L_end_is_player_there:
BX	LR
; end of _is_player_there
_check_ball_boundaries:
;MatrixRGB_Demo_Project.c,660 :: 		void check_ball_boundaries( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,662 :: 		if ( ball_curr_pos.row == 0 )           /**< Check Vertical */
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, #0
IT	NE
BNE	L_check_ball_boundaries217
;MatrixRGB_Demo_Project.c,663 :: 		ball_dir_vert = DOWN;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_check_ball_boundaries218
L_check_ball_boundaries217:
;MatrixRGB_Demo_Project.c,664 :: 		else if ( ball_curr_pos.row >= 30 )
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
CMP	R0, #30
IT	CC
BCC	L_check_ball_boundaries219
;MatrixRGB_Demo_Project.c,666 :: 		if ( !is_player_there() )
BL	_is_player_there+0
CMP	R0, #0
IT	NE
BNE	L_check_ball_boundaries220
;MatrixRGB_Demo_Project.c,667 :: 		safe = false;
MOVS	R1, #0
MOVW	R0, #lo_addr(_safe+0)
MOVT	R0, #hi_addr(_safe+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_check_ball_boundaries221
L_check_ball_boundaries220:
;MatrixRGB_Demo_Project.c,669 :: 		ball_dir_vert = UP;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_vert+0)
MOVT	R0, #hi_addr(_ball_dir_vert+0)
STRB	R1, [R0, #0]
L_check_ball_boundaries221:
;MatrixRGB_Demo_Project.c,670 :: 		}
L_check_ball_boundaries219:
L_check_ball_boundaries218:
;MatrixRGB_Demo_Project.c,672 :: 		if ( ball_curr_pos.col == 0 + offset )           /**< Check Horizontal */
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_check_ball_boundaries222
;MatrixRGB_Demo_Project.c,673 :: 		ball_dir_horiz = RIGHT;
MOVS	R1, #1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
IT	AL
BAL	L_check_ball_boundaries223
L_check_ball_boundaries222:
;MatrixRGB_Demo_Project.c,674 :: 		else if ( ball_curr_pos.col == 31 + offset )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #31
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	NE
BNE	L_check_ball_boundaries224
;MatrixRGB_Demo_Project.c,675 :: 		ball_dir_horiz = LEFT;
MOVS	R1, #0
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
L_check_ball_boundaries224:
L_check_ball_boundaries223:
;MatrixRGB_Demo_Project.c,677 :: 		}
L_end_check_ball_boundaries:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _check_ball_boundaries
_move_player:
;MatrixRGB_Demo_Project.c,679 :: 		void move_player( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,684 :: 		for ( i = player_curr_pos.col; i < ( player_curr_pos.col + 6 ); i++ )    /**< First erase and then write */
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
; i start address is: 4 (R1)
LDRB	R1, [R0, #0]
; i end address is: 4 (R1)
L_move_player225:
; i start address is: 4 (R1)
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #6
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_move_player226
;MatrixRGB_Demo_Project.c,685 :: 		matrixrgb_erase_pixel( player_curr_pos.row, i );
MOVW	R0, #lo_addr(_player_curr_pos+0)
MOVT	R0, #hi_addr(_player_curr_pos+0)
LDRB	R0, [R0, #0]
STRB	R1, [SP, #4]
BL	_matrixrgb_erase_pixel+0
LDRB	R1, [SP, #4]
;MatrixRGB_Demo_Project.c,684 :: 		for ( i = player_curr_pos.col; i < ( player_curr_pos.col + 6 ); i++ )    /**< First erase and then write */
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,685 :: 		matrixrgb_erase_pixel( player_curr_pos.row, i );
; i end address is: 4 (R1)
IT	AL
BAL	L_move_player225
L_move_player226:
;MatrixRGB_Demo_Project.c,689 :: 		if ( ball_curr_pos.col < ( 3 + offset ) )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R1, R0, #3
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	GE
BGE	L_move_player228
;MatrixRGB_Demo_Project.c,690 :: 		player_curr_pos.col = 0 + offset;
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
STRB	R1, [R0, #0]
IT	AL
BAL	L_move_player229
L_move_player228:
;MatrixRGB_Demo_Project.c,691 :: 		else if ( ball_curr_pos.col >= ( 29 + offset ) )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #29
SXTH	R1, R1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
CMP	R0, R1
IT	LT
BLT	L_move_player230
;MatrixRGB_Demo_Project.c,692 :: 		player_curr_pos.col = 26 + offset;
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #26
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
STRB	R1, [R0, #0]
IT	AL
BAL	L_move_player231
L_move_player230:
;MatrixRGB_Demo_Project.c,694 :: 		player_curr_pos.col = ball_curr_pos.col - 3;    /**< "-3" to place it always in the middle so vector is almost always 1 */
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R0, [R0, #0]
SUBS	R1, R0, #3
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
STRB	R1, [R0, #0]
L_move_player231:
L_move_player229:
;MatrixRGB_Demo_Project.c,699 :: 		for ( i = player_curr_pos.col; i < ( player_curr_pos.col + 6 ); i++ )    /**< Draw character in new position */
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
; i start address is: 8 (R2)
LDRB	R2, [R0, #0]
; i end address is: 8 (R2)
L_move_player232:
; i start address is: 8 (R2)
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #6
SXTH	R0, R0
CMP	R2, R0
IT	GE
BGE	L_move_player233
;MatrixRGB_Demo_Project.c,700 :: 		matrixrgb_write_pixel( player_curr_pos.row, i, 1, 0, 0 );
MOVS	R1, #0
MOVW	R0, #lo_addr(_player_curr_pos+0)
MOVT	R0, #hi_addr(_player_curr_pos+0)
LDRB	R0, [R0, #0]
STRB	R2, [SP, #4]
PUSH	(R1)
MOVS	R3, #0
UXTB	R1, R2
MOVS	R2, #1
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,699 :: 		for ( i = player_curr_pos.col; i < ( player_curr_pos.col + 6 ); i++ )    /**< Draw character in new position */
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,700 :: 		matrixrgb_write_pixel( player_curr_pos.row, i, 1, 0, 0 );
; i end address is: 8 (R2)
IT	AL
BAL	L_move_player232
L_move_player233:
;MatrixRGB_Demo_Project.c,702 :: 		}
L_end_move_player:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _move_player
_move_ball:
;MatrixRGB_Demo_Project.c,704 :: 		void move_ball( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,708 :: 		set_vector( &amount );                                          /**< If ball hits left or right side of player, increase angle */
ADD	R0, SP, #4
BL	_set_vector+0
;MatrixRGB_Demo_Project.c,710 :: 		matrixrgb_erase_pixel( ball_curr_pos.row, ball_curr_pos.col );  /**< Erase ball from frame */
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
BL	_matrixrgb_erase_pixel+0
;MatrixRGB_Demo_Project.c,711 :: 		if ( is_brick_hit() )                                           /**< If brick is hit, check once more for accuracy, and then check if it was the last brick */
BL	_is_brick_hit+0
CMP	R0, #0
IT	EQ
BEQ	L_move_ball235
;MatrixRGB_Demo_Project.c,713 :: 		is_brick_hit();
BL	_is_brick_hit+0
;MatrixRGB_Demo_Project.c,714 :: 		playing = is_game_over();
BL	_is_game_over+0
MOVW	R1, #lo_addr(_playing+0)
MOVT	R1, #hi_addr(_playing+0)
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,715 :: 		}
L_move_ball235:
;MatrixRGB_Demo_Project.c,716 :: 		check_ball_boundaries();                                        /**< Check to see if we've reached a boundary */
BL	_check_ball_boundaries+0
;MatrixRGB_Demo_Project.c,717 :: 		set_ball_pos( amount );                                         /**< Set balls new position depending on vector value */
LDRB	R0, [SP, #4]
BL	_set_ball_pos+0
;MatrixRGB_Demo_Project.c,718 :: 		matrixrgb_write_pixel( ball_curr_pos.row, ball_curr_pos.col, 1, 1, 1 ); /**< Write New pixel ( ball ) after erasing old */
MOVS	R2, #1
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
LDRB	R1, [R0, #0]
MOVW	R0, #lo_addr(_ball_curr_pos+0)
MOVT	R0, #hi_addr(_ball_curr_pos+0)
LDRB	R0, [R0, #0]
PUSH	(R2)
MOVS	R3, #1
MOVS	R2, #1
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,720 :: 		}
L_end_move_ball:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _move_ball
_setup_ball:
;MatrixRGB_Demo_Project.c,722 :: 		void setup_ball( void )
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,726 :: 		srand( rand_num );
MOVW	R0, #lo_addr(_rand_num+0)
MOVT	R0, #hi_addr(_rand_num+0)
LDRH	R0, [R0, #0]
BL	_srand+0
;MatrixRGB_Demo_Project.c,727 :: 		random_row = ( rand() % 13 ) + 12;          /**< Sets up ball to spawn at random spot: Range 12 - 24  */
BL	_rand+0
MOVS	R2, #13
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
ADDW	R0, R1, #12
; random_row start address is: 16 (R4)
UXTB	R4, R0
;MatrixRGB_Demo_Project.c,728 :: 		random_col = ( rand() % 32 ) + offset;      /**< Sets up ball to spawn at random spot: Range 0 - 31   */
BL	_rand+0
MOVS	R2, #32
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
SXTH	R1, R1
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R1, R0
; random_col start address is: 20 (R5)
UXTB	R5, R0
;MatrixRGB_Demo_Project.c,729 :: 		random_direction = rand() % 2;              /**< Sets up ball to spawn in random direction */
BL	_rand+0
MOVS	R2, #2
SXTH	R2, R2
SDIV	R1, R0, R2
MLS	R1, R2, R1, R0
;MatrixRGB_Demo_Project.c,731 :: 		ball_dir_horiz = random_direction;
UXTB	R1, R1
MOVW	R0, #lo_addr(_ball_dir_horiz+0)
MOVT	R0, #hi_addr(_ball_dir_horiz+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,732 :: 		ball_curr_pos.row = random_row;
MOVW	R3, #lo_addr(_ball_curr_pos+0)
MOVT	R3, #hi_addr(_ball_curr_pos+0)
STRB	R4, [R3, #0]
; random_row end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,733 :: 		ball_curr_pos.col = random_col;
MOVW	R0, #lo_addr(_ball_curr_pos+1)
MOVT	R0, #hi_addr(_ball_curr_pos+1)
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,734 :: 		matrixrgb_write_pixel( ball_curr_pos.row, ball_curr_pos.col, 1, 1, 1 );  /**< Draw ball at random location */
MOVS	R2, #1
UXTB	R1, R5
; random_col end address is: 20 (R5)
MOV	R0, R3
LDRB	R0, [R0, #0]
PUSH	(R2)
MOVS	R3, #1
MOVS	R2, #1
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
;MatrixRGB_Demo_Project.c,735 :: 		}
L_end_setup_ball:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _setup_ball
_setup_gameboard:
;MatrixRGB_Demo_Project.c,737 :: 		void setup_gameboard( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,742 :: 		matrixrgb_set_color( &brick_color, 0, 0, 1 );          /**< Draws entire game board, setting up array of bricks and setting all to active */
ADD	R0, SP, #8
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
BL	_matrixrgb_set_color+0
;MatrixRGB_Demo_Project.c,743 :: 		for ( i = 0 + offset, j = 0; i <= 28 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 16 (R4)
UXTB	R4, R0
; j start address is: 20 (R5)
MOVS	R5, #0
; i end address is: 16 (R4)
; j end address is: 20 (R5)
L_setup_gameboard236:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #28
SXTH	R0, R0
CMP	R4, R0
IT	GT
BGT	L_setup_gameboard237
;MatrixRGB_Demo_Project.c,745 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_gameboard239
L__setup_gameboard348:
L_setup_gameboard239:
; i start address is: 16 (R4)
; i end address is: 16 (R4)
; j start address is: 20 (R5)
; j end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_gameboard348
; i end address is: 16 (R4)
; j end address is: 20 (R5)
;MatrixRGB_Demo_Project.c,746 :: 		bricks[j].col          = i;
; j start address is: 20 (R5)
; i start address is: 16 (R4)
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R4, [R0, #0]
;MatrixRGB_Demo_Project.c,747 :: 		bricks[j].row          = 0;
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,748 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,749 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 8 (R2)
UXTB	R2, R4
; k end address is: 8 (R2)
; i end address is: 16 (R4)
; j end address is: 20 (R5)
UXTB	R3, R4
UXTB	R1, R5
L_setup_gameboard240:
; k start address is: 8 (R2)
; j start address is: 4 (R1)
; i start address is: 12 (R3)
ADDS	R0, R3, #4
SXTH	R0, R0
CMP	R2, R0
IT	GE
BGE	L_setup_gameboard241
;MatrixRGB_Demo_Project.c,751 :: 		matrixrgb_write_pixel( 0, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R1, [SP, #5]
STRB	R2, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
UXTB	R1, R2
MOVS	R2, #1
MOVS	R0, #0
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R2, [SP, #6]
;MatrixRGB_Demo_Project.c,752 :: 		matrixrgb_write_pixel( 1, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R2, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
UXTB	R1, R2
MOVS	R2, #1
MOVS	R0, #1
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R2, [SP, #6]
LDRB	R1, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,749 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,753 :: 		}
; k end address is: 8 (R2)
IT	AL
BAL	L_setup_gameboard240
L_setup_gameboard241:
;MatrixRGB_Demo_Project.c,743 :: 		for ( i = 0 + offset, j = 0; i <= 28 + offset; i += 4, j++ )
ADDS	R0, R3, #4
; i end address is: 12 (R3)
; i start address is: 16 (R4)
UXTB	R4, R0
ADDS	R0, R1, #1
; j end address is: 4 (R1)
; j start address is: 20 (R5)
UXTB	R5, R0
;MatrixRGB_Demo_Project.c,754 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_setup_gameboard236
L_setup_gameboard237:
;MatrixRGB_Demo_Project.c,755 :: 		matrixrgb_set_color( &brick_color, 0, 1, 0 );
ADD	R0, SP, #8
STRB	R5, [SP, #4]
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
BL	_matrixrgb_set_color+0
LDRB	R5, [SP, #4]
;MatrixRGB_Demo_Project.c,756 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 4 (R1)
UXTB	R1, R0
; j end address is: 20 (R5)
; i end address is: 4 (R1)
UXTB	R4, R5
UXTB	R5, R1
L_setup_gameboard243:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #28
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_gameboard244
;MatrixRGB_Demo_Project.c,758 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_gameboard246
L__setup_gameboard349:
L_setup_gameboard246:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_gameboard349
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,759 :: 		bricks[j].col          = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,760 :: 		bricks[j].row          = 2;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #2
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,761 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,762 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_gameboard247:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_gameboard248
;MatrixRGB_Demo_Project.c,764 :: 		matrixrgb_write_pixel( 2, k, 0, 1, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVS	R0, #2
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,765 :: 		matrixrgb_write_pixel( 3, k, 0, 1, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVS	R0, #3
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,762 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,766 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_gameboard247
L_setup_gameboard248:
;MatrixRGB_Demo_Project.c,756 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,767 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_gameboard243
L_setup_gameboard244:
;MatrixRGB_Demo_Project.c,768 :: 		matrixrgb_set_color( &brick_color, 1, 0, 0 );
ADD	R0, SP, #8
STRB	R4, [SP, #4]
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
LDRB	R4, [SP, #4]
;MatrixRGB_Demo_Project.c,769 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_gameboard250:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #28
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_gameboard251
;MatrixRGB_Demo_Project.c,771 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_gameboard253
L__setup_gameboard350:
L_setup_gameboard253:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_gameboard350
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,772 :: 		bricks[j].col          = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,773 :: 		bricks[j].row          = 4;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #4
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,774 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,775 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_gameboard254:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_gameboard255
;MatrixRGB_Demo_Project.c,777 :: 		matrixrgb_write_pixel( 4, k, 0, 0, 1 );
MOVS	R0, #1
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R0, #4
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,778 :: 		matrixrgb_write_pixel( 5, k, 0, 0, 1 );
MOVS	R0, #1
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R0, #5
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,775 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,779 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_gameboard254
L_setup_gameboard255:
;MatrixRGB_Demo_Project.c,769 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,780 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_gameboard250
L_setup_gameboard251:
;MatrixRGB_Demo_Project.c,781 :: 		matrixrgb_set_color( &brick_color, 0, 0, 1 );
ADD	R0, SP, #8
STRB	R4, [SP, #4]
MOVS	R3, #1
MOVS	R2, #0
MOVS	R1, #0
BL	_matrixrgb_set_color+0
LDRB	R4, [SP, #4]
;MatrixRGB_Demo_Project.c,782 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_gameboard257:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #28
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_gameboard258
;MatrixRGB_Demo_Project.c,784 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_gameboard260
L__setup_gameboard351:
L_setup_gameboard260:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_gameboard351
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,785 :: 		bricks[j].col          = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,786 :: 		bricks[j].row          = 6;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #6
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,787 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,788 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_gameboard261:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_gameboard262
;MatrixRGB_Demo_Project.c,790 :: 		matrixrgb_write_pixel( 6, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #6
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,791 :: 		matrixrgb_write_pixel( 7, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #7
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,788 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,792 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_gameboard261
L_setup_gameboard262:
;MatrixRGB_Demo_Project.c,782 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,793 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_gameboard257
L_setup_gameboard258:
;MatrixRGB_Demo_Project.c,794 :: 		matrixrgb_set_color( &brick_color, 0, 1, 0 );
ADD	R0, SP, #8
STRB	R4, [SP, #4]
MOVS	R3, #0
MOVS	R2, #1
MOVS	R1, #0
BL	_matrixrgb_set_color+0
LDRB	R4, [SP, #4]
;MatrixRGB_Demo_Project.c,795 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_gameboard264:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #28
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_gameboard265
;MatrixRGB_Demo_Project.c,797 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_gameboard267
L__setup_gameboard352:
L_setup_gameboard267:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_gameboard352
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,798 :: 		bricks[j].col          = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,799 :: 		bricks[j].row          = 8;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #8
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,800 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,801 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_gameboard268:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_gameboard269
;MatrixRGB_Demo_Project.c,803 :: 		matrixrgb_write_pixel( 8, k, 0, 1, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVS	R0, #8
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,804 :: 		matrixrgb_write_pixel( 9, k, 0, 1, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #1
MOVS	R2, #0
MOVS	R0, #9
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,801 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,805 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_gameboard268
L_setup_gameboard269:
;MatrixRGB_Demo_Project.c,795 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,806 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_gameboard264
L_setup_gameboard265:
;MatrixRGB_Demo_Project.c,807 :: 		matrixrgb_set_color( &brick_color, 1, 0, 0 );
ADD	R0, SP, #8
STRB	R4, [SP, #4]
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
LDRB	R4, [SP, #4]
;MatrixRGB_Demo_Project.c,808 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_gameboard271:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #28
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_gameboard272
;MatrixRGB_Demo_Project.c,810 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_gameboard274
L__setup_gameboard353:
L_setup_gameboard274:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_gameboard353
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,811 :: 		bricks[j].col          = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,812 :: 		bricks[j].row          = 10;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #10
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,813 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,814 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_gameboard275:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_gameboard276
;MatrixRGB_Demo_Project.c,816 :: 		matrixrgb_write_pixel( 10, k, 0, 0, 1 );
MOVS	R0, #1
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R0, #10
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,817 :: 		matrixrgb_write_pixel( 11, k, 0, 0, 1 );
MOVS	R0, #1
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #0
MOVS	R0, #11
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,814 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,818 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_gameboard275
L_setup_gameboard276:
;MatrixRGB_Demo_Project.c,808 :: 		for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R0, R3, #1
; j end address is: 12 (R3)
; j start address is: 16 (R4)
UXTB	R4, R0
;MatrixRGB_Demo_Project.c,819 :: 		}
; i end address is: 20 (R5)
; j end address is: 16 (R4)
IT	AL
BAL	L_setup_gameboard271
L_setup_gameboard272:
;MatrixRGB_Demo_Project.c,821 :: 		}
L_end_setup_gameboard:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _setup_gameboard
_setup_player:
;MatrixRGB_Demo_Project.c,823 :: 		void setup_player( void )
SUB	SP, SP, #8
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,827 :: 		player_curr_pos.row = 31;           /**< Player always start at default location */
MOVS	R1, #31
MOVW	R0, #lo_addr(_player_curr_pos+0)
MOVT	R0, #hi_addr(_player_curr_pos+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,828 :: 		player_curr_pos.col = 12 + offset;
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDW	R1, R0, #12
MOVW	R0, #lo_addr(_player_curr_pos+1)
MOVT	R0, #hi_addr(_player_curr_pos+1)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,829 :: 		for ( i = 12 + offset; i < 18 + offset; i++ )       /**< Draw player */
; i start address is: 8 (R2)
UXTB	R2, R1
; i end address is: 8 (R2)
L_setup_player278:
; i start address is: 8 (R2)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #18
SXTH	R0, R0
CMP	R2, R0
IT	GE
BGE	L_setup_player279
;MatrixRGB_Demo_Project.c,830 :: 		matrixrgb_write_pixel( player_curr_pos.row, i, 1, 0, 0 );
MOVS	R1, #0
MOVW	R0, #lo_addr(_player_curr_pos+0)
MOVT	R0, #hi_addr(_player_curr_pos+0)
LDRB	R0, [R0, #0]
STRB	R2, [SP, #4]
PUSH	(R1)
MOVS	R3, #0
UXTB	R1, R2
MOVS	R2, #1
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R2, [SP, #4]
;MatrixRGB_Demo_Project.c,829 :: 		for ( i = 12 + offset; i < 18 + offset; i++ )       /**< Draw player */
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,830 :: 		matrixrgb_write_pixel( player_curr_pos.row, i, 1, 0, 0 );
; i end address is: 8 (R2)
IT	AL
BAL	L_setup_player278
L_setup_player279:
;MatrixRGB_Demo_Project.c,831 :: 		player_surface = MIDDLE_SURFACE;    /**< Start with default vector */
MOVS	R1, #1
MOVW	R0, #lo_addr(_player_surface+0)
MOVT	R0, #hi_addr(_player_surface+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,832 :: 		}
L_end_setup_player:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _setup_player
_system_setup:
;MatrixRGB_Demo_Project.c,834 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
; width start address is: 4 (R1)
; brightness start address is: 0 (R0)
SUB	SP, SP, #8
STR	LR, [SP, #0]
UXTB	R11, R0
UXTB	R12, R1
STRB	R2, [SP, #4]
; width end address is: 4 (R1)
; brightness end address is: 0 (R0)
; brightness start address is: 44 (R11)
; width start address is: 48 (R12)
;MatrixRGB_Demo_Project.c,837 :: 		GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13); /**< Set Chip Select pin as output */
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Output+0
;MatrixRGB_Demo_Project.c,838 :: 		GPIO_Digital_Output( &GPIOC_BASE, _GPIO_PINMASK_2 ); /**< Set Reset pin to output */
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOC_BASE+0)
MOVT	R0, #hi_addr(GPIOC_BASE+0)
BL	_GPIO_Digital_Output+0
;MatrixRGB_Demo_Project.c,839 :: 		GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10);  /**< Set Ready to input */
MOVW	R1, #1024
MOVW	R0, #lo_addr(GPIOD_BASE+0)
MOVT	R0, #hi_addr(GPIOD_BASE+0)
BL	_GPIO_Digital_Input+0
;MatrixRGB_Demo_Project.c,840 :: 		GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0);     /**< Set PA0 as digital input ( Menu Button ) */
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;MatrixRGB_Demo_Project.c,845 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
MOVW	R2, #lo_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
MOVT	R2, #hi_addr(__GPIO_MODULE_SPI3_PC10_11_12+0)
;MatrixRGB_Demo_Project.c,844 :: 		_SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_DISABLE | _SPI_SSI_1,
MOVW	R1, #260
;MatrixRGB_Demo_Project.c,842 :: 		SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |              /**< Initialize SPI Communication */
MOVS	R0, #0
;MatrixRGB_Demo_Project.c,845 :: 		&_GPIO_MODULE_SPI3_PC10_11_12);
BL	_SPI3_Init_Advanced+0
;MatrixRGB_Demo_Project.c,847 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);               /**< Choose ADC channel */
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;MatrixRGB_Demo_Project.c,848 :: 		ADC1_Init();                                         /**< Initialize ADC */
BL	_ADC1_Init+0
;MatrixRGB_Demo_Project.c,849 :: 		Delay_ms(100);
MOVW	R7, #20351
MOVT	R7, #18
NOP
NOP
L_system_setup281:
SUBS	R7, R7, #1
BNE	L_system_setup281
NOP
NOP
NOP
;MatrixRGB_Demo_Project.c,851 :: 		MATRIXRGB_RST = 0;                                   /**< Reset Slave, ( Toggle it ) */
MOVS	R3, #0
SXTB	R3, R3
MOVW	R4, #lo_addr(GPIOC_ODR+0)
MOVT	R4, #hi_addr(GPIOC_ODR+0)
STR	R3, [R4, #0]
;MatrixRGB_Demo_Project.c,852 :: 		MATRIXRGB_RST = 1;
MOVS	R3, #1
SXTB	R3, R3
STR	R3, [R4, #0]
;MatrixRGB_Demo_Project.c,853 :: 		Delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_system_setup283:
SUBS	R7, R7, #1
BNE	L_system_setup283
NOP
NOP
NOP
;MatrixRGB_Demo_Project.c,855 :: 		matrixrgb_init( brightness, width, height );         /**< Initialize MatrixRGB Click, with brightness of 100, and width of 1 panel by height of 2 panels */
LDRB	R2, [SP, #4]
UXTB	R1, R12
; width end address is: 48 (R12)
UXTB	R0, R11
; brightness end address is: 44 (R11)
BL	_matrixrgb_init+0
;MatrixRGB_Demo_Project.c,856 :: 		Delay_ms(200);
MOVW	R7, #40703
MOVT	R7, #36
NOP
NOP
L_system_setup285:
SUBS	R7, R7, #1
BNE	L_system_setup285
NOP
NOP
NOP
;MatrixRGB_Demo_Project.c,858 :: 		InitTimer2();                                        /**< Initialize Timer 2 at 10 us */
BL	_InitTimer2+0
;MatrixRGB_Demo_Project.c,860 :: 		}
L_end_system_setup:
LDR	LR, [SP, #0]
ADD	SP, SP, #8
BX	LR
; end of _system_setup
_InitTimer2:
;MatrixRGB_Demo_Project.c,863 :: 		void InitTimer2() {
SUB	SP, SP, #4
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,864 :: 		RCC_APB1ENR.TIM2EN = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(RCC_APB1ENR+0)
MOVT	R0, #hi_addr(RCC_APB1ENR+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,865 :: 		TIM2_CR1.CEN = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,866 :: 		TIM2_PSC = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(TIM2_PSC+0)
MOVT	R0, #hi_addr(TIM2_PSC+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,867 :: 		TIM2_ARR = 7199;
MOVW	R1, #7199
MOVW	R0, #lo_addr(TIM2_ARR+0)
MOVT	R0, #hi_addr(TIM2_ARR+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,868 :: 		NVIC_IntEnable(IVT_INT_TIM2);
MOVW	R0, #44
BL	_NVIC_IntEnable+0
;MatrixRGB_Demo_Project.c,869 :: 		TIM2_DIER.UIE = 1;
MOVS	R1, #1
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_DIER+0)
MOVT	R0, #hi_addr(TIM2_DIER+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,870 :: 		TIM2_CR1.CEN = 1;
MOVW	R0, #lo_addr(TIM2_CR1+0)
MOVT	R0, #hi_addr(TIM2_CR1+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,871 :: 		}
L_end_InitTimer2:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _InitTimer2
_Timer2_interrupt:
;MatrixRGB_Demo_Project.c,873 :: 		void Timer2_interrupt() iv IVT_INT_TIM2 {
;MatrixRGB_Demo_Project.c,874 :: 		TIM2_SR.UIF = 0;
MOVS	R1, #0
SXTB	R1, R1
MOVW	R0, #lo_addr(TIM2_SR+0)
MOVT	R0, #hi_addr(TIM2_SR+0)
STR	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,876 :: 		move_flag = 1;             /**< Set Move flag for player to 1 every ? us */
MOVS	R1, #1
MOVW	R0, #lo_addr(_move_flag+0)
MOVT	R0, #hi_addr(_move_flag+0)
STRB	R1, [R0, #0]
;MatrixRGB_Demo_Project.c,877 :: 		ball_count_flag++;         /**< ball_count_flag is used for speed of the ball */
MOVW	R1, #lo_addr(_ball_count_flag+0)
MOVT	R1, #hi_addr(_ball_count_flag+0)
LDRH	R0, [R1, #0]
ADDS	R0, R0, #1
STRH	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,878 :: 		rand_num++;                /**< rand_num is used for random number generation */
MOVW	R1, #lo_addr(_rand_num+0)
MOVT	R1, #hi_addr(_rand_num+0)
LDRH	R0, [R1, #0]
ADDS	R2, R0, #1
UXTH	R2, R2
STRH	R2, [R1, #0]
;MatrixRGB_Demo_Project.c,879 :: 		time++;
MOVW	R1, #lo_addr(_time+0)
MOVT	R1, #hi_addr(_time+0)
LDR	R0, [R1, #0]
ADDS	R0, R0, #1
STR	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,880 :: 		if ( rand_num >= 65500 )   /**< Instead of rolling over, I reset the value of rand_num */
MOVW	R0, #65500
CMP	R2, R0
IT	CC
BCC	L_Timer2_interrupt287
;MatrixRGB_Demo_Project.c,881 :: 		rand_num = 0;
MOVS	R1, #0
MOVW	R0, #lo_addr(_rand_num+0)
MOVT	R0, #hi_addr(_rand_num+0)
STRH	R1, [R0, #0]
L_Timer2_interrupt287:
;MatrixRGB_Demo_Project.c,882 :: 		}
L_end_Timer2_interrupt:
BX	LR
; end of _Timer2_interrupt
_setup_bonus_level:
;MatrixRGB_Demo_Project.c,886 :: 		void setup_bonus_level( void )
SUB	SP, SP, #12
STR	LR, [SP, #0]
;MatrixRGB_Demo_Project.c,890 :: 		matrixrgb_set_color( &brick_color, 1, 0, 0 );
ADD	R0, SP, #8
MOVS	R3, #0
MOVS	R2, #0
MOVS	R1, #1
BL	_matrixrgb_set_color+0
;MatrixRGB_Demo_Project.c,892 :: 		for ( i = 0 + offset; i < 48 + offset; i++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
; i start address is: 16 (R4)
UXTB	R4, R0
; i end address is: 16 (R4)
L_setup_bonus_level288:
; i start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #48
SXTH	R0, R0
CMP	R4, R0
IT	GE
BGE	L_setup_bonus_level289
;MatrixRGB_Demo_Project.c,894 :: 		bricks[i].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level291
L__setup_bonus_level501:
L_setup_bonus_level291:
; i start address is: 16 (R4)
; i end address is: 16 (R4)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level501
; i end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,895 :: 		bricks[i].col    = 0;
; i start address is: 16 (R4)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #4
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,896 :: 		bricks[i].row    = 0;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,897 :: 		bricks[i].active = false;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,892 :: 		for ( i = 0 + offset; i < 48 + offset; i++ )
ADDS	R4, R4, #1
UXTB	R4, R4
;MatrixRGB_Demo_Project.c,898 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_setup_bonus_level288
L_setup_bonus_level289:
;MatrixRGB_Demo_Project.c,901 :: 		for ( i = 4 + offset, j = 0; i <= 20 + offset; i += 4, j++ )                // The top of the E
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 16 (R4)
UXTB	R4, R0
; j start address is: 20 (R5)
MOVS	R5, #0
; i end address is: 16 (R4)
; j end address is: 20 (R5)
L_setup_bonus_level292:
; j start address is: 20 (R5)
; i start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #20
SXTH	R0, R0
CMP	R4, R0
IT	GT
BGT	L_setup_bonus_level293
;MatrixRGB_Demo_Project.c,903 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level295
L__setup_bonus_level502:
L_setup_bonus_level295:
; i start address is: 16 (R4)
; i end address is: 16 (R4)
; j start address is: 20 (R5)
; j end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level502
; i end address is: 16 (R4)
; j end address is: 20 (R5)
;MatrixRGB_Demo_Project.c,904 :: 		bricks[j].col    = i;
; j start address is: 20 (R5)
; i start address is: 16 (R4)
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R4, [R0, #0]
;MatrixRGB_Demo_Project.c,905 :: 		bricks[j].row    = 0;
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #0
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,906 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R5
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,907 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 8 (R2)
UXTB	R2, R4
; k end address is: 8 (R2)
; i end address is: 16 (R4)
; j end address is: 20 (R5)
UXTB	R3, R4
UXTB	R1, R5
L_setup_bonus_level296:
; k start address is: 8 (R2)
; j start address is: 4 (R1)
; i start address is: 12 (R3)
ADDS	R0, R3, #4
SXTH	R0, R0
CMP	R2, R0
IT	GE
BGE	L_setup_bonus_level297
;MatrixRGB_Demo_Project.c,909 :: 		matrixrgb_write_pixel( 0, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R1, [SP, #5]
STRB	R2, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
UXTB	R1, R2
MOVS	R2, #1
MOVS	R0, #0
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R2, [SP, #6]
;MatrixRGB_Demo_Project.c,910 :: 		matrixrgb_write_pixel( 1, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R2, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
UXTB	R1, R2
MOVS	R2, #1
MOVS	R0, #1
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R2, [SP, #6]
LDRB	R1, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,907 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R2, R2, #1
UXTB	R2, R2
;MatrixRGB_Demo_Project.c,911 :: 		}
; k end address is: 8 (R2)
IT	AL
BAL	L_setup_bonus_level296
L_setup_bonus_level297:
;MatrixRGB_Demo_Project.c,901 :: 		for ( i = 4 + offset, j = 0; i <= 20 + offset; i += 4, j++ )                // The top of the E
ADDS	R0, R3, #4
; i end address is: 12 (R3)
; i start address is: 16 (R4)
UXTB	R4, R0
ADDS	R0, R1, #1
; j end address is: 4 (R1)
; j start address is: 20 (R5)
UXTB	R5, R0
;MatrixRGB_Demo_Project.c,912 :: 		}
; i end address is: 16 (R4)
IT	AL
BAL	L_setup_bonus_level292
L_setup_bonus_level293:
;MatrixRGB_Demo_Project.c,913 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4 , j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 4 (R1)
UXTB	R1, R0
; j end address is: 20 (R5)
; i end address is: 4 (R1)
UXTB	R4, R5
UXTB	R5, R1
L_setup_bonus_level299:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #8
SXTH	R0, R0
CMP	R5, R0
IT	GE
BGE	L_setup_bonus_level300
;MatrixRGB_Demo_Project.c,915 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level302
L__setup_bonus_level503:
L_setup_bonus_level302:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level503
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,916 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,917 :: 		bricks[j].row    = 2;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #2
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,918 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,919 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level303:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level304
;MatrixRGB_Demo_Project.c,921 :: 		matrixrgb_write_pixel( 2, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #2
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,922 :: 		matrixrgb_write_pixel( 3, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #3
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,919 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,923 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level303
L_setup_bonus_level304:
;MatrixRGB_Demo_Project.c,913 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4 , j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,924 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_bonus_level299
L_setup_bonus_level300:
;MatrixRGB_Demo_Project.c,925 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_bonus_level306:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #8
SXTH	R0, R0
CMP	R5, R0
IT	GE
BGE	L_setup_bonus_level307
;MatrixRGB_Demo_Project.c,927 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level309
L__setup_bonus_level504:
L_setup_bonus_level309:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level504
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,928 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,929 :: 		bricks[j].row    = 4;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #4
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,930 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,931 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level310:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level311
;MatrixRGB_Demo_Project.c,933 :: 		matrixrgb_write_pixel( 4, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #4
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,934 :: 		matrixrgb_write_pixel( 5, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #5
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,931 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,935 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level310
L_setup_bonus_level311:
;MatrixRGB_Demo_Project.c,925 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,936 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_bonus_level306
L_setup_bonus_level307:
;MatrixRGB_Demo_Project.c,938 :: 		for ( i = 4 + offset; i <= 16 + offset; i += 4, j++ )                       //The middle of the E
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_bonus_level313:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #16
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_bonus_level314
;MatrixRGB_Demo_Project.c,940 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level316
L__setup_bonus_level505:
L_setup_bonus_level316:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level505
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,941 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,942 :: 		bricks[j].row    = 6;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #6
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,943 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,944 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level317:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level318
;MatrixRGB_Demo_Project.c,946 :: 		matrixrgb_write_pixel( 6, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #6
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,947 :: 		matrixrgb_write_pixel( 7, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #7
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,944 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,948 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level317
L_setup_bonus_level318:
;MatrixRGB_Demo_Project.c,938 :: 		for ( i = 4 + offset; i <= 16 + offset; i += 4, j++ )                       //The middle of the E
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,949 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_bonus_level313
L_setup_bonus_level314:
;MatrixRGB_Demo_Project.c,951 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_bonus_level320:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #8
SXTH	R0, R0
CMP	R5, R0
IT	GE
BGE	L_setup_bonus_level321
;MatrixRGB_Demo_Project.c,953 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level323
L__setup_bonus_level506:
L_setup_bonus_level323:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level506
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,954 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,955 :: 		bricks[j].row    = 8;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #8
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,956 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,957 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level324:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level325
;MatrixRGB_Demo_Project.c,959 :: 		matrixrgb_write_pixel( 8, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #8
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,960 :: 		matrixrgb_write_pixel( 9, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #9
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,957 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,961 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level324
L_setup_bonus_level325:
;MatrixRGB_Demo_Project.c,951 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,962 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_bonus_level320
L_setup_bonus_level321:
;MatrixRGB_Demo_Project.c,963 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_bonus_level327:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #8
SXTH	R0, R0
CMP	R5, R0
IT	GE
BGE	L_setup_bonus_level328
;MatrixRGB_Demo_Project.c,965 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level330
L__setup_bonus_level507:
L_setup_bonus_level330:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level507
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,966 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,967 :: 		bricks[j].row    = 10;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #10
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,968 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,969 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level331:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level332
;MatrixRGB_Demo_Project.c,971 :: 		matrixrgb_write_pixel( 10, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #10
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,972 :: 		matrixrgb_write_pixel( 11, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #11
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,969 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,973 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level331
L_setup_bonus_level332:
;MatrixRGB_Demo_Project.c,963 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,974 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_bonus_level327
L_setup_bonus_level328:
;MatrixRGB_Demo_Project.c,975 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_bonus_level334:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #8
SXTH	R0, R0
CMP	R5, R0
IT	GE
BGE	L_setup_bonus_level335
;MatrixRGB_Demo_Project.c,977 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level337
L__setup_bonus_level508:
L_setup_bonus_level337:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level508
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,978 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,979 :: 		bricks[j].row    = 10;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #10
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,980 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,981 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level338:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level339
;MatrixRGB_Demo_Project.c,983 :: 		matrixrgb_write_pixel( 12, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #12
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,984 :: 		matrixrgb_write_pixel( 13, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #13
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,981 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,985 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level338
L_setup_bonus_level339:
;MatrixRGB_Demo_Project.c,975 :: 		for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R4, R3, #1
UXTB	R4, R4
; j end address is: 12 (R3)
; j start address is: 16 (R4)
;MatrixRGB_Demo_Project.c,986 :: 		}
; i end address is: 20 (R5)
IT	AL
BAL	L_setup_bonus_level334
L_setup_bonus_level335:
;MatrixRGB_Demo_Project.c,989 :: 		for ( i = 4 + offset; i <= 20 + offset; i += 4, j++ )                       //The bottom of the E
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, R0, #4
; i start address is: 20 (R5)
UXTB	R5, R0
; i end address is: 20 (R5)
; j end address is: 16 (R4)
L_setup_bonus_level341:
; i start address is: 20 (R5)
; j start address is: 16 (R4)
MOVW	R0, #lo_addr(_offset+0)
MOVT	R0, #hi_addr(_offset+0)
LDRB	R0, [R0, #0]
ADDS	R0, #20
SXTH	R0, R0
CMP	R5, R0
IT	GT
BGT	L_setup_bonus_level342
;MatrixRGB_Demo_Project.c,991 :: 		bricks[j].color  = brick_color;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
MOV	R3, #3
MOV	R2, R0
ADD	R1, SP, #8
IT	AL
BAL	L_setup_bonus_level344
L__setup_bonus_level509:
L_setup_bonus_level344:
; j start address is: 16 (R4)
; j end address is: 16 (R4)
; i start address is: 20 (R5)
; i end address is: 20 (R5)
LDRB	R0, [R1, #0]
STRB	R0, [R2, #0]
SUBS	R3, R3, #1
ADDS	R1, R1, #1
ADDS	R2, R2, #1
CMP	R3, #0
IT	NE
BNE	L__setup_bonus_level509
; i end address is: 20 (R5)
; j end address is: 16 (R4)
;MatrixRGB_Demo_Project.c,992 :: 		bricks[j].col    = i;
; j start address is: 16 (R4)
; i start address is: 20 (R5)
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R0, R0, #4
STRB	R5, [R0, #0]
;MatrixRGB_Demo_Project.c,993 :: 		bricks[j].row    = 14;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #3
MOVS	R0, #14
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,994 :: 		bricks[j].active = true;
MOVS	R0, #6
MUL	R1, R0, R4
MOVW	R0, #lo_addr(_bricks+0)
MOVT	R0, #hi_addr(_bricks+0)
ADDS	R0, R0, R1
ADDS	R1, R0, #5
MOVS	R0, #1
STRB	R0, [R1, #0]
;MatrixRGB_Demo_Project.c,995 :: 		for ( k = i; k < ( i + 4 ); k++ )
; k start address is: 4 (R1)
UXTB	R1, R5
; k end address is: 4 (R1)
; i end address is: 20 (R5)
; j end address is: 16 (R4)
UXTB	R3, R4
UXTB	R2, R5
L_setup_bonus_level345:
; k start address is: 4 (R1)
; i start address is: 8 (R2)
; j start address is: 12 (R3)
ADDS	R0, R2, #4
SXTH	R0, R0
CMP	R1, R0
IT	GE
BGE	L_setup_bonus_level346
;MatrixRGB_Demo_Project.c,997 :: 		matrixrgb_write_pixel( 14, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R3, [SP, #4]
STRB	R2, [SP, #5]
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #14
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
;MatrixRGB_Demo_Project.c,998 :: 		matrixrgb_write_pixel( 15, k, 1, 0, 0 );
MOVS	R0, #0
STRB	R1, [SP, #6]
PUSH	(R0)
MOVS	R3, #0
MOVS	R2, #1
MOVS	R0, #15
SXTH	R0, R0
BL	_matrixrgb_write_pixel+0
ADD	SP, SP, #4
LDRB	R1, [SP, #6]
LDRB	R2, [SP, #5]
LDRB	R3, [SP, #4]
;MatrixRGB_Demo_Project.c,995 :: 		for ( k = i; k < ( i + 4 ); k++ )
ADDS	R1, R1, #1
UXTB	R1, R1
;MatrixRGB_Demo_Project.c,999 :: 		}
; k end address is: 4 (R1)
IT	AL
BAL	L_setup_bonus_level345
L_setup_bonus_level346:
;MatrixRGB_Demo_Project.c,989 :: 		for ( i = 4 + offset; i <= 20 + offset; i += 4, j++ )                       //The bottom of the E
ADDS	R0, R2, #4
; i end address is: 8 (R2)
; i start address is: 20 (R5)
UXTB	R5, R0
ADDS	R0, R3, #1
; j end address is: 12 (R3)
; j start address is: 16 (R4)
UXTB	R4, R0
;MatrixRGB_Demo_Project.c,1000 :: 		}
; i end address is: 20 (R5)
; j end address is: 16 (R4)
IT	AL
BAL	L_setup_bonus_level341
L_setup_bonus_level342:
;MatrixRGB_Demo_Project.c,1004 :: 		}
L_end_setup_bonus_level:
LDR	LR, [SP, #0]
ADD	SP, SP, #12
BX	LR
; end of _setup_bonus_level
