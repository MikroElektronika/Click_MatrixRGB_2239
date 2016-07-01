
_main:

;MatrixRGB_PIC.c,13 :: 		void main()
;MatrixRGB_PIC.c,15 :: 		uint8_t count = 3;
;MatrixRGB_PIC.c,16 :: 		uint8_t i     = 0;
;MatrixRGB_PIC.c,19 :: 		system_setup( 100, 2, 1 );
	MOVLW       100
	MOVWF       FARG_system_setup_brightness+0 
	MOVLW       2
	MOVWF       FARG_system_setup_width+0 
	MOVLW       1
	MOVWF       FARG_system_setup_height+0 
	CALL        _system_setup+0, 0
;MatrixRGB_PIC.c,21 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 40 );
	MOVLW       _MikroeBITMAP_bmp+0
	MOVWF       FARG_matrixrgb_scroll_img_right_bmp+0 
	MOVLW       hi_addr(_MikroeBITMAP_bmp+0)
	MOVWF       FARG_matrixrgb_scroll_img_right_bmp+1 
	MOVLW       64
	MOVWF       FARG_matrixrgb_scroll_img_right_width+0 
	MOVLW       16
	MOVWF       FARG_matrixrgb_scroll_img_right_height+0 
	MOVLW       40
	MOVWF       FARG_matrixrgb_scroll_img_right_speed+0 
	CALL        _matrixrgb_scroll_img_right+0, 0
;MatrixRGB_PIC.c,22 :: 		matrixrgb_scroll_off_scrn_down( 30 );
	MOVLW       30
	MOVWF       FARG_matrixrgb_scroll_off_scrn_down_speed+0 
	CALL        _matrixrgb_scroll_off_scrn_down+0, 0
;MatrixRGB_PIC.c,23 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,24 :: 		matrixrgb_scroll_text_left( "Matrix ", my_color, 17, 10 );
	MOVLW       ?lstr1_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr1_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main0:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main0
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       10
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,25 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	CLRF        FARG_matrixrgb_set_color_green_color+0 
	CLRF        FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,26 :: 		matrixrgb_scroll_text_left( "R", my_color, 17, 1 );
	MOVLW       ?lstr2_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr2_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main1:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main1
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,27 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	CLRF        FARG_matrixrgb_set_color_red_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_green_color+0 
	CLRF        FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,28 :: 		matrixrgb_scroll_text_left( "G", my_color, 17, 1 );
	MOVLW       ?lstr3_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr3_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main2:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main2
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,29 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	CLRF        FARG_matrixrgb_set_color_red_color+0 
	CLRF        FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,30 :: 		matrixrgb_scroll_text_left( "B ", my_color, 17, 1 );
	MOVLW       ?lstr4_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr4_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main3:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main3
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,31 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,32 :: 		matrixrgb_scroll_off_scrn_up( 30 );
	MOVLW       30
	MOVWF       FARG_matrixrgb_scroll_off_scrn_up_speed+0 
	CALL        _matrixrgb_scroll_off_scrn_up+0, 0
;MatrixRGB_PIC.c,33 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	CLRF        FARG_matrixrgb_set_color_green_color+0 
	CLRF        FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,34 :: 		matrixrgb_scroll_text_left( "By: ", my_color, 17, 4 );
	MOVLW       ?lstr5_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr5_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main4:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main4
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       4
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,35 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,36 :: 		matrixrgb_scroll_text_left( "Corey ", my_color, 17, 6 );
	MOVLW       ?lstr6_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr6_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main5:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main5
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       6
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,37 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	CLRF        FARG_matrixrgb_set_color_red_color+0 
	CLRF        FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,38 :: 		matrixrgb_scroll_text_left( "Lakey ", my_color, 17, 6 );
	MOVLW       ?lstr7_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr7_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main6:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main6
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       6
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,39 :: 		matrixrgb_scroll_off_scrn_left( 17 );
	MOVLW       17
	MOVWF       FARG_matrixrgb_scroll_off_scrn_left_speed+0 
	CALL        _matrixrgb_scroll_off_scrn_left+0, 0
