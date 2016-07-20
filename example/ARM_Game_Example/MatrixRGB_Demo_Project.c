#include "matrixrgb_hw.h"
#include "resources.h"
#include <stdbool.h>

#define AUTOPLAY      /**< For debugging purposes */
#define BONUSLEVEL    /**< For Bonus Level after completing HARD mode */
//#define CHEATING      /**< While paused btn held, can move the paddle */
//#define TIME_DISPLAY  /**< Used to display time since start of game */

sbit MATRIXRGB_CS       at GPIOD_ODR.B13;
sbit MATRIXRGB_READY    at GPIOD_IDR.B10;
sbit MATRIXRGB_RST      at GPIOC_ODR.B2;

void system_setup( uint8_t width, uint8_t height, panel_size_t panel_size );    /**<    Sets up GPIO / SPI / MatrixRGB */
void InitTimer2( void );                        /**<    Timer2 Initialization */
void setup_gameboard( void );                   /**<    Sets up normal level  */
void setup_player( void );                      /**<    Sets up player on bottom of screen */
void setup_ball( void );                        /**<    Sets up ball at default location   */
void move_ball( void );                         /**<    Moves ball ( checking boundaries and bricks ) */
void move_player( void );                       /**<    Moves player ( checking boundaries ) */
void check_ball_boundaries( void );             /**<    Checks boundaries of screen for ball */
bool is_player_there( void );                   /**<    Once ball reaches bottom of screen, checks if player is there to catch it. */
bool is_brick_hit( void );                      /**<    Function Checks if brick is hit */
void erase_brick( uint8_t number );             /**<    Erases a destroyed brick from screen */
void set_vector( uint8_t *amount );             /**<    Sets new angle of ball object */
void set_ball_pos( uint8_t vector_amount );     /**<    Sets Ball position with new vector amount */
bool is_game_over( void );                      /**<    Checks if the game is over ( all bricks gone ) */
void display_main_menu( void );                 /**<    Displays Main Menu for choosing difficulty */
void set_option( void );                        /**<    Sets the option "got" from menu */
uint8_t get_option( void );                     /**<    Gets option from main menu */
void wait_for_choice( void );                   /**<    Waits in main menu screen for user to push A0 */
void display_youwin( void );                    /**<    Displays the "You Win!" Screen */
void display_youlose( void );                   /**<    Displays the "You Lose!" Screen */
void display_bonuslevel( void );                /**<    Displays the "Bonus Level" Screen */
void setup_bonus_level( void );                 /**<    Sets up gameboard as the Bonus Level */
void display_time( void );                      /**<    Displays the Amount of time played */
void clear_time_zone( void );                   /**<    Clears the previous time */

typedef enum
{
    UP = 0,
    DOWN
} vert_direction_t;     /**<    Used for vertical direction of ball */

typedef enum
{
    LEFT = 0,
    RIGHT
} horiz_direction_t;    /**<    Used for horizontal direction of ball */

typedef struct
{
    uint8_t row;
    uint8_t col;
} position_t;           /**<    Used for the position of ball or player   */

typedef struct
{
    color_t color;
    uint8_t row;
    uint8_t col;
    bool active;
} brick_t;              /**<    Used for creating array of bricks for game board    */

typedef enum
{
    TOP_SIDE = 0,
    BOTTOM_SIDE,
    RIGHT_SIDE,
    LEFT_SIDE
} brick_side_t;         /**<    Indicates which side of a brick was last hit    */

typedef enum
{
    LEFT_SURFACE = 0,
    MIDDLE_SURFACE,
    RIGHT_SURFACE
} player_surface_t;     /**<    Indicates which part of the player surface was last hit     */

typedef enum
{
    EASY = 0,
    MEDIUM,
    HARD
} difficulty_t;         /**<    Indicates the choice of difficulty by the user  */


