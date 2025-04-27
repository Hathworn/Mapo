#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Efficiently synchronize all threads within the block
    __syncthreads();
}