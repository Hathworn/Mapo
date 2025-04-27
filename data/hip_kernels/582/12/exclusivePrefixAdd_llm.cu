#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void exclusivePrefixAdd(unsigned int* d_in, unsigned int* d_out)
{
    // Belloch implementation
    // NOTE: This is set up specifically for 1 block of 1024 threads

    int thread_x = threadIdx.x;
    
    // Load data from global memory to shared memory to reduce global memory accesses
    __shared__ unsigned int temp[1024];
    temp[thread_x] = d_in[thread_x];
    __syncthreads();

    // First, do the reduce:
    for (unsigned int i = 2; i <= blockDim.x; i <<= 1)
    {
        if ((thread_x + 1) % i == 0)
        {
            temp[thread_x] += temp[thread_x - i / 2];
        }
        __syncthreads();
    }

    // Now do the downsweep part:
    if (thread_x == blockDim.x - 1)
    {
        temp[thread_x] = 0;
    }
    __syncthreads();

    for (unsigned int i = blockDim.x; i >= 2; i >>= 1)
    {
        if ((thread_x + 1) % i == 0)
        {
            unsigned int tmp = temp[thread_x - (i / 2)];
            // the "left" copy
            temp[thread_x - (i / 2)] = temp[thread_x];
            // and the "right" operation
            temp[thread_x] = tmp + temp[thread_x];
        }
        __syncthreads();
    }

    // Write back the result to the global memory
    d_out[thread_x] = temp[thread_x];
}