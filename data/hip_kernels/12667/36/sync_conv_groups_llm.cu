#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize using __syncthreads() to ensure all threads in the block reach this point
__global__ void sync_conv_groups() { 
    __syncthreads(); // Global synchronization for the group
}