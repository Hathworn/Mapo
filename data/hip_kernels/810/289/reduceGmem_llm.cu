#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceGmem(int *g_idata, int *g_odata, unsigned int n) {
    // Efficient set of local thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + tid;
    int *idata = g_idata + blockIdx.x * blockDim.x;

    // Boundaries check to avoid excess calculations
    if (idx >= n) return;
    
    // Optimize in-place reduction in global memory using loop for better maintenance
    for (unsigned int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Ensure all memory operations are completed
    }
    
    // Unroll loop for warp size reduction
    if (tid < 32) {
        volatile int *vsmem = idata; // Ensure consistency within warp
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // Write results to global memory if thread 0
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}