#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function with improved resource usage and performance
__global__ void lyra2Z_gpu_hash_32_3(uint32_t threads, uint32_t startNounce, uint2 *g_hash, uint32_t *resNonces) {
    // Use shared memory for commonly accessed data
    __shared__ uint2 shared_data;
    
    // Calculate global thread ID
    uint32_t tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Exit if thread ID exceeds the number of threads
    if(tid >= threads) return;

    // Load necessary data into shared memory
    if(threadIdx.x == 0) {
        shared_data = g_hash[tid];
    }
    
    // Synchronize to ensure all threads have loaded shared data
    __syncthreads();
    
    // Perform computations using shared memory
    uint2 result = shared_data;
    // Example operation: increment by startNounce
    result.x += startNounce + tid;
    result.y += startNounce + tid;

    // Write result back to global memory
    g_hash[tid] = result;
    
    // Optionally store resNonces data based on some condition (example)
    if(result.x % 2 == 0) {
        resNonces[tid] = result.x;
    }
}