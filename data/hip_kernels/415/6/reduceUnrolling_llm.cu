#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduceUnrolling (double *g_idata, double *g_odata, unsigned int n, unsigned int q)
{
    // set thread ID and global offset
    unsigned int tid = threadIdx.x;
    unsigned int idx = blockIdx.x * blockDim.x * q + threadIdx.x;

    // Perform unrolling for q elements
    double sum = 0.0;
    if (idx + blockDim.x * (q - 1) < n) {
        for (int i = 0; i < q; i++) {
            sum += g_idata[idx + blockDim.x * i];
        }
    }

    // Store the sum back into the input array
    g_idata[idx] = sum;
    __syncthreads();

    // In-place reduction with log step optimization
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (tid < stride) {
            g_idata[idx] += g_idata[idx + stride];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) g_odata[blockIdx.x] = g_idata[idx];
}