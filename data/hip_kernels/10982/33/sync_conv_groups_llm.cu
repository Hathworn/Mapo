#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with simplified logic
__global__ void sync_conv_groups() {
    // Synchronize threads within a block
    __syncthreads();
}