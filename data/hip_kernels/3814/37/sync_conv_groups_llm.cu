#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Optimize: Use __syncthreads() for explicit synchronization
    __syncthreads();
}