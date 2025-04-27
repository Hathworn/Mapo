#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceSmemOptimized(int *g_idata, int *g_odata, unsigned int n)
{
    __shared__ int smem[DIM];

    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    if (idx >= n) return;

    int *idata = g_idata + blockIdx.x * blockDim.x;
    smem[tid] = (tid < n) ? idata[tid] : 0; // Load with boundary check
    __syncthreads();

    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) { // Loop to reduce lines
        if (tid < s) smem[tid] += smem[tid + s];
        __syncthreads();
    }

    if (tid < 32) {
        volatile int *vsmem = smem; // Use volatile to prevent unwanted optimizations
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    if (tid == 0) g_odata[blockIdx.x] = smem[0]; // Store result
}