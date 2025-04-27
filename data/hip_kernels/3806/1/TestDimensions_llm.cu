#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void TestDimensions()
{
    // Pre-calculate common products to reduce redundant calculations
    int const num_threads_per_block = blockDim.x * blockDim.y * blockDim.z;
    int const num_blocks = gridDim.x * gridDim.y * gridDim.z;
    int const threads_stride = num_threads_per_block * num_blocks;

    int const blockIdx_xy = blockIdx.x + blockIdx.y * gridDim.x;
    int const blockIdx_xyz = blockIdx_xy + blockIdx.z * gridDim.x * gridDim.y;
    int const threadIdx_xy = threadIdx.x + threadIdx.y * blockDim.x;

    // Calculate unique thread ID
    int const thread_id = blockIdx_xyz * num_threads_per_block + threadIdx_xy + threadIdx.z * blockDim.x * blockDim.y;

    if (thread_id == 0)
    {
        printf("gridDim   = x: %6d / y: %6d / z: %6d\r\n", gridDim.x, gridDim.y, gridDim.z);
        printf("blockDim  = x: %6d / y: %6d / z: %6d\r\n", blockDim.x, blockDim.y, blockDim.z);
        printf("num_threads_per_block: %6d\r\n", num_threads_per_block);
        printf("num_blocks           : %6d\r\n", num_blocks);
        printf("threads_stride       : %6d\r\n", threads_stride);
    }

    // Print thread and block details
    printf("tidx | %6d | %6d | %6d | bidx | %6d | %6d | %6d | "
           "gdim | %6d | %6d | %6d | bdim | %6d | %6d | %6d | "
           "thread_id | %6d |\r\n",
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z,
           gridDim.x, gridDim.y, gridDim.z,
           blockDim.x, blockDim.y, blockDim.z, thread_id);

    return;
}