vert_direction_t  ball_dir_vert  = UP;       /**<   Global Vertical Ball Direction  */
horiz_direction_t ball_dir_horiz = LEFT;     /**<   Global Horizontal Ball Direction    */
position_t   ball_curr_pos;                  /**<   Global Current Ball Position    */
position_t player_curr_pos;                  /**<   Global Current Player Position  */
uint8_t move_flag        = 0;                /**<   Flag for when to refresh movement of character ( flag set every 200 us )        */
uint16_t ball_count_flag = 0;                /**<   Flag for when to move the Ball, ( depends on g_ball_speed )     */
unsigned long adc_pos;                       /**<   Global ADC Position value    */
bool safe = true;                            /**<   Global "Safe" flag for when player loses    */
brick_t bricks[48];                          /**<   Array of bricks on gameboard    */
brick_side_t brick_side_vert;                /**<   Global indication of Vertical side last hit of ball ( set to a horiz. pos. when vertical pos. not hit ) */
brick_side_t brick_side_horiz;               /**<   Global indication of Horizontal side last hit of ball ( set to a vert. pos. when horz. pos. not hit ) */
player_surface_t player_surface;             /**<   Global indication of what side of the surface of the player was last hit */
uint16_t g_ball_speed = 50;                  /**<   Smaller # = faster speed   */
uint16_t ball_speed;                         /**<   Used for when vector is increased, to slow down ball (normalization) */
bool playing = true;                         /**<   Used to check if win   */
uint16_t rand_num  = 0;                      /**<   Used for Random Number Generation */
uint32_t time      = 0;
uint8_t time_s     = 0;
uint8_t offset     = 0;                      /**< Used when shifting display for game around to other screens */


void main()
{
    color_t my_color;               /**<    Color for Text */
    uint8_t bonus_level = 0;        /**<    Flag used for Bonus Level after winning on Hard */

    /**< System Setup */
    matrixrgb_set_color( &my_color, 1, 0, 0 );      /**<    Color for text */
    system_setup( 1, 1, BIG_PANEL );                            /**<    Sets up ADC, SPI, MatrixRGB, Timer */
    /**< Game Setup */
    ball_speed = g_ball_speed;                      /**<    Setup initial ball speed */
    wait_for_choice();                              /**<    Wait for choice from Main Menu */
    matrixrgb_clear_screen();                       /**<    Setting up game functions */
    setup_gameboard( void );
    setup_player( void );
    setup_ball( void );

    /**< Play The Game *********************/
    while ( 1 )  //Super Loop
    {
        matrixrgb_refresh();
#ifdef TIME_DISPLAY
        display_time();
#endif
        adc_pos = ADC1_Get_Sample(3);                         /**<  Get ADC value from corresponding channel */
        /**< Pause Funtion, with Cheat if defined ************/
        if (Button(&GPIOA_IDR, 0, 1, 1))                      /**<  A0 Button press, Pause Game */
        {
            while ( !Button(&GPIOA_IDR, 0, 1, 0 ) )           /**<  Wait for depress of A0 */
            {
#ifdef CHEATING
                adc_pos = ADC1_Get_Sample(3);                 /**<  If CHEATING defined, allow moving of player */
                move_player();
#endif
                matrixrgb_refresh();                          /**<  Refresh while we wait for depress   */
            }
            while ( !Button(&GPIOA_IDR, 0, 1, 1) )            /**<  Wait Till pressed again to continue playing  */
                matrixrgb_refresh();

            while ( !Button(&GPIOA_IDR, 0, 1, 0 ) )           /**<  Wait for depress  */
                matrixrgb_refresh();
        }
        /**< End Of Pause Function ***************************/


        if ( move_flag )                            /**< Wait for timer flag ( 200us ) to allow movement of player */
        {
            move_player();
            move_flag = 0;
        }
        if ( ball_count_flag >= ball_speed )        /**< Wait for the timer to increment "ball_speed" times before moving the ball again */
        {
            move_ball();
            ball_count_flag = 0;
        }
        /**< If Game is over, win or not... Display screen, and return to Main Menu ***************/
        if ( safe == false || playing == false )    /**< If the player has failed, or won the game ( done playing ) */
        {

            time_s = 0;
#ifndef AUTOPLAY                    /**< If the AUTOPLAY is not defined, display a win/lose screen, and then display menu */
            matrixrgb_clear_screen();
            if ( safe == false )
                display_youlose();              /**<    Waits for A0 to be pressed  */
            else
                display_youwin();               /**<    Waits for A0 to be pressed  */
#endif
#ifdef BONUSLEVEL                               /**< If BONUSLEVEL is defined, allow playing of Bonus Level after completing level on Hard Mode */
            if ( playing == false && g_ball_speed == 200 )   /**< If you beat Hard Mode */
            {
                bonus_level = 1;
                display_bonuslevel();                       /**< Display Bonus Level Screen */
            }
#endif
            matrixrgb_clear_screen();                       /**< Win or lose, Clear Screen */
#ifndef AUTOPLAY                                /**< If AUTOPLAY is not defined, ask user for new option from Main Menu */
            wait_for_choice();
#endif
            //Setup Game
            matrixrgb_clear_screen();                       /**< Clear Screen ! */
            if ( !bonus_level )                             /**< Check if HARD level was beat, if so Bonus Level time */
                setup_gameboard( void );
            else                                            /**< Else, Setup the standard level */
                setup_bonus_level();
            bonus_level = 0;
            setup_player( void );                           /**< Setup Player at Default location to start */
            setup_ball( void );                             /**< Setup Ball at random location in random direction */
            safe = true;                                    /**< Set flags for fail and win back to defaults */
            playing = true;                                 /**< Ball direction set to up initially */
            ball_dir_vert = UP;
            Delay_ms(50);
            time = 0;
        }
        matrixrgb_refresh();                               /**< Refresh every loop */
    } /**< Play Game Loop End *****************************/
}

