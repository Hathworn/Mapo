#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrollWarps (int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 2 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 2;

    // Unrolling 2
    if (idx + blockDim.x < n) {
        g_idata[idx] += g_idata[idx + blockDim.x];
    }
    __syncthreads();

    // In-place reduction in global memory
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads(); // Synchronize within threadblock
    }

    // Unrolling last warp
    if (tid < 32) {
        volatile int *vsmem = idata;
        #pragma unroll // Unroll warp level computation for optimization
        for (int offset = 32; offset > 0; offset >>= 1) {
            vsmem[tid] += vsmem[tid + offset];
        }
    }

    // Output the result for this block to g_odata
    if (tid == 0) {
        g_odata[blockIdx.x] = idata[0];
    }
}