#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceInterleaved(int *g_idata, int *g_odata, unsigned int n) {
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    int *idata = g_idata + blockIdx.x * blockDim.x;

    if (idx >= n) return;

    // Use shared memory for faster access within a block
    extern __shared__ int sdata[];
    sdata[tid] = idata[tid];
    __syncthreads();

    for (int stride = blockDim.x / 2; stride > 0; stride >>= 1) {
        if (tid < stride) {
            // Perform warp shuffle reduction
            sdata[tid] += sdata[tid + stride];
        }
        __syncthreads();
    }

    if (tid == 0) g_odata[blockIdx.x] = sdata[0];
}