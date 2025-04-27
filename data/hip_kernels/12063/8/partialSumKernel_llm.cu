#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void partialSumKernel(int *X, int N)
{
    __shared__ int partialSum[2 * BLOCK_SIZE];
    int tx = threadIdx.x;
    int i = blockIdx.x * blockDim.x + tx;

    // Optimize load by adding a conditional check
    partialSum[tx] = (i < N) ? X[i] : 0;
    partialSum[tx + blockDim.x] = 0;

    __syncthreads(); // Ensure all loads are completed
    
    // Use loop unrolling to reduce the number of iterations
    for (int stride = blockDim.x; stride > 0; stride >>= 1) {
        if (tx < stride) {
            partialSum[tx] += partialSum[tx + stride];
        }
        __syncthreads(); // Ensure all adds are completed before next iteration
    }

    // Write back the result to global memory
    if (tx == 0) {
        X[blockIdx.x] = partialSum[0];
    }
}