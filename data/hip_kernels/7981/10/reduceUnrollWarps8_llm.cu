#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrollWarps8(int *g_idata, int *g_odata, unsigned int n){
    // Calculate thread index and corresponding data index
    unsigned int tid = threadIdx.x;
    unsigned int idx = (8 * blockIdx.x) * blockDim.x + threadIdx.x;
    int *idata = g_idata + (8 * blockIdx.x) * blockDim.x;

    // Unroll the loop to handle 8 contiguous elements
    if (idx + 7 * blockDim.x < n) {
        int sum = g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + 2 * blockDim.x];
        sum += g_idata[idx + 3 * blockDim.x];
        sum += g_idata[idx + 4 * blockDim.x];
        sum += g_idata[idx + 5 * blockDim.x];
        sum += g_idata[idx + 6 * blockDim.x];
        sum += g_idata[idx + 7 * blockDim.x];
        g_idata[idx] = sum;
    }
    __syncthreads();

    // Reduction in shared memory
    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();
    }

    // Last warp unrolled manually
    if (tid < 32) {
        volatile int *vmem = idata;
        vmem[tid] += vmem[tid + 32];
        vmem[tid] += vmem[tid + 16];
        vmem[tid] += vmem[tid + 8];
        vmem[tid] += vmem[tid + 4];
        vmem[tid] += vmem[tid + 2];
        vmem[tid] += vmem[tid + 1];
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}