void clear_time_zone( void )
{
    uint8_t i, j;

    for ( i = 16; i < 29; i++ )
        for ( j = 0; j < 31; j++ )
            matrixrgb_erase_pixel( i, j );
}

void display_time( void )
{
    char time_str[3];
    color_t my_color;

    if ( time >= 10000 )
    {
        clear_time_zone();
        time_s++;
        time = 0;
    }
    matrixrgb_set_color( &my_color, 1, 0, 0 );
    matrixrgb_write_text( "Time", my_color, 4, 0, 0 );
    matrixrgb_write_text( ":", my_color, 1, 0, 27 );
    IntToStr( time_s, time_str );
    Ltrim( time_str );
    matrixrgb_write_text( time_str, my_color, 3, 16, 12 );
}

void display_youwin( void )
{
    bool wait = true;
    color_t my_color;
    matrixrgb_set_color( &my_color, 0, 0, 1 );

    matrixrgb_clear_screen();                           /**< Clear Screen to prepare for WIN screen */
    matrixrgb_write_text( " You  Win!", my_color, 10, 0, 0 );  /**< Display WIN Screen */

    while ( wait )
    {
        if (Button(&GPIOA_IDR, 0, 1, 1))                /**< Once A0 is pressed, wait for depress, and then exit function */
        {
            matrixrgb_clear_screen();
            while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );

            wait = false;
        }
        matrixrgb_refresh();                            /**< While nothing is pressed, continue to refresh WIN Screen */
    }
}

void display_youlose( void )
{
    bool wait = true;
    color_t my_color;
    matrixrgb_set_color( &my_color, 1, 0, 0 );

    matrixrgb_clear_screen();                           /**< Clear Screen to prepare for LOSE screen */
    matrixrgb_write_text( "You  Lose!", my_color, 10, 0, 0 );   /**< Display LOSE Screen */

    while ( wait )
    {
        if (Button(&GPIOA_IDR, 0, 1, 1))                /**< Once A0 is pressed, wait for depress, and then exit function */
        {
            matrixrgb_clear_screen();
            while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );

            wait = false;
        }
        matrixrgb_refresh();                            /**< While nothing is pressed, continue to refresh WIN Screen */
    }
}

void display_bonuslevel( void )
{
    bool wait = true;                                         /**< Clear Screen to prepare for BONUS LEVEL screen */
    matrixrgb_clear_screen();                                 /**< Display BONUS LEVEL Screen */
    matrixrgb_image_load(BonusLevelScreen_bmp, 32, 32 );

    while ( wait )
    {
        if (Button(&GPIOA_IDR, 0, 1, 1))                      /**< Once A0 is pressed, wait for depress, and then exit function */
        {
            matrixrgb_clear_screen();
            while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );          /**< While nothing is pressed, continue to refresh BONUS LEVEL Screen */

            wait = false;
        }
        matrixrgb_refresh();
    }
}


