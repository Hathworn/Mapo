#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void idx_print()
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    int warp_idx = threadIdx.x / warpSize; // Calculate warp index
    int lane_idx = threadIdx.x & (warpSize - 1); // Calculate lane index

    if ((lane_idx & (warpSize/2 - 1)) == 0) // Condition to reduce thread divergence
        printf(" %5d\t%5d\t %2d\t%2d\n", idx, blockIdx.x, warp_idx, lane_idx); // Print thread info
}