;MatrixRGB_PIC.c,40 :: 		matrixrgb_scroll_img_right( MikroeBITMAP_bmp, 64, 16, 25 );
	MOVLW       _MikroeBITMAP_bmp+0
	MOVWF       FARG_matrixrgb_scroll_img_right_bmp+0 
	MOVLW       hi_addr(_MikroeBITMAP_bmp+0)
	MOVWF       FARG_matrixrgb_scroll_img_right_bmp+1 
	MOVLW       64
	MOVWF       FARG_matrixrgb_scroll_img_right_width+0 
	MOVLW       16
	MOVWF       FARG_matrixrgb_scroll_img_right_height+0 
	MOVLW       25
	MOVWF       FARG_matrixrgb_scroll_img_right_speed+0 
	CALL        _matrixrgb_scroll_img_right+0, 0
;MatrixRGB_PIC.c,41 :: 		matrixrgb_scroll_off_scrn_right( 10 );
	MOVLW       10
	MOVWF       FARG_matrixrgb_scroll_off_scrn_right_speed+0 
	CALL        _matrixrgb_scroll_off_scrn_right+0, 0
;MatrixRGB_PIC.c,43 :: 		while(1)
L_main7:
;MatrixRGB_PIC.c,45 :: 		matrixrgb_set_color( &my_color, 1, 1, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,46 :: 		matrixrgb_scroll_text_left( "Matrix", my_color, 20, 10 );
	MOVLW       ?lstr8_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr8_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main9:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main9
	MOVLW       20
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       10
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,47 :: 		matrixrgb_set_color( &my_color, 1, 0, 0 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_red_color+0 
	CLRF        FARG_matrixrgb_set_color_green_color+0 
	CLRF        FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,48 :: 		matrixrgb_scroll_text_left( "R", my_color, 20, 1 );
	MOVLW       ?lstr9_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr9_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main10:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main10
	MOVLW       20
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,49 :: 		matrixrgb_set_color( &my_color, 0, 1, 0 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	CLRF        FARG_matrixrgb_set_color_red_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_green_color+0 
	CLRF        FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,50 :: 		matrixrgb_scroll_text_left( "G", my_color, 20, 1 );
	MOVLW       ?lstr10_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr10_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main11:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main11
	MOVLW       20
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,51 :: 		matrixrgb_set_color( &my_color, 0, 0, 1 );
	MOVLW       main_my_color_L0+0
	MOVWF       FARG_matrixrgb_set_color_color+0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FARG_matrixrgb_set_color_color+1 
	CLRF        FARG_matrixrgb_set_color_red_color+0 
	CLRF        FARG_matrixrgb_set_color_green_color+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_set_color_blue_color+0 
	CALL        _matrixrgb_set_color+0, 0
;MatrixRGB_PIC.c,52 :: 		matrixrgb_scroll_text_left( "B", my_color, 20, 1 );
	MOVLW       ?lstr11_MatrixRGB_PIC+0
	MOVWF       FARG_matrixrgb_scroll_text_left_text+0 
	MOVLW       hi_addr(?lstr11_MatrixRGB_PIC+0)
	MOVWF       FARG_matrixrgb_scroll_text_left_text+1 
	MOVLW       3
	MOVWF       R0 
	MOVLW       FARG_matrixrgb_scroll_text_left_color+0
	MOVWF       FSR1 
	MOVLW       hi_addr(FARG_matrixrgb_scroll_text_left_color+0)
	MOVWF       FSR1H 
	MOVLW       main_my_color_L0+0
	MOVWF       FSR0 
	MOVLW       hi_addr(main_my_color_L0+0)
	MOVWF       FSR0H 
L_main12:
	MOVF        POSTINC0+0, 0 
	MOVWF       POSTINC1+0 
	DECF        R0, 1 
	BTFSS       STATUS+0, 2 
	GOTO        L_main12
	MOVLW       20
	MOVWF       FARG_matrixrgb_scroll_text_left_speed+0 
	MOVLW       1
	MOVWF       FARG_matrixrgb_scroll_text_left_text_size+0 
	CALL        _matrixrgb_scroll_text_left+0, 0
;MatrixRGB_PIC.c,53 :: 		matrixrgb_refresh();
	CALL        _matrixrgb_refresh+0, 0
;MatrixRGB_PIC.c,54 :: 		}
	GOTO        L_main7
;MatrixRGB_PIC.c,55 :: 		}
L_end_main:
	GOTO        $+0
; end of _main

_system_setup:

;MatrixRGB_PIC.c,57 :: 		void system_setup( char brightness, uint8_t width, uint8_t height )
;MatrixRGB_PIC.c,59 :: 		MATRIXRGB_CS_DIR = 0;
	BCF         TRISE0_bit+0, BitPos(TRISE0_bit+0) 
;MatrixRGB_PIC.c,60 :: 		MATRIXRGB_READY_DIR = 1;
	BSF         TRISB0_bit+0, BitPos(TRISB0_bit+0) 
;MatrixRGB_PIC.c,61 :: 		MATRIXRGB_RST_DIR = 0;
	BCF         TRISE1_bit+0, BitPos(TRISE1_bit+0) 
;MatrixRGB_PIC.c,64 :: 		SPI1_Init_Advanced( _SPI_MASTER_OSC_DIV4, _SPI_DATA_SAMPLE_MIDDLE,
	CLRF        FARG_SPI1_Init_Advanced_master+0 
	CLRF        FARG_SPI1_Init_Advanced_data_sample+0 
;MatrixRGB_PIC.c,65 :: 		_SPI_CLK_IDLE_LOW, _SPI_LOW_2_HIGH );
	CLRF        FARG_SPI1_Init_Advanced_clock_idle+0 
	MOVLW       1
	MOVWF       FARG_SPI1_Init_Advanced_transmit_edge+0 
	CALL        _SPI1_Init_Advanced+0, 0
;MatrixRGB_PIC.c,67 :: 		MATRIXRGB_RST = 0;        //Reset slave ( toggle )
	BCF         RE1_bit+0, BitPos(RE1_bit+0) 
;MatrixRGB_PIC.c,68 :: 		MATRIXRGB_RST = 1;
	BSF         RE1_bit+0, BitPos(RE1_bit+0) 
;MatrixRGB_PIC.c,69 :: 		Delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_system_setup13:
	DECFSZ      R13, 1, 1
	BRA         L_system_setup13
	DECFSZ      R12, 1, 1
	BRA         L_system_setup13
	DECFSZ      R11, 1, 1
	BRA         L_system_setup13
;MatrixRGB_PIC.c,71 :: 		matrixrgb_init( brightness, width, height );
	MOVF        FARG_system_setup_brightness+0, 0 
	MOVWF       FARG_matrixrgb_init_level+0 
	MOVF        FARG_system_setup_width+0, 0 
	MOVWF       FARG_matrixrgb_init_width+0 
	MOVF        FARG_system_setup_height+0, 0 
	MOVWF       FARG_matrixrgb_init_height+0 
	CALL        _matrixrgb_init+0, 0
;MatrixRGB_PIC.c,72 :: 		Delay_ms(200);
	MOVLW       3
	MOVWF       R11, 0
	MOVLW       8
	MOVWF       R12, 0
	MOVLW       119
	MOVWF       R13, 0
L_system_setup14:
	DECFSZ      R13, 1, 1
	BRA         L_system_setup14
	DECFSZ      R12, 1, 1
	BRA         L_system_setup14
	DECFSZ      R11, 1, 1
	BRA         L_system_setup14
;MatrixRGB_PIC.c,74 :: 		}
L_end_system_setup:
	RETURN      0
; end of _system_setup