void wait_for_choice( void )
{
    bool waiting = true;

#ifndef AUTOPLAY
    //Display Main Menu Screen
    display_main_menu( void );

    while ( waiting )
    {
        matrixrgb_refresh();
        set_option();

        if (Button(&GPIOA_IDR, 0, 1, 1))                        /**< Once A0 is pressed, wait for depress, and then exit function */
        {
            matrixrgb_clear_screen();
            while ( !Button(&GPIOA_IDR, 0, 1, 0 ) );

            g_ball_speed = get_option();                        /**< get_option function returns speed value for ball , dependent on user choice */
            waiting = false;
        }
    }
#else
    g_ball_speed = 1;                                           /**< If AUTOPLAY is defined, ball speed is set to 2 */
#endif
}

void set_option( void )
{
    uint8_t position;

    adc_pos = ADC1_Get_Sample(3);
    position = adc_pos / 1365;                                  /**< Three different choices on Main Menu, so: 4096 / 3 = 1365 */

    matrixrgb_erase_pixel( 10, 3 );                             /**< Reset colors to red */
    matrixrgb_erase_pixel( 17, 3 );
    matrixrgb_erase_pixel( 24, 3 );
    matrixrgb_write_pixel( 10, 3 , 1, 0, 0 );
    matrixrgb_write_pixel( 17, 3 , 1, 0, 0 );
    matrixrgb_write_pixel( 24, 3 , 1, 0, 0 );

    if ( position == EASY )                                     /**< If position given is EASY, fill dot with white. ( Do for every choice ) */
        matrixrgb_write_pixel( 10, 3 , 1, 1, 1 );
    else if ( position == MEDIUM )
        matrixrgb_write_pixel( 17, 3 , 1, 1, 1 );
    else if ( position == HARD )
        matrixrgb_write_pixel( 24, 3 , 1, 1, 1 );

}

uint8_t get_option( void )
{
    uint8_t position;
    uint16_t speed;

    adc_pos = ADC1_Get_Sample(3);
    position = adc_pos / 1365;                                  /**< Three different choices on Main Menu, so: 4096 / 3 = 1365 */

    if ( position == EASY )
        speed = 500;
    else if ( position == MEDIUM )
        speed = 400;
    else if ( position == HARD )
        speed = 200;

    return speed;                                               /**< Return speed of ball depending on the choice by user */
}

void display_main_menu( void )
{
    uint8_t i = 0;

    matrixrgb_image_load( NewMainMenuBreakoutScreen_bmp, 32, 32 );   /**< Displays Main Menu Screen */
//        for( i = 0; i < offset; i++ )
    //      matrixrgb_shift_right();
}

bool is_game_over( void )
{
    uint8_t i;

    for ( i = 0; i < 48; i++ )                /**< Checks if ALL of the bricks are, active == false */
    {
        if ( bricks[i].active == true )
            return true;
    }
    return false;
}

void set_ball_pos( uint8_t vector_amount )
{
    if ( ball_dir_vert == UP )                                  /**< If the ball is traveling UP, the row is decremented */
        ball_curr_pos.row--;
    else if ( ball_dir_vert == DOWN )                           /**< If the ball is traveling DOWN, the row is incremented */
        ball_curr_pos.row++;

    if ( ball_dir_horiz == LEFT )                               /**< If the ball is traveling LEFT, the column is decremented */
        ball_curr_pos.col -= vector_amount;
    else if ( ball_dir_horiz == RIGHT )                         /**< If the ball is traveling RIGHT, the column is incremented */
        ball_curr_pos.col += vector_amount;

    if ( ball_curr_pos.col == 0 + offset || ball_curr_pos.col == ( 0 + offset - 1) || ball_curr_pos.col == 255 )   /**< Checks the Left side of screen boundary, 255 means it went past 0. ( When Vector amount is 2 ) */
    {
        ball_curr_pos.col = 0 + offset;
        ball_dir_horiz = RIGHT;
    }
    else if ( ball_curr_pos.col == 31 + offset || ball_curr_pos.col == 32 + offset )  /**< Checks the Right side of screen boundary */
    {
        ball_curr_pos.col = 31 + offset;
        ball_dir_horiz = LEFT;
    }
}

void set_vector( uint8_t *amount )
{
    if ( player_surface == MIDDLE_SURFACE )                   /**< If the last surface of the player hit was middle, vector is normal */
    {
        *amount = 1;
        ball_speed = g_ball_speed;
    }
    else if ( player_surface == LEFT_SURFACE || player_surface == RIGHT_SURFACE )      /**< If the last surface of the player hit was on a side, vector is 2 */
    {
        *amount = 2;
        ball_speed = g_ball_speed + 5;                                                 /**< Slows down ( normalizes ) speed  */
    }
}

