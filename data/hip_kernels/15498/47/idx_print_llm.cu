#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void idx_print() {
    // Calculate flattened thread ID
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Calculate warp and lane indices
    int warp_idx = threadIdx.x / warpSize;
    int lane_idx = threadIdx.x & (warpSize - 1);

    // Print information only for lane 0 of each half-warp
    if((lane_idx & (warpSize/2 -1)) == 0) { 
        printf(" %5d\t%5d\t %2d\t%2d\n", idx, blockIdx.x, warp_idx, lane_idx);
    }
}