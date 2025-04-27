#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function for synchronizing convolution groups
__global__ void sync_conv_groups() { 
    // Calculate unique thread ID
    int tid = threadIdx.x + blockIdx.x * blockDim.x;

    // Ensure threads run only if relevant
    if (tid < NUM_THREADS) {
        // Efficient synchronization between groups
        __syncthreads();
    }
}