#include "hip/hip_runtime.h"
#include "includes.h"

// Constants used by the program
#define BLOCK_DIM                      16

//-----------------------------------------------------------------------------------------------//
//                                            KERNELS                                            //
//-----------------------------------------------------------------------------------------------//

/**
* Computes the square root of the first line (width-th first element)
* of the distance matrix.
*
* @param dist    distance matrix
* @param width   width of the distance matrix
* @param k       number of neighbors to consider
*/
__global__ void cuParallelSqrt(float *dist, int width, int k) {
    // Use 1D block and grid to improve memory coalescing
    unsigned int xIndex = blockIdx.x * blockDim.x + threadIdx.x;
    if (xIndex < width * k) {
        dist[xIndex] = sqrt(dist[xIndex]);
    }
}