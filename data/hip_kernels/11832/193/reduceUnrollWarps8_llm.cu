#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrollWarps8 (int *g_idata, int *g_odata, unsigned int n)
{
    // set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // avoid shared memory bank conflicts using __restrict__ pointer
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // unrolling 8
    int sum = 0; // use a register to store partial sum
    if (idx + 7 * blockDim.x < n) {
        sum += g_idata[idx] + g_idata[idx + blockDim.x] + g_idata[idx + 2 * blockDim.x] + g_idata[idx + 3 * blockDim.x];
        sum += g_idata[idx + 4 * blockDim.x] + g_idata[idx + 5 * blockDim.x] + g_idata[idx + 6 * blockDim.x] + g_idata[idx + 7 * blockDim.x];
    }
    
    __syncthreads();

    // in-place reduction using shared memory
    idata[tid] = sum;
    __syncthreads();

    for (int stride = blockDim.x / 2; stride > 32; stride >>= 1) {
        if (tid < stride) {
            idata[tid] += idata[tid + stride];
        }
        __syncthreads();
    }

    // unrolling warp using volatile keyword for in-place reduction
    if (tid < 32) {
        volatile int *vmem = idata;
        vmem[tid] += vmem[tid + 32];
        vmem[tid] += vmem[tid + 16];
        vmem[tid] += vmem[tid + 8];
        vmem[tid] += vmem[tid + 4];
        vmem[tid] += vmem[tid + 2];
        vmem[tid] += vmem[tid + 1];
    }

    // write result for this block to global mem
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}