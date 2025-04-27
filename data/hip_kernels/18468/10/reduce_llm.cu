#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void reduce(float *gdata, float *out, size_t n) {
    __shared__ float sdata[BLOCK_SIZE];
    int tid = threadIdx.x;
    sdata[tid] = 0.0f;
    size_t idx = threadIdx.x + blockDim.x * blockIdx.x;

    // Use grid stride loop to load data efficiently
    for (; idx < n; idx += gridDim.x * blockDim.x) {
        sdata[tid] += gdata[idx];
    }

    // Unrolling loop to optimize parallel reduction
    for (unsigned int s = blockDim.x / 2; s > 32; s >>= 1) {
        __syncthreads();
        if (tid < s) {
            sdata[tid] += sdata[tid + s];
        }
    }
    // Use warp shuffle for last warp iterations
    if (tid < 32) {
        __syncthreads();
        sdata[tid] += sdata[tid + 32];
        sdata[tid] += sdata[tid + 16];
        sdata[tid] += sdata[tid + 8];
        sdata[tid] += sdata[tid + 4];
        sdata[tid] += sdata[tid + 2];
        sdata[tid] += sdata[tid + 1];
    }
    if (tid == 0) out[blockIdx.x] = sdata[0];
}