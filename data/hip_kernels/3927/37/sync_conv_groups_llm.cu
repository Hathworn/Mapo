#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize with threadfence and syncthreads if necessary
__global__ void sync_conv_groups() {
    __threadfence(); // Ensure all writes are visible
    __syncthreads(); // Synchronize all threads in the block
}