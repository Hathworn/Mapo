#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Improved kernel with thread synchronization
    __syncthreads();  // Ensure all threads reach this point before proceeding
}