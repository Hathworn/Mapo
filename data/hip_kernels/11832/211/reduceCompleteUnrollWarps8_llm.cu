#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarps8(int *g_idata, int *g_odata, unsigned int n) {
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;
    
    // Unroll 8 with boundary check optimization
    int sum = 0;
    if (idx < n) sum = g_idata[idx];
    if (idx + blockDim.x < n) sum += g_idata[idx + blockDim.x];
    if (idx + 2 * blockDim.x < n) sum += g_idata[idx + 2 * blockDim.x];
    if (idx + 3 * blockDim.x < n) sum += g_idata[idx + 3 * blockDim.x];
    if (idx + 4 * blockDim.x < n) sum += g_idata[idx + 4 * blockDim.x];
    if (idx + 5 * blockDim.x < n) sum += g_idata[idx + 5 * blockDim.x];
    if (idx + 6 * blockDim.x < n) sum += g_idata[idx + 6 * blockDim.x];
    if (idx + 7 * blockDim.x < n) sum += g_idata[idx + 7 * blockDim.x];
    
    idata[tid] = sum;
    __syncthreads();

    // In-place reduction and complete unroll
    if (blockDim.x >= 1024 && tid < 512) idata[tid] += idata[tid + 512];
    __syncthreads();
    if (blockDim.x >= 512 && tid < 256) idata[tid] += idata[tid + 256];
    __syncthreads();
    if (blockDim.x >= 256 && tid < 128) idata[tid] += idata[tid + 128];
    __syncthreads();
    if (blockDim.x >= 128 && tid < 64) idata[tid] += idata[tid + 64];
    __syncthreads();

    // Unrolling warp with volatile optimization
    if (tid < 32) {
        volatile int *vsmem = idata;
        vsmem[tid] += vsmem[tid + 32];
        vsmem[tid] += vsmem[tid + 16];
        vsmem[tid] += vsmem[tid + 8];
        vsmem[tid] += vsmem[tid + 4];
        vsmem[tid] += vsmem[tid + 2];
        vsmem[tid] += vsmem[tid + 1];
    }

    // write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}