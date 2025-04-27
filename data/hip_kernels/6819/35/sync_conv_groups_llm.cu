#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void sync_conv_groups() {
    __shared__ int dummy; // Use shared memory for better synchronization
    dummy = threadIdx.x;  // Ensure all threads reach this point
    __syncthreads();      // Synchronize all threads in the block
}