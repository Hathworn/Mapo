#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void TestDimensions()
{
    // Cache grid and block dimensions
    int gridX = gridDim.x;
    int gridY = gridDim.y;
    int gridZ = gridDim.z;
    int blockX = blockDim.x;
    int blockY = blockDim.y;
    int blockZ = blockDim.z;

    // Compute constants
    int const num_threads_per_block = blockX * blockY * blockZ;
    int const num_blocks = gridX * gridY * gridZ;
    int const threads_stride = num_threads_per_block * num_blocks;

    // Optimize thread_id calculation using cached dimensions
    int const thread_id = blockIdx.x * num_threads_per_block +
                          blockIdx.y * gridX * num_threads_per_block +
                          blockIdx.z * gridX * gridY * num_threads_per_block +
                          threadIdx.x +
                          threadIdx.y * blockX +
                          threadIdx.z * blockX * blockY;

    if (thread_id == 0)
    {
        printf("gridDim   = x: %6d / y: %6d / z: %6d\r\n", gridX, gridY, gridZ);
        printf("blockDim  = x: %6d / y: %6d / z: %6d\r\n", blockX, blockY, blockZ);
        printf("num_threads_per_block: %6d\r\n", num_threads_per_block);
        printf("num_blocks           : %6d\r\n", num_blocks);
        printf("threads_stride       : %6d\r\n", threads_stride);
    }

    printf("tidx | %6d | %6d | %6d | bidx | %6d | %6d | %6d | "
           "gdim | %6d | %6d | %6d | bdim | %6d | %6d | %6d | "
           "thread_id | %6d |\r\n",
           threadIdx.x, threadIdx.y, threadIdx.z,
           blockIdx.x, blockIdx.y, blockIdx.z,
           gridX, gridY, gridZ,
           blockX, blockY, blockZ, thread_id);

    return;
}