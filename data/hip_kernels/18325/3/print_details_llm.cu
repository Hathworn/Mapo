#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void print_details()
{
    // Use a single printf statement for better readability and efficiency
    printf(
        "blockIdx: (%d, %d, %d), blockDim: (%d, %d, %d), gridDim: (%d, %d, %d)\n",
        blockIdx.x, blockIdx.y, blockIdx.z,
        blockDim.x, blockDim.y, blockDim.z,
        gridDim.x, gridDim.y, gridDim.z
    );
}