#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK 256

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates) 
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Unroll loop and combine index calculation to optimize memory access
    for (int b = 0; b < batch; b++) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;

    __syncthreads();

    // Use reduction to accumulate results for better performance
    if (p < 128) part[p] += part[p + 128];
    __syncthreads();
    if (p < 64) part[p] += part[p + 64];
    __syncthreads();
    if (p < 32) part[p] += part[p + 32];
    __syncthreads();
    if (p < 16) part[p] += part[p + 16];
    __syncthreads();
    if (p < 8) part[p] += part[p + 8];
    __syncthreads();
    if (p < 4) part[p] += part[p + 4];
    __syncthreads();
    if (p < 2) part[p] += part[p + 2];
    __syncthreads();
    if (p < 1) part[p] += part[p + 1];
    __syncthreads();

    // Write the accumulated result to the global memory
    if (p == 0) {
        scale_updates[filter] += part[0];
    }
}