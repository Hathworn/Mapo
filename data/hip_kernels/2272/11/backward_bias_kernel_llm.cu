#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop unrolling and memory coalescing
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Optimized reduction using parallel sum
    if (p < BLOCK / 2) {
        part[p] += part[p + BLOCK / 2];
    }
    __syncthreads();
    if (p < BLOCK / 4) {
        part[p] += part[p + BLOCK / 4];
    }
    __syncthreads();
    if (p < BLOCK / 8) {
        part[p] += part[p + BLOCK / 8];
    }
    __syncthreads();
    if (p < BLOCK / 16) {
        part[p] += part[p + BLOCK / 16];
    }
    __syncthreads();
    if (p < BLOCK / 32) {
        part[p] += part[p + BLOCK / 32];
    }
    __syncthreads();
    if (p == 0) {
        bias_updates[filter] += part[0];
    }
}