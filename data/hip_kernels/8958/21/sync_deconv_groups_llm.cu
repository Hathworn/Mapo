#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized HIP kernel
__global__ void sync_deconv_groups() {
    // Use syncthreads to ensure all threads are synchronized
    __syncthreads();
}