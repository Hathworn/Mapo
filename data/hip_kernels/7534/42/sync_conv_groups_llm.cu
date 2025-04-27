#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function to handle synchronization
__global__ void sync_conv_groups() {
    __syncthreads(); // Ensure that threads within a block are synchronized
}