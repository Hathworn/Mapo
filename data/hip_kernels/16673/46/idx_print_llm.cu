#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void idx_print()
{
    // Calculate global thread index in a more concise way
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use bitwise operations to compute warp and lane indices
    int warp_idx = threadIdx.x / warpSize;
    int lane_idx = threadIdx.x & (warpSize - 1);

    // Optimize condition for printing using bitwise operations
    if ((lane_idx & ((warpSize >> 1) - 1)) == 0)
        // Printing the indices
        printf(" %5d\t%5d\t %2d\t%2d\n", idx, blockIdx.x, warp_idx, lane_idx);
}