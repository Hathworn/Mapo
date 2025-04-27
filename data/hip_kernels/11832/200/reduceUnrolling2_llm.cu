#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling2 (int *g_idata, int *g_odata, unsigned int n) {
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;
    
    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // Unrolling 2 with boundary check
    if (idx + blockDim.x < n) {
        g_idata[idx] += g_idata[idx + blockDim.x];
    }
    
    __syncthreads();

    // In-place reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Synchronize within threadblock after each reduction step
    }

    // Write result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = idata[0];
    }
}