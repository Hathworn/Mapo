#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceGmemUnroll(int *g_idata, int *g_odata, unsigned int n)
{
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 4 + threadIdx.x;
    int *idata = g_idata + blockIdx.x * blockDim.x * 4;

    // Unroll 4 - efficient memory access
    int sum = 0;
    if (idx < n) sum += g_idata[idx];
    if (idx + blockDim.x < n) sum += g_idata[idx + blockDim.x];
    if (idx + 2 * blockDim.x < n) sum += g_idata[idx + 2 * blockDim.x];
    if (idx + 3 * blockDim.x < n) sum += g_idata[idx + 3 * blockDim.x];
    idata[tid] = sum;

    __syncthreads();

    // In-place reduction using loop - remove redundancy
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        if (tid < s) {
            idata[tid] += idata[tid + s];
        }
        __syncthreads();
    }

    // Warp unrolling - reduce sync overhead
    if (tid < 32) {
        volatile int *vsmem = idata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}