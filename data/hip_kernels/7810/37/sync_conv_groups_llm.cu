#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function with an empty __syncthreads()
__global__ void sync_conv_groups() {
    __syncthreads();  // Synchronize all threads in the block
}