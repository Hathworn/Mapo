#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    __syncthreads(); // Single efficient synchronization point for all threads
}