void erase_brick( uint8_t number )
{
    uint16_t i;

    for ( i = 0; i < 4; i++ )                 /**< Erases block with index "number" */
    {
        matrixrgb_erase_pixel( bricks[number].row, ( bricks[number].col + i ) );
        matrixrgb_erase_pixel( ( bricks[number].row + 1 ), ( bricks[number].col + i ) );
    }

}

bool is_brick_hit( void ) /**< Big function. Took alot of checks to efficiently check if bricks are hit. Works well */
{
    uint8_t i;
    bool is_hit = false;

    for ( i = 0; i < 48; i++ )       /**< Checks every brick in the array to see if it is active, then if it has been hit */
    {
        if ( bricks[i].active )
        {
            if ( player_surface == MIDDLE_SURFACE )   /**< Hits depend on whether the vector is 1 ( MIDDLE_SURFACE ) or 2 ( RIGHT_SURFACE, LEFT_SURFACE ) */
            {
                if ( ball_dir_vert == UP )
                {
                    if ( ball_dir_horiz == LEFT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col + 4 )
                        {
                            brick_side_horiz = RIGHT_SIDE;
                            ball_dir_vert = UP;
                            ball_dir_horiz = RIGHT;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ball_curr_pos.row == bricks[i].row + 2 && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
                        {
                            brick_side_vert = BOTTOM_SIDE;
                            ball_dir_horiz = LEFT;
                            ball_dir_vert = DOWN;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                    }
                    else if ( ball_dir_horiz == RIGHT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col - 1 )
                        {
                            brick_side_horiz = LEFT_SIDE;
                            ball_dir_vert = UP;
                            ball_dir_horiz = LEFT;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ball_curr_pos.row == bricks[i].row + 2 && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
                        {
                            brick_side_vert = BOTTOM_SIDE;
                            ball_dir_vert = DOWN;
                            ball_dir_horiz = RIGHT;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }

                    }
                }
                else if ( ball_dir_vert == DOWN )
                {
                    if ( ball_dir_horiz == LEFT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col + 4 )
                        {
                            brick_side_horiz = RIGHT_SIDE;
                            ball_dir_horiz = RIGHT;
                            ball_dir_vert = DOWN;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ball_curr_pos.row == bricks[i].row - 1 && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
                        {
                            brick_side_vert = TOP_SIDE;
                            ball_dir_horiz = LEFT;
                            ball_dir_vert = UP;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                    }
                    else if ( ball_dir_horiz == RIGHT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ball_curr_pos.col == bricks[i].col - 1 )
                        {
                            brick_side_horiz = LEFT_SIDE;
                            ball_dir_horiz = LEFT;
                            ball_dir_vert = DOWN;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ball_curr_pos.row == bricks[i].row - 1 && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
                        {
                            brick_side_vert = TOP_SIDE;
                            ball_dir_horiz = RIGHT;
                            ball_dir_vert = UP;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }

                    }
                }
            }
            else if ( player_surface == LEFT_SURFACE || player_surface == RIGHT_SURFACE )
            {
                if ( ball_dir_vert == UP )
                {
                    if ( ball_dir_horiz == LEFT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col + 4 || ball_curr_pos.col == bricks[i].col + 3 ) )
                        {
                            brick_side_horiz = RIGHT_SIDE;
                            ball_dir_vert = UP;
                            ball_dir_horiz = RIGHT;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ( ball_curr_pos.row == bricks[i].row + 2 || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
                        {
                            brick_side_vert = BOTTOM_SIDE;
                            ball_dir_horiz = LEFT;
                            ball_dir_vert = DOWN;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                    }
                    else if ( ball_dir_horiz == RIGHT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col ) )
                        {
                            brick_side_horiz = LEFT_SIDE;
                            ball_dir_vert = UP;
                            ball_dir_horiz = LEFT;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ( ball_curr_pos.row == bricks[i].row + 2 || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
                        {
                            brick_side_vert = BOTTOM_SIDE;
                            ball_dir_vert = DOWN;
                            ball_dir_horiz = RIGHT;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }

                    }
                }
                else if ( ball_dir_vert == DOWN )
                {
                    if ( ball_dir_horiz == LEFT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col + 4 || ball_curr_pos.col == bricks[i].col + 3 ) )
                        {
                            brick_side_horiz = RIGHT_SIDE;
                            ball_dir_horiz = RIGHT;
                            ball_dir_vert = DOWN;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ( ball_curr_pos.row == bricks[i].row - 1 || ball_curr_pos.row == bricks[i].row ) && ( ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 || ball_curr_pos.col == bricks[i].col + 4 ) )
                        {
                            brick_side_vert = TOP_SIDE;
                            ball_dir_horiz = LEFT;
                            ball_dir_vert = UP;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                    }
                    else if ( ball_dir_horiz == RIGHT )
                    {
                        if ( ( ball_curr_pos.row == bricks[i].row || ball_curr_pos.row == bricks[i].row + 1 ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col ) )
                        {
                            brick_side_horiz = LEFT_SIDE;
                            ball_dir_horiz = LEFT;
                            ball_dir_vert = DOWN;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }
                        else if ( ( ball_curr_pos.row == bricks[i].row - 1 || ball_curr_pos.row == bricks[i].row ) && ( ball_curr_pos.col == bricks[i].col - 1 || ball_curr_pos.col == bricks[i].col || ball_curr_pos.col == bricks[i].col + 1 || ball_curr_pos.col == bricks[i].col + 2 || ball_curr_pos.col == bricks[i].col + 3 ) )
                        {
                            brick_side_vert = TOP_SIDE;
                            ball_dir_horiz = RIGHT;
                            ball_dir_vert = UP;
                            bricks[i].active = false;
                            erase_brick( i );
                            is_hit = true;
                        }

                    }
                }

            }
        }
    }

    return is_hit;
}

bool is_player_there( void )
{
    if ( ball_curr_pos.col >= player_curr_pos.col &&                /**< If the balls column is between the left and right most pixels of the player */
            ball_curr_pos.col < ( player_curr_pos.col + 6 ) )
    {
        if ( ball_curr_pos.col >= ( player_curr_pos.col + 4 ) )       /**< Checks if the ball hit the middle, left or right of the player */
            player_surface = RIGHT_SURFACE;
        else if ( ball_curr_pos.col > ( player_curr_pos.col + 2 ) )
            player_surface = MIDDLE_SURFACE;
        else
            player_surface = LEFT_SURFACE;
        return true;
    }
    else return false;     /**< If the player was not there, return false, indicating a YOU lose! */

}

void check_ball_boundaries( void )
{
    if ( ball_curr_pos.row == 0 )           /**< Check Vertical */
        ball_dir_vert = DOWN;
    else if ( ball_curr_pos.row >= 30 )
    {
        if ( !is_player_there() )
            safe = false;
        else
            ball_dir_vert = UP;
    }

    if ( ball_curr_pos.col == 0 + offset )           /**< Check Horizontal */
        ball_dir_horiz = RIGHT;
    else if ( ball_curr_pos.col == 31 + offset )
        ball_dir_horiz = LEFT;

}

void move_player( void )
{
    uint8_t i;
    uint8_t position;

    for ( i = player_curr_pos.col; i < ( player_curr_pos.col + 6 ); i++ )    /**< First erase and then write */
        matrixrgb_erase_pixel( player_curr_pos.row, i );

    position = ( adc_pos / 157 ) + offset;                       /**< Get ADC Position */
#ifdef AUTOPLAY                                         /**< If AUTOPLAY is enabled, place the player under the ball at all times */
    if ( ball_curr_pos.col < ( 3 + offset ) )
        player_curr_pos.col = 0 + offset;
    else if ( ball_curr_pos.col >= ( 29 + offset ) )
        player_curr_pos.col = 26 + offset;
    else
        player_curr_pos.col = ball_curr_pos.col - 3;    /**< "-3" to place it always in the middle so vector is almost always 1 */
#else
    player_curr_pos.col = position;                     /**< Player column is scaled ADC value */
#endif

    for ( i = player_curr_pos.col; i < ( player_curr_pos.col + 6 ); i++ )    /**< Draw character in new position */
        matrixrgb_write_pixel( player_curr_pos.row, i, 1, 0, 0 );

}

void move_ball( void )
{
    uint8_t amount;

    set_vector( &amount );                                          /**< If ball hits left or right side of player, increase angle */

    matrixrgb_erase_pixel( ball_curr_pos.row, ball_curr_pos.col );  /**< Erase ball from frame */
    if ( is_brick_hit() )                                           /**< If brick is hit, check once more for accuracy, and then check if it was the last brick */
    {
        is_brick_hit();
        playing = is_game_over();
    }
    check_ball_boundaries();                                        /**< Check to see if we've reached a boundary */
    set_ball_pos( amount );                                         /**< Set balls new position depending on vector value */
    matrixrgb_write_pixel( ball_curr_pos.row, ball_curr_pos.col, 1, 1, 1 ); /**< Write New pixel ( ball ) after erasing old */

}

void setup_ball( void )
{
    uint8_t random_row, random_col, random_direction;

    srand( rand_num );
    random_row = ( rand() % 13 ) + 12;          /**< Sets up ball to spawn at random spot: Range 12 - 24  */
    random_col = ( rand() % 32 ) + offset;      /**< Sets up ball to spawn at random spot: Range 0 - 31   */
    random_direction = rand() % 2;              /**< Sets up ball to spawn in random direction */

    ball_dir_horiz = random_direction;
    ball_curr_pos.row = random_row;
    ball_curr_pos.col = random_col;
    matrixrgb_write_pixel( ball_curr_pos.row, ball_curr_pos.col, 1, 1, 1 );  /**< Draw ball at random location */
}

void setup_gameboard( void )
{
    uint8_t i, j, k;
    color_t brick_color;

    matrixrgb_set_color( &brick_color, 0, 0, 1 );          /**< Draws entire game board, setting up array of bricks and setting all to active */
    for ( i = 0 + offset, j = 0; i <= 28 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col          = i;
        bricks[j].row          = 0;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 0, k, 1, 0, 0 );
            matrixrgb_write_pixel( 1, k, 1, 0, 0 );
        }
    }
    matrixrgb_set_color( &brick_color, 0, 1, 0 );
    for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col          = i;
        bricks[j].row          = 2;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 2, k, 0, 1, 0 );
            matrixrgb_write_pixel( 3, k, 0, 1, 0 );
        }
    }
    matrixrgb_set_color( &brick_color, 1, 0, 0 );
    for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col          = i;
        bricks[j].row          = 4;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 4, k, 0, 0, 1 );
            matrixrgb_write_pixel( 5, k, 0, 0, 1 );
        }
    }
    matrixrgb_set_color( &brick_color, 0, 0, 1 );
    for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col          = i;
        bricks[j].row          = 6;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 6, k, 1, 0, 0 );
            matrixrgb_write_pixel( 7, k, 1, 0, 0 );
        }
    }
    matrixrgb_set_color( &brick_color, 0, 1, 0 );
    for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col          = i;
        bricks[j].row          = 8;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 8, k, 0, 1, 0 );
            matrixrgb_write_pixel( 9, k, 0, 1, 0 );
        }
    }
    matrixrgb_set_color( &brick_color, 1, 0, 0 );
    for ( i = 0 + offset; i <= 28 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col          = i;
        bricks[j].row          = 10;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 10, k, 0, 0, 1 );
            matrixrgb_write_pixel( 11, k, 0, 0, 1 );
        }
    }

}

