#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel with optimized memory access
__global__ void kernel_End(int *g_stochastic, int *g_count_blocks, int *g_counter) {
    int thid = blockIdx.x * blockDim.x + threadIdx.x;
    int totalThreads = blockDim.x * gridDim.x;

    for (int idx = thid; idx < *g_counter; idx += totalThreads) { // Stride loop for coalesced memory access
        if (g_stochastic[idx] == 1) {
            atomicAdd(g_count_blocks, 1); // Perform atomic addition
        }
    }
}