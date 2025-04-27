#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduceCompleteUnrollWarps8Sync(int *g_idata, int *g_odata, unsigned int n)
{
    // Set thread ID
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * 8 + threadIdx.x;

    // Convert global data pointer to the local pointer of this block
    int *idata = g_idata + blockIdx.x * blockDim.x * 8;

    // Unrolling 8
    int sum = 0;
    if (idx + 7 * blockDim.x < n) {
        for (int i = 0; i < 8; i++) {
            sum += g_idata[idx + i * blockDim.x];
        }
        g_idata[idx] = sum;
    }

    __syncthreads();

    // In-place reduction using loop to replace repeated code
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            idata[tid] += idata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = idata[0];
}