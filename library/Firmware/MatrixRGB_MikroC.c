#include "matrixrgb_firmware.h"

enum
{
    SETUP_CMD = 0x01,                              /**< Setup function */
    IMAGE_LOAD_CMD = 0x02,                         /**< Image Load function */
    SCROLL_IMG_LEFT_CMD = 0x03,                    /**< Scroll Image Left Function */
    SCROLL_IMG_RIGHT_CMD = 0x04,                   /**< Scroll Image Right Function */
    WRITE_PXL_CMD = 0x05,                          /**< Write Pixel Function */
    WRITE_PXL_IMG_CMD = 0x06,                      /**< Write Pixel Image Function */
    ERASE_PXL_CMD = 0x07,                          /**< Erase Pixel Function */
    SCROLL_TEXT_LEFT_CMD = 0x08,                   /**< Scroll Text Left Function */
    SCROLL_TEXT_RIGHT_CMD = 0x09,                  /**< Scroll Text Right Function */
    DISPLAY_SHIFT_UP_CMD = 0x0A,                   /**< Display Shift Up Function */
    DISPLAY_SHIFT_DOWN_CMD = 0x0B,                 /**< Display Shift Down Function */
    DISPLAY_SHIFT_RIGHT_CMD = 0x0C,                /**< Display Shift Right Function */
    DISPLAY_SHIFT_LEFT_CMD = 0x0D,                 /**< Display Shift Left Function */
    DISPLAY_SCROLL_OFF_SCRN_UP_CMD = 0x0E,         /**< Display Scroll Off Screen Up Function */
    DISPLAY_SCROLL_OFF_SCRN_DWN_CMD = 0x0F,        /**< Display Scroll Off Screen Down Function */
    DISPLAY_SCROLL_OFF_SCRN_LEFT_CMD = 0x10,       /**< Display Scroll Off Screen Left Function */
    DISPLAY_SCROLL_OFF_SCRN_RIGHT_CMD = 0x11,      /**< Display Scroll Off Screen Right Function */
    REFRESH_CMD = 0x12,                            /**< Refresh Function */
    CLR_SCRN_CMD = 0x13,                           /**< Clear Screen Function */
    WRITE_TEXT_CMD = 0x14                          /**< Write Text Function */

}cmd_t;

uint8_t buffer[65]  = { 0 };   // Buffer for SPI Slave FIFO.. 64 bytes long
uint8_t setup_flag = 0;
 /*
void main()
{

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
            case WRITE_TEXT_CMD:
                 write_text_command();
                 break;
            default:
                break;
        }
    }
}     */