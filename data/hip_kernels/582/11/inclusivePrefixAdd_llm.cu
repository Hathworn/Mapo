#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void inclusivePrefixAdd(unsigned int* d_in, unsigned int* d_out)
{
    // Preprocess input into shared memory for better memory access pattern
    int abs_x = threadIdx.x + blockIdx.x * blockDim.x;
    int thread_x = threadIdx.x;
    
    extern __shared__ unsigned int segment[];
    segment[thread_x] = d_in[abs_x];
    __syncthreads();

    // Hillis-Steele scan loop with shared memory optimization
    for (unsigned int i = 1; i < blockDim.x; i <<= 1)
    {
        unsigned int val = 0;
        if (thread_x >= i)
        {
            val = segment[thread_x - i];
        }
        __syncthreads(); // Ensure all threads have read before updating
        segment[thread_x] += val;
        __syncthreads(); // Ensure all updates complete before the next iteration
    }

    // Handle carry-over between blocks
    if (blockIdx.x > 0)
    {
        unsigned int carry = d_out[blockDim.x * (blockIdx.x - 1)];
        segment[thread_x] += carry;
    }

    d_out[abs_x] = segment[thread_x];
}