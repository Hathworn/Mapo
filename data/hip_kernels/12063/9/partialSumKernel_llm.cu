#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void partialSumKernel(int *X, int N)
{
    __shared__ int partialSum[BLOCK_SIZE * 2]; // Allocate for full range
    int tx = threadIdx.x;
    int i = blockIdx.x * blockDim.x * 2 + tx; // Process two elements per thread

    // Load data into shared memory with boundary checking
    partialSum[tx] = (i < N) ? X[i] : 0;
    partialSum[tx + blockDim.x] = (i + blockDim.x < N) ? X[i + blockDim.x] : 0;

    for (int stride = blockDim.x; stride > 0; stride >>= 1) {
        __syncthreads();
        if (tx < stride) {
            partialSum[tx] += partialSum[tx + stride];
        }
    }

    if (tx == 0) {
        X[blockIdx.x] = partialSum[0]; 
    }
}