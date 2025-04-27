#include "hip/hip_runtime.h"
#include "includes.h"

// Macro for calculating global ID in a 1D-2D grid
#define GLOBAL_ID_1D_2D (blockIdx.x * blockDim.x * blockDim.y + threadIdx.y * blockDim.x + threadIdx.x)

__global__ void kernel_1D_2D()
{
    // Print the local and global thread IDs using calculated macro
    printf("Local thread IDs: (%i,%i)   Global thread ID: %i\n", threadIdx.x, threadIdx.y, GLOBAL_ID_1D_2D);
}