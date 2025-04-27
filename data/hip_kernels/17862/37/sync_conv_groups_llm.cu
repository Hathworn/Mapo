#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Simplified and optimized for readability
    __syncthreads(); // Ensure block-level synchronization
}