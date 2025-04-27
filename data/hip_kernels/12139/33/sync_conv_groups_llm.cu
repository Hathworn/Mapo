#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void sync_conv_groups() {
    __syncthreads(); // Ensuring threads within the same block synchronize
}