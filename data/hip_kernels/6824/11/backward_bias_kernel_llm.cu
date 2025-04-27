#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Optimize the loop by collapsing into one loop to reduce branch divergence
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use reduction pattern to accumulate shared memory
    if (BLOCK >= 1024) { if (p < 512) { part[p] += part[p + 512]; } __syncthreads(); }
    if (BLOCK >= 512) { if (p < 256) { part[p] += part[p + 256]; } __syncthreads(); }
    if (BLOCK >= 256) { if (p < 128) { part[p] += part[p + 128]; } __syncthreads(); }
    if (BLOCK >= 128) { if (p < 64) { part[p] += part[p + 64]; } __syncthreads(); }
    
    // Unrolled final warp to avoid __syncthreads(); note warp size is 32
    if (p < 32) {
        if (BLOCK >= 64) part[p] += part[p + 32];
        if (BLOCK >= 32) part[p] += part[p + 16];
        if (BLOCK >= 16) part[p] += part[p + 8];
        if (BLOCK >= 8) part[p] += part[p + 4];
        if (BLOCK >= 4) part[p] += part[p + 2];
        if (BLOCK >= 2) part[p] += part[p + 1];
    }

    if (p == 0) {
        bias_updates[filter] += part[0];
    }
}