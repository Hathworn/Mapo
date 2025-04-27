#include "hip/hip_runtime.h"
#include "includes.h"

// __syncthreads() is used to synchronize threads within a block
__global__ void sync_conv_groups() {
    // Synchronize all threads in the block
    __syncthreads();
}