#include "hip/hip_runtime.h"
#include "includes.h"

// Sync threads within a thread block
__global__ void sync_conv_groups() {
    __syncthreads(); // Use __syncthreads for intra-block synchronization
}