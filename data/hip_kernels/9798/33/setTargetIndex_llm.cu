#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with shared memory access

__global__ void setTargetIndex(int n, double *w, double *out)
{
    // Use shared memory for faster data access
    __shared__ double shared_w[1024];
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Load data into shared memory
    if (i < n)
    {
        shared_w[threadIdx.x] = w[i];
    }
    __syncthreads();

    // Compute if data is loaded
    if (i < n)
    {
        if (shared_w[threadIdx.x] == 1.0) 
        {
            out[i] -= 1.0;
        }
    }
}