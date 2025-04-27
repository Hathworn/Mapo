#include "hip/hip_runtime.h"
#include "includes.h"
__global__ static void reduce(int *g_idata, int l1, int l2) {
    extern __shared__ int sdata[];
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + tid;

    // Load data into shared memory
    sdata[tid] = (i < l1) ? g_idata[i] : 0;
    __syncthreads();

    // Parallel Reduction (l2 must be power of 2)
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global mem
    if (tid == 0) {
        g_idata[blockIdx.x] = sdata[0];
    }
}