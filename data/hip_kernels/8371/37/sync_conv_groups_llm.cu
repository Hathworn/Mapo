#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function for better performance and readability
__global__ void sync_conv_groups() {
    // Sync threads to ensure all warps in the block are ready
    __syncthreads();
}