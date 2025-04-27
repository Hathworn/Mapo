#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Use a more efficient synchronization method:
    __syncthreads();  // Synchronize threads within each block efficiently
}