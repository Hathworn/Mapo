#include "hip/hip_runtime.h"
#include "includes.h"
//-----------------------------------------
// Autor: Farias
// Data : January 2012
// Goal : Image treatment
//-----------------------------------------

/***************************************************************************************************
Includes
***************************************************************************************************/



/***************************************************************************************************
Defines
***************************************************************************************************/

#define ELEM(i,j,DIMX_) (i+(j)*(DIMX_))
#define BLOCK_SIZE 16


/***************************************************************************************************
Functions
***************************************************************************************************/

using namespace std;


/**************************************************************************************************/

__global__ void filter1( int width, int height, unsigned char *src, unsigned char *dest ) {

    // Calculate i and j using block and thread indices
    int i = threadIdx.x + blockIdx.x * blockDim.x;
    int j = threadIdx.y + blockIdx.y * blockDim.y;

    if(i > 0 && j > 0 && i < width - 1 && j < height - 1) {
        int idx_center = 3 * ELEM(i, j, width);
        int idx_left = 3 * ELEM(i - 1, j, width);
        int idx_right = 3 * ELEM(i + 1, j, width);
        int idx_top = 3 * ELEM(i, j - 1, width);
        int idx_bottom = 3 * ELEM(i, j + 1, width);
        
        for (int k = 0; k < 3; ++k) {
            int aux = 0;
            
            // Central pixel
            aux += 4 * src[idx_center + k];
            
            // Surrounding pixels
            aux += 2 * src[idx_left + k];
            aux += 2 * src[idx_right + k];
            aux += 2 * src[idx_top + k];
            aux += 2 * src[idx_bottom + k];

            aux /= 12;
            
            // Store the result
            dest[idx_center + k] = (unsigned char) aux;
        }
    }
}