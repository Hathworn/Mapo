#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Use __syncthreads() to ensure threads within the same block reach synchronization point
    __syncthreads();
}