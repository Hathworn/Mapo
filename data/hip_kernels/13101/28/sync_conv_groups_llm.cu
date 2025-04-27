#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Optimized kernel to use a barrier for synchronization
    __syncthreads();  // Ensure threads within the block synchronize
}