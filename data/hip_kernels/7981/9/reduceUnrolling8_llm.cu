#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceUnrolling8(int *g_idata, int *g_odata, unsigned int n) {
    unsigned int tid = threadIdx.x;
    unsigned int idx = (8 * blockIdx.x) * blockDim.x + threadIdx.x;

    int *idata = g_idata + (8 * blockIdx.x) * blockDim.x;

    // Load data and perform unrolling
    int sum = 0;
    if (idx + 7 * blockDim.x < n) {
        sum = g_idata[idx];
        sum += g_idata[idx + blockDim.x];
        sum += g_idata[idx + 2 * blockDim.x];
        sum += g_idata[idx + 3 * blockDim.x];
        sum += g_idata[idx + 4 * blockDim.x];
        sum += g_idata[idx + 5 * blockDim.x];
        sum += g_idata[idx + 6 * blockDim.x];
        sum += g_idata[idx + 7 * blockDim.x];
    }
    idata[tid] = sum;
    __syncthreads();

    // Reduction in shared memory
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