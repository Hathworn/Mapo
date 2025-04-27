#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16

__global__ void transpose(float *odata, float *idata, int width, int height)
{
    __shared__ float block[BLOCK_DIM][BLOCK_DIM+1];

    // Optimize reading by initializing indices only once
    unsigned int xIndex = blockIdx.x * BLOCK_DIM + threadIdx.x;
    unsigned int yIndex = blockIdx.y * BLOCK_DIM + threadIdx.y;

    // Read the matrix tile into shared memory
    if ((xIndex < width) && (yIndex < height))
    {
        block[threadIdx.y][threadIdx.x] = idata[yIndex * width + xIndex];
    }

    __syncthreads();

    // Transpose and write the matrix tile to global memory
    xIndex = blockIdx.y * BLOCK_DIM + threadIdx.x;
    yIndex = blockIdx.x * BLOCK_DIM + threadIdx.y;

    if ((xIndex < height) && (yIndex < width))
    {
        odata[yIndex * height + xIndex] = block[threadIdx.x][threadIdx.y];
    }
}