#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void reduce(float *g_idata, float *g_odata) {
    extern __shared__ float sdata[];

    // Load elements into shared memory
    unsigned int tid = threadIdx.x;
    unsigned int i = blockIdx.x * blockDim.x + tid;
    sdata[tid] = g_idata[i];
    __syncthreads();

    // Perform reduction in shared memory
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (tid < s) {  // Ensure only threads with relevant indices perform work
            sdata[tid] += sdata[tid + s];
        }
        __syncthreads();
    }

    // Write result for this block to global memory
    if (tid == 0) {
        g_odata[blockIdx.x] = sdata[0];
    }
}