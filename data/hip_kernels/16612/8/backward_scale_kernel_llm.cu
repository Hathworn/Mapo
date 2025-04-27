#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Prefetch indices to optimize global memory access
    int size_filter_n = size * n;
    int offset = size_filter_n * batch;
    for(int b = 0; b < batch; ++b) {
        for(int i = p; i < size; i += BLOCK) {
            // Load data if within bounds
            int index = i + size * (filter + n * b);
            if (index < offset) {
                sum += delta[index] * x_norm[index];
            }
        }
    }
    part[p] = sum;
    __syncthreads();

    // Reduction within the block
    if (p == 0) {
        float block_sum = 0.0f;
        for(int i = 0; i < BLOCK; ++i) {
            block_sum += part[i];
        }
        atomicAdd(&scale_updates[filter], block_sum); // Use atomic add to avoid collision
    }
}