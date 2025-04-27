#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function for synchronization across conv groups
__global__ void sync_conv_groups() {
    // Using __syncthreads to ensure all threads have reached this point
    __syncthreads();
}