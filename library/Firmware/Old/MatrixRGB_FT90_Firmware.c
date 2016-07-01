#include <stdint.h>
#include "matrixrgb_firmware.h"

enum
{
    SETUP_CMD = 0x01,
    IMAGE_LOAD_CMD,
    SCROLL_IMG_LEFT_CMD,
    SCROLL_IMG_RIGHT_CMD,
    WRITE_PXL_CMD,
    WRITE_PXL_IMG_CMD,
    ERASE_PXL_CMD,
    SCROLL_TEXT_LEFT_CMD,
    SCROLL_TEXT_RIGHT_CMD,
    DISPLAY_SHIFT_UP_CMD,
    DISPLAY_SHIFT_DOWN_CMD,
    DISPLAY_SHIFT_RIGHT_CMD,
    DISPLAY_SHIFT_LEFT_CMD,
    DISPLAY_SCROLL_OFF_SCRN_UP_CMD,
    DISPLAY_SCROLL_OFF_SCRN_DWN_CMD,
    DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD,
    DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD,
    REFRESH_CMD,
    CLR_SCRN_CMD

}cmd_t;

uint8_t buffer[65]  = { 0 };   // Buffer for SPI Slave FIFO.. 64 bytes long
uint8_t setup_flag = 0;

void main()
{
    //Local Declarations
    color_t my_color;
    uint16_t speed       = 30;
    my_color.red         = 1;


    spi_bus_init();
    Delay_ms(300);

    while(1)
    {
        receive_data( &buffer, 1 );

        switch( buffer[0] )
        {
            case SETUP_CMD:
                setup_command();
                break;
            case IMAGE_LOAD_CMD:
                image_load_command();
                break;
            case SCROLL_IMG_LEFT_CMD:
                scroll_img_left_command();
                break;
            case SCROLL_IMG_RIGHT_CMD:
                scroll_img_right_command();
                break;
            case WRITE_PXL_CMD:
                write_pxl_command();
                break;
            case WRITE_PXL_IMG_CMD:
                write_pxl_img_command();
                break;
            case ERASE_PXL_CMD:
                erase_pxl_command();
                break;
            case SCROLL_TEXT_LEFT_CMD:
                scroll_text_left_command();
                break;
            case SCROLL_TEXT_RIGHT_CMD:
                scroll_text_right_command();
                break;
            case DISPLAY_SHIFT_UP_CMD:
                display_shift_up_command();
                break;
            case DISPLAY_SHIFT_DOWN_CMD:
                display_shift_down_command();
                break;
            case DISPLAY_SHIFT_RIGHT_CMD:
                display_shift_right_command();
                break;
            case DISPLAY_SHIFT_LEFT_CMD:
                display_shift_left_command();
                break;
            case DISPLAY_SCROLL_OFF_SCRN_UP_CMD:
                display_scroll_off_scrn_up_command();
                break;
            case DISPLAY_SCROLL_OFF_SCRN_DWN_CMD:
                display_scroll_off_scrn_down_command();
                break;
            case DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD:
                display_scroll_off_scrn_left_command();
                break;
            case DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD:
                display_scroll_off_scrn_right_command();
                break;
            case REFRESH_CMD:
                refresh();
                break;
            case CLR_SCRN_CMD:
                clear_screen_command();
                break;
            default:
                break;
        }
    }
}