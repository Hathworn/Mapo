```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Recursive Implementation of Interleaved Pair Approach
__global__ void reduceInterleaved(int *g_idata, int *g_odata, unsigned int n) {
    // Improved approach: Eliminate bank conflicts
    extern __shared__ int sdata[];

    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Copy input to shared memory and boundary check
    if (idx < n) {
        sdata[tid] = g_idata[idx];
    } else {
        sdata[tid] = 0;
    }
    
    __syncthreads();

    // in-place reduction in shared memory
    for (unsigned int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}