#include "hip/hip_runtime.h"
#include "includes.h"
#define NTHREADS 512

__global__ void getColNorms(int rows, int cols, float* da, int lda, float* colNorms)
{
    int colIndex = threadIdx.x + blockIdx.x * blockDim.x;
    if (colIndex >= cols) return;

    float sum = 0.f;  // Initialize the sum

    // Use shared memory to reduce global memory accesses
    __shared__ float partialSum[NTHREADS];  
    partialSum[threadIdx.x] = 0.f;  // Initialize shared memory

    float* col = da + colIndex * lda;
    for (int i = threadIdx.x; i < rows; i += blockDim.x) {
        float term = col[i];
        partialSum[threadIdx.x] += term * term;
    }

    // Use a parallel reduction to sum up squared terms
    __syncthreads();
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (threadIdx.x < offset) {
            partialSum[threadIdx.x] += partialSum[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // The result is stored in the first thread of each block
    if (threadIdx.x == 0) {
        colNorms[colIndex] = partialSum[0];
    }
}