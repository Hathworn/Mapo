#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Utilize the built-in __syncthreads() function to synchronize threads within the block
    __syncthreads();
}