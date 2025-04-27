#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_deconv_groups() {
    // Use __syncthreads() for better synchronization across threads in a block
    __syncthreads();
}