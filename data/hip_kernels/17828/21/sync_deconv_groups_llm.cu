#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void sync_deconv_groups() {
    // Use __syncthreads() to ensure synchronization within the block
    __syncthreads();
}