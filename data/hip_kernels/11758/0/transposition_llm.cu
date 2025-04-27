#include "hip/hip_runtime.h"
#include "includes.h"
#define _CRT_SECURE_NO_WARNINGS

#define BLOCK_DIM 16

__global__ void transposition(int* matrix, int* matrixOut, int length, int width)
{
    __shared__ int tempMatrix[BLOCK_DIM][BLOCK_DIM + 1]; // Avoid bank conflicts

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int j = blockIdx.y * blockDim.y + threadIdx.y;

    // Load data into shared memory if within bounds
    if (i < length && j < width)
    {
        tempMatrix[threadIdx.y][threadIdx.x] = matrix[j * length + i];
    }

    __syncthreads();

    // Transpose the block and write to output if within bounds
    i = blockIdx.y * blockDim.y + threadIdx.x;
    j = blockIdx.x * blockDim.x + threadIdx.y;

    if (i < width && j < length)
    {
        matrixOut[j * width + i] = tempMatrix[threadIdx.x][threadIdx.y];
    }
}