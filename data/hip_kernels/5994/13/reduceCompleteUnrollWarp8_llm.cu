#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarp8(int *g_idata, int *g_odata, unsigned int n) {
    // Thread and data index calculation for 8-element unroll
    int idx = threadIdx.x + blockIdx.x * blockDim.x * 8;
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unroll 8 elements per thread
    int sum = 0;
    if (idx + 7 * blockDim.x < n) {
        sum += g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + 2 * blockDim.x];
        sum += g_idata[idx + 3 * blockDim.x];
        sum += g_idata[idx + 4 * blockDim.x];
        sum += g_idata[idx + 5 * blockDim.x];
        sum += g_idata[idx + 6 * blockDim.x];
        sum += g_idata[idx + 7 * blockDim.x];
    }
    idata[threadIdx.x] = sum;

    __syncthreads();

    // Reduction in shared memory using a single loop
    for (unsigned int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (threadIdx.x < stride) {
            idata[threadIdx.x] += idata[threadIdx.x + stride];
        }
        __syncthreads();
    }

    // Unroll last warp
    if (threadIdx.x < 32) {
        volatile int *vmem = idata;
        vmem[threadIdx.x] += vmem[threadIdx.x + 32];
        vmem[threadIdx.x] += vmem[threadIdx.x + 16];
        vmem[threadIdx.x] += vmem[threadIdx.x + 8];
        vmem[threadIdx.x] += vmem[threadIdx.x + 4];
        vmem[threadIdx.x] += vmem[threadIdx.x + 2];
        vmem[threadIdx.x] += vmem[threadIdx.x + 1];
    }

    // Write the result of this block to global memory
    if (threadIdx.x == 0) {
        g_odata[blockIdx.x] = idata[0];
    }
}