```c++
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling4(int *g_idata, int *g_odata, unsigned int n) {
    // Cache thread and block info
    unsigned int tid = threadIdx.x;
    unsigned int idx = (4 * blockIdx.x) * blockDim.x + tid;
    
    int *idata = g_idata + (4 * blockIdx.x) * blockDim.x;

    // Unrolling reduction within a block, with boundary check
    if (idx + 3 * blockDim.x < n) {
        g_idata[idx] += g_idata[idx + blockDim.x];
        g_idata[idx] += g_idata[idx + 2 * blockDim.x];
        g_idata[idx] += g_idata[idx + 3 * blockDim.x];
    }

    __syncthreads();

    // Complete reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();
    }

    // Write the result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = idata[0];
    }
}