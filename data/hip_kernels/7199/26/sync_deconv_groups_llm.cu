#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_deconv_groups() {
    // Optimize through synchronization for all threads
    // Synchronization within the kernel (Ensure all threads reach this point)
    __syncthreads();
}