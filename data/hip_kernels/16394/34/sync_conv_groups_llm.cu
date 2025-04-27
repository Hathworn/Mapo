#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // No operation needed in this function – function is a sync point
    __syncthreads();  // Ensure thread synchronization within a block
}