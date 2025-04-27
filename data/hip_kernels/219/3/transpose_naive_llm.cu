#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void transpose_naive(float *odata, float *idata, int width, int height)
{
    // Utilize shared memory to optimize memory access pattern
    __shared__ float tile[TILE_DIM][TILE_DIM+1];
    
    unsigned int xIndex = blockDim.x * blockIdx.x + threadIdx.x;
    unsigned int yIndex = blockDim.y * blockIdx.y + threadIdx.y;
    
    // Load data from global memory to shared memory
    if (xIndex < width && yIndex < height)
    {
        unsigned int index_in = xIndex + width * yIndex;
        tile[threadIdx.y][threadIdx.x] = idata[index_in];
    }
    
    __syncthreads();
    
    // Calculate transpose indices
    xIndex = blockDim.y * blockIdx.y + threadIdx.x;
    yIndex = blockDim.x * blockIdx.x + threadIdx.y;
    
    // Write data from shared memory to global memory
    if (xIndex < height && yIndex < width)
    {
        unsigned int index_out = xIndex + height * yIndex;
        odata[index_out] = tile[threadIdx.x][threadIdx.y];
    }
}