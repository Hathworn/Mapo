#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void TestDimensions()
{
    int const thread_id = blockIdx.x * blockDim.x +
                          blockIdx.y * blockDim.x * blockDim.y +
                          blockIdx.z * blockDim.x * blockDim.y * blockDim.z +
                          threadIdx.x +
                          threadIdx.y * blockDim.x +
                          threadIdx.z * blockDim.x * blockDim.y;

    // Simplified calculation for fixed printf calls for block and grid dimensions
    if (thread_id == 0)
    {
        printf("gridDim   = x: %6d / y: %6d / z: %6d\r\n", gridDim.x, gridDim.y, gridDim.z);
        printf("blockDim  = x: %6d / y: %6d / z: %6d\r\n", blockDim.x, blockDim.y, blockDim.z);
        printf("num_threads_per_block: %6d\r\n", blockDim.x * blockDim.y * blockDim.z);
        printf("num_blocks           : %6d\r\n", gridDim.x * gridDim.y * gridDim.z);
        printf("threads_stride       : %6d\r\n", blockDim.x * blockDim.y * blockDim.z * gridDim.x * gridDim.y * gridDim.z);
    }

    printf("tidx | %6d | %6d | %6d | bidx | %6d | %6d | %6d | "
           "gdim | %6d | %6d | %6d | bdim | %6d | %6d | %6d | "
           "thread_id | %6d |\r\n",
            threadIdx.x, threadIdx.y, threadIdx.z,
            blockIdx.x, blockIdx.y, blockIdx.z,
            gridDim.x, gridDim.y, gridDim.z,
            blockDim.x, blockDim.y, blockDim.z, thread_id);

    return;
}