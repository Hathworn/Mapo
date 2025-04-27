#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void SumReduction(int* input, int n)
{
    // Handle to thread block group
    extern __shared__ int sm[];

    // Load shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    sm[tid] = (i < n) ? input[i] : 0;
    
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) // Optimize loop range and step
    {
        if (tid < s)
        {
            sm[tid] += sm[tid + s];
        }
        
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0)
    {
        input[blockIdx.x] = sm[0];
    }
}