#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void cpy(float *a, float *b, int n) {
    // Use shared memory for coalesced access
    extern __shared__ float shared_b[];
    
    unsigned int i = blockIdx.x * blockDim.x + threadIdx.x;
    unsigned int tid = threadIdx.x;
    
    if (i < n) {
        // Load data into shared memory
        shared_b[tid] = b[i];
        __syncthreads(); // Synchronize to make sure all shared memory loads are complete

        // Copy from shared memory to global memory
        a[i] = shared_b[tid];
    }
}