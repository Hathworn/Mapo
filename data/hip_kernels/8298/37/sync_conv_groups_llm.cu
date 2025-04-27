#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Use __threadfence() to ensure memory operations are completed before synchronization
    __threadfence();

    // Use __syncthreads() for synchronization within the block
    __syncthreads();
}