void setup_player( void )
{
    uint8_t i;

    player_curr_pos.row = 31;           /**< Player always start at default location */
    player_curr_pos.col = 12 + offset;
    for ( i = 12 + offset; i < 18 + offset; i++ )       /**< Draw player */
        matrixrgb_write_pixel( player_curr_pos.row, i, 1, 0, 0 );
    player_surface = MIDDLE_SURFACE;    /**< Start with default vector */
}

void system_setup( uint8_t width, uint8_t height, panel_size_t panel_size )
{

    GPIO_Digital_Output( &GPIOD_BASE, _GPIO_PINMASK_13); /**< Set Chip Select pin as output */
    GPIO_Digital_Output( &GPIOC_BASE, _GPIO_PINMASK_2 ); /**< Set Reset pin to output */
    GPIO_Digital_Input( &GPIOD_BASE, _GPIO_PINMASK_10);  /**< Set Ready to input */
    GPIO_Digital_Input(&GPIOA_IDR, _GPIO_PINMASK_0);     /**< Set PA0 as digital input ( Menu Button ) */

    SPI3_Init_Advanced(_SPI_FPCLK_DIV2, _SPI_MASTER | _SPI_8_BIT |              /**< Initialize SPI Communication */
                       _SPI_CLK_IDLE_LOW | _SPI_FIRST_CLK_EDGE_TRANSITION |
                       _SPI_MSB_FIRST | _SPI_SS_DISABLE | _SPI_SSM_DISABLE | _SPI_SSI_1,
                       &_GPIO_MODULE_SPI3_PC10_11_12);

    ADC_Set_Input_Channel(_ADC_CHANNEL_3);               /**< Choose ADC channel */
    ADC1_Init();                                         /**< Initialize ADC */
    Delay_ms(100);

    MATRIXRGB_RST = 0;                                   /**< Reset Slave, ( Toggle it ) */
    MATRIXRGB_RST = 1;
    Delay_ms(200);

    matrixrgb_init( width, height, panel_size );         /**< Initialize MatrixRGB Click, with brightness of 100, and width of 1 panel by height of 2 panels */
    Delay_ms(200);

    InitTimer2();                                        /**< Initialize Timer 2 at 10 us */

}

