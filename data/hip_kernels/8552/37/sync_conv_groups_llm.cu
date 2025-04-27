#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() { 
    // Ensure all threads in the block reach this point before proceeding.
    __syncthreads(); 
}