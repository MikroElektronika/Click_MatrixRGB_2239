#include "Click_Matrix_RGB_types.h"

const uint32_t _MATRIXRGB_SPI_CFG[ 3 ] = 
{ 
	500000, 
	_SPI_MASTER, 
	_SPI_8_BIT | 
	_SPI_CLK_IDLE_HIGH |
	_SPI_SECOND_CLK_EDGE_TRANSITION 
};

