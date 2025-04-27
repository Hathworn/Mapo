#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void sync_conv_groups() {
    // Use __syncthreads to synchronize threads in the block
    __syncthreads();
}