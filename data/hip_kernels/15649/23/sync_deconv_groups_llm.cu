#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_deconv_groups() {
    // Unified synchronization call for all threads in a block
    __syncthreads();
}