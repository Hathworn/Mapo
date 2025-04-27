#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK_DIM 16

__global__ void transpose_relu(float *odata, float *idata, int width, int height)
{
    __shared__ float block[BLOCK_DIM][BLOCK_DIM + 1]; // Optimize alignment for shared memory

    unsigned int xIndex = blockIdx.x * BLOCK_DIM + threadIdx.x;
    unsigned int yIndex = blockIdx.y * BLOCK_DIM + threadIdx.y;

    // Reduce redundant condition checks
    if (xIndex < width && yIndex < height) 
    {
        unsigned int index_in = yIndex * width + xIndex;
        block[threadIdx.y][threadIdx.x] = idata[index_in]; // Load data into shared memory
    }

    __syncthreads(); // Ensure all writes to block[][] have completed

    // Use more descriptive variable names
    unsigned int xIndex_out = blockIdx.y * BLOCK_DIM + threadIdx.x;
    unsigned int yIndex_out = blockIdx.x * BLOCK_DIM + threadIdx.y;
    if (xIndex_out < height && yIndex_out < width) 
    {
        unsigned int index_out = yIndex_out * height + xIndex_out;
        odata[index_out] = block[threadIdx.x][threadIdx.y]; // Write transposed data to global memory
    }
}