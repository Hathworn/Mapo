#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Kogge_Stone_scan_kernel(float *X, float *Y, int InputSize)
{
    __shared__ float XY[SECTION_SIZE];
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize shared memory and handle boundaries more efficiently
    XY[threadIdx.x] = (i > 0 && i <= InputSize) ? X[i - 1] : 0;
    
    // Perform iterative exclusive scan on XY
    for (unsigned int stride = 1; stride < blockDim.x; stride *= 2) {
        __syncthreads();  // Moved to the start of the loop for proper data synchronization
        float t = (threadIdx.x >= stride) ? XY[threadIdx.x - stride] : 0;
        __syncthreads();  // Ensure all reads are completed
        XY[threadIdx.x] += t;
    }
    
    // Write result to global memory if within bounds
    if (i < InputSize)
    {
        Y[i] = XY[threadIdx.x];
    }
}