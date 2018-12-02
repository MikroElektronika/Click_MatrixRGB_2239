#include "Click_Matrix_RGB_types.h"

const uint32_t _MATRIXRGB_SPI_CFG[ 3 ] = 
{ 
	500000,  
	_SPI_MSB_FIRST, 
	_SPI_CLK_IDLE_LOW | 
	_SPI_SAMPLE_DATA_RISING_EDGE 
};