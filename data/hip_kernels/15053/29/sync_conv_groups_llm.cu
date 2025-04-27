#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Ensure all threads reach this point by using __syncthreads
    __syncthreads();
}