#include "hip/hip_runtime.h"
#include "includes.h"

// Synchronize all threads in the grid using a dummy kernel
__global__ void sync_conv_groups() {
    // Improved use of built-in sync function
    __syncthreads(); // Synchronize threads within a block
}