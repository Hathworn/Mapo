#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 16

__device__ float f(float x)
{
    return 4.f / (1.f + x * x);
}

__global__ void transGPU(const float *inMatrix, float *outMatrix, const size_t row, const size_t column)
{
    // Use shared memory to reduce global memory accesses
    __shared__ float tile[BLOCK_SIZE][BLOCK_SIZE];

    size_t xIndex = blockIdx.x * BLOCK_SIZE + threadIdx.x;
    size_t yIndex = blockIdx.y * BLOCK_SIZE + threadIdx.y;

    if ((xIndex < column) && (yIndex < row))
    {
        size_t inIndex = yIndex * column + xIndex;
        tile[threadIdx.y][threadIdx.x] = inMatrix[inIndex]; // Loading to shared memory
    }
    __syncthreads(); // Ensure all threads have loaded data into shared memory

    xIndex = blockIdx.y * BLOCK_SIZE + threadIdx.x; // Transpose block offset
    yIndex = blockIdx.x * BLOCK_SIZE + threadIdx.y; // Transpose block offset

    if ((xIndex < row) && (yIndex < column))
    {
        size_t outIndex = yIndex * row + xIndex;
        outMatrix[outIndex] = tile[threadIdx.x][threadIdx.y]; // Store from shared memory to global memory
    }
}