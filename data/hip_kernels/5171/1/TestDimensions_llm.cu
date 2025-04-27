#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TestDimensions()
{
    int const num_threads_per_block = blockDim.x * blockDim.y * blockDim.z;
    int const thread_id = blockIdx.x * num_threads_per_block + 
                          threadIdx.z * blockDim.x * blockDim.y +
                          threadIdx.y * blockDim.x + 
                          threadIdx.x;  // Simplified thread_id calculation

    if(thread_id == 0)
    {
        printf("gridDim   = x: %6d / y: %6d / z: %6d\r\n", gridDim.x, gridDim.y, gridDim.z);
        printf("blockDim  = x: %6d / y: %6d / z: %6d\r\n", blockDim.x, blockDim.y, blockDim.z);
        printf("num_threads_per_block: %6d\r\n", num_threads_per_block);
        int const num_blocks = gridDim.x * gridDim.y * gridDim.z;
        int const threads_stride = num_threads_per_block * num_blocks;  // Calculate only in thread 0
        printf("num_blocks           : %6d\r\n", num_blocks);
        printf("threads_stride       : %6d\r\n", threads_stride);
    }
    
    printf("tidx | %6d | %6d | %6d | bidx | %6d | %6d | %6d | "
           "gdim | %6d | %6d | %6d | bdim | %6d | %6d | %6d | "
           "thread_id | %6d |\r\n",
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z,
           gridDim.x, gridDim.y, gridDim.z,
           blockDim.x, blockDim.y, blockDim.z, thread_id);
}