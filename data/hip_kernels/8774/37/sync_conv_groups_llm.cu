#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() { 
    // Synchronize all threads within a block for proper execution order
    __syncthreads(); 
}