#include "hip/hip_runtime.h"
#include "includes.h"

// Use __syncthreads() to synchronize threads within a block
__global__ void sync_conv_groups() {
    // Simple synchronization point for all threads
    __syncthreads();
}