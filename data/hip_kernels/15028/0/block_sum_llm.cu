#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void block_sum(const float *input, float *per_block_results, const size_t n)
{
    extern __shared__ float sdata[];

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into __shared__ memory
    if(i < n)
    {
        sdata[threadIdx.x] = input[i];
    }
    else
    {
        sdata[threadIdx.x] = 0.0f; // Initialize with 0 when out of bounds
    }
    __syncthreads();

    // Unrolled loop for contiguous range pattern
    for(int offset = blockDim.x / 2; offset > 32; offset >>= 1)
    {
        if(threadIdx.x < offset)
        {
            sdata[threadIdx.x] += sdata[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Optimize the last warp without barriers
    if(threadIdx.x < 32)
    {
        volatile float *vsdata = sdata;
        vsdata[threadIdx.x] += vsdata[threadIdx.x + 32];
        vsdata[threadIdx.x] += vsdata[threadIdx.x + 16];
        vsdata[threadIdx.x] += vsdata[threadIdx.x + 8];
        vsdata[threadIdx.x] += vsdata[threadIdx.x + 4];
        vsdata[threadIdx.x] += vsdata[threadIdx.x + 2];
        vsdata[threadIdx.x] += vsdata[threadIdx.x + 1];
    }

    // Thread 0 writes the final result
    if(threadIdx.x == 0)
    {
        per_block_results[blockIdx.x] = sdata[0];
    }
}