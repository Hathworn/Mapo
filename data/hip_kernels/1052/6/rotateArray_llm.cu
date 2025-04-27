#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void rotateArray(int *c, int numThreads)
{
    // Compute the next index for each thread using blockIdx and blockDim for more flexibility
    int nextIndex = (blockIdx.x * blockDim.x + threadIdx.x + 1) % numThreads;

    // Load value from next index
    int val = c[nextIndex];

    // Ensure that all threads have performed their read before writing
    __syncthreads();

    // Write value to current index
    c[blockIdx.x * blockDim.x + threadIdx.x] = val;
}