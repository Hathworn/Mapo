#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Use loop unrolling for better performance
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK) {
            int index = p + i + size * (filter + n * b);
            sum += (p + i < size) ? delta[index] : 0;
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use reduction for optimal summation
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
    if (p == 0) {
        bias_updates[filter] += part[0] + part[1];
    }
}