#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Optimize using thread synchronization
    for (int i = 0; i < gridDim.x; ++i) {
        __syncthreads();  // Ensure all threads synchronize at this point
    }
}