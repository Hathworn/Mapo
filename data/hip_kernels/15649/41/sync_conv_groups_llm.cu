#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    // Use dynamic thread and block synchronization
    __syncthreads(); // Ensure all threads in a block are synchronized
    __threadfence(); // Ensure memory visibility after synchronization
}