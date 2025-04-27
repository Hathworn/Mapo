```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bcnn_grad_scales_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates) {
    __shared__ float part[BCNN_CUDA_THREADS];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Unrolling the inner loop to maximize throughput and minimize overhead
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BCNN_CUDA_THREADS) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Using parallel reduction for optimized sum accumulation
    if (p < 128) part[p] += part[p + 128];
    __syncthreads();
    if (p < 64) part[p] += part[p + 64];
    __syncthreads();
    if (p < 32) {
        part[p] += part[p + 32];
        part[p] += part[p + 16];
        part[p] += part[p + 8];
        part[p] += part[p + 4];
        part[p] += part[p + 2];
        part[p] += part[p + 1];
    }

    // The first thread in each block sums the result
    if (p == 0) {
        scale_updates[filter] += part[0];
    }
}