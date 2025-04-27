#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel does not require unnecessary computation, keeping as a sync point
__global__ void sync_conv_groups() { 
    // Use __syncthreads() to ensure all threads in the block reach this point before proceeding
    __syncthreads();
}