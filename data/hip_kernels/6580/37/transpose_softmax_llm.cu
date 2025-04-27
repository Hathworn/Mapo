#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_DIM 16  // assuming BLOCK_DIM is defined elsewhere

__global__ void transpose_softmax(float *odata, float *idata, int width, int height)
{
    __shared__ float block[BLOCK_DIM][BLOCK_DIM + 1];

    unsigned int xIndex = blockIdx.x * BLOCK_DIM + threadIdx.x;
    unsigned int yIndex = blockIdx.y * BLOCK_DIM + threadIdx.y;

    // Utilize shared memory efficiently by avoiding bank conflicts
    if (xIndex < width && yIndex < height)
    {
        block[threadIdx.y][threadIdx.x] = idata[yIndex * width + xIndex];
    }

    __syncthreads();

    xIndex = blockIdx.y * BLOCK_DIM + threadIdx.x;
    yIndex = blockIdx.x * BLOCK_DIM + threadIdx.y;

    // Ensure that the transposed indices access within bounds
    if (xIndex < height && yIndex < width)
    {
        odata[yIndex * height + xIndex] = block[threadIdx.x][threadIdx.y];
    }
}