#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_deconv_groups() {
    // Optimized with a sync thread function for enhanced performance
    __syncthreads(); // Ensure all threads reach this point before proceeding.
}