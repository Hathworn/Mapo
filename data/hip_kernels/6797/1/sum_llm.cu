#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void sum(int *a, int *b, int n)
{
    __shared__ int shared_sum[256]; // Allocate shared memory
    int tid = threadIdx.x;
    int block_offset = blockDim.x * blockIdx.x;
    shared_sum[tid] = 0;

    // Load elements into shared memory
    for (int i = tid + block_offset; i < min(block_offset + blockDim.x, n); i += blockDim.x)
    {
        shared_sum[tid] += a[i];
    }

    __syncthreads();  // Synchronize threads before reduction

    // Reduce within the block
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1)
    {
        if (tid < stride)
        {
            shared_sum[tid] += shared_sum[tid + stride];
        }
        __syncthreads();  // Ensure all threads reach this point before next iteration
    }

    // Write the result of block reduction to global memory
    if (tid == 0)
    {
        b[blockIdx.x] = shared_sum[0];
    }
}