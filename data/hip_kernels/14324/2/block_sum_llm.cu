#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void block_sum(const int *input, int *per_block_results, const size_t n)
{
    extern __shared__ int sdata[];

    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Load input into shared memory with bounds check
    int x = (i < n) ? input[i] : 0;
    sdata[threadIdx.x] = x;
    __syncthreads();

    // Unroll the loop for better performance
    for(int offset = blockDim.x / 2; offset > 0; offset >>= 1)
    {
        if(threadIdx.x < offset)
        {
            // Add a partial sum
            sdata[threadIdx.x] += sdata[threadIdx.x + offset];
        }
        __syncthreads();
    }

    // Write the result of the block's sum
    if(threadIdx.x == 0)
    {
        per_block_results[blockIdx.x] = sdata[0];
    }
}