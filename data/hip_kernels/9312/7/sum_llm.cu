#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for summing elements
__global__ void sum(int *a, int *b, int n)
{
    // Shared memory for partial sums
    __shared__ int sharedSum[256];
    
    // Calculate global index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared memory to zero
    sharedSum[threadIdx.x] = (idx < n) ? a[idx] : 0;
    __syncthreads();

    // Perform sum reduction within a block
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        if (threadIdx.x % (2 * stride) == 0) {
            sharedSum[threadIdx.x] += sharedSum[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Write the result from the first thread of each block
    if (threadIdx.x == 0) {
        b[blockIdx.x] = sharedSum[0];
    }
}