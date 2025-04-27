#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Optimize by ensuring fast kernel launch without any computations.
    __syncthreads(); // Synchronize threads in the block.
}