//Timer2 Prescaler :0; Preload = 7199; Actual Interrupt Time = 100 us
void InitTimer2() {
    RCC_APB1ENR.TIM2EN = 1;
    TIM2_CR1.CEN = 0;
    TIM2_PSC = 0;
    TIM2_ARR = 7199;
    NVIC_IntEnable(IVT_INT_TIM2);
    TIM2_DIER.UIE = 1;
    TIM2_CR1.CEN = 1;
}

void Timer2_interrupt() iv IVT_INT_TIM2 {
    TIM2_SR.UIF = 0;

    move_flag = 1;             /**< Set Move flag for player to 1 every ? us */
    ball_count_flag++;         /**< ball_count_flag is used for speed of the ball */
    rand_num++;                /**< rand_num is used for random number generation */
    time++;
    if ( rand_num >= 65500 )   /**< Instead of rolling over, I reset the value of rand_num */
        rand_num = 0;
}

/* BONUS LEVEL */

void setup_bonus_level( void )
{
    uint8_t i, j, k;
    color_t brick_color;
    matrixrgb_set_color( &brick_color, 1, 0, 0 );
    //Erase previous settings for bricks
    for ( i = 0 + offset; i < 48 + offset; i++ )
    {
        bricks[i].color  = brick_color;
        bricks[i].col    = 0;
        bricks[i].row    = 0;
        bricks[i].active = false;
    }


    for ( i = 4 + offset, j = 0; i <= 20 + offset; i += 4, j++ )                // The top of the E
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 0;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 0, k, 1, 0, 0 );
            matrixrgb_write_pixel( 1, k, 1, 0, 0 );
        }
    }
    for ( i = 4 + offset; i < 8 + offset; i += 4 , j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 2;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 2, k, 1, 0, 0 );
            matrixrgb_write_pixel( 3, k, 1, 0, 0 );
        }
    }
    for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 4;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 4, k, 1, 0, 0 );
            matrixrgb_write_pixel( 5, k, 1, 0, 0 );
        }
    }

    for ( i = 4 + offset; i <= 16 + offset; i += 4, j++ )                       //The middle of the E
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 6;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 6, k, 1, 0, 0 );
            matrixrgb_write_pixel( 7, k, 1, 0, 0 );
        }
    }

    for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 8;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 8, k, 1, 0, 0 );
            matrixrgb_write_pixel( 9, k, 1, 0, 0 );
        }
    }
    for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 10;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 10, k, 1, 0, 0 );
            matrixrgb_write_pixel( 11, k, 1, 0, 0 );
        }
    }
    for ( i = 4 + offset; i < 8 + offset; i += 4, j++ )
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 10;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 12, k, 1, 0, 0 );
            matrixrgb_write_pixel( 13, k, 1, 0, 0 );
        }
    }


    for ( i = 4 + offset; i <= 20 + offset; i += 4, j++ )                       //The bottom of the E
    {
        bricks[j].color  = brick_color;
        bricks[j].col    = i;
        bricks[j].row    = 14;
        bricks[j].active = true;
        for ( k = i; k < ( i + 4 ); k++ )
        {
            matrixrgb_write_pixel( 14, k, 1, 0, 0 );
            matrixrgb_write_pixel( 15, k, 1, 0, 0 );
        }
    }



}