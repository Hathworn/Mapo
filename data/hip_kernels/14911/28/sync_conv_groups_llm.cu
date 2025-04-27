#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize __syncthreads() for actual sync at block level
__global__ void sync_conv_groups() {
    __syncthreads();  // Synchronize threads within each block
}