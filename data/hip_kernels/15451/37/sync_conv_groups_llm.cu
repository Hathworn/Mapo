#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void sync_conv_groups() {
    // Using __syncthreads() to ensure all threads synchronize
    __syncthreads();  
}