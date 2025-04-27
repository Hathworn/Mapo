#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void block_sum(const float *input, float *per_block_results, const size_t n)
{
    extern __shared__ float sdata[];

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into __shared__ memory if within bounds
    float x = (i < n) ? input[i] : 0;
    sdata[threadIdx.x] = x;
    __syncthreads();

    // Contiguous range reduction
    for(int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if(threadIdx.x < offset)
        {
            // Add a partial sum from the "upstream" neighbor
            sdata[threadIdx.x] += sdata[threadIdx.x + offset];
        }
        // Ensure all threads in block have updated their partial sums
        __syncthreads();
    }

    // Thread 0 writes the final result
    if(threadIdx.x == 0)
    {
        per_block_results[blockIdx.x] = sdata[0];
    }
}