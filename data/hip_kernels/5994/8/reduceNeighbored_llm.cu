#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceNeighbored(int *g_idata, int *g_odata, unsigned int n) {
    // Shared memory for block-level synchronization
    extern __shared__ int sdata[];

    // Compute thread id
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + tid;
    
    // Load input into shared memory
    if (idx < n) sdata[tid] = g_idata[idx];
    else sdata[tid] = 0;
    __syncthreads();
    
    // In-place reduction in shared memory
    for (int stride = 1; stride < blockDim.x; stride *= 2) {
        int index = 2 * stride * tid;
        if (index < blockDim.x) {
            sdata[index] += sdata[index + stride];
        }
        __syncthreads();
    }
    
    // Write result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}