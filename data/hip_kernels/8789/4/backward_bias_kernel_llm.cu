#include "hip/hip_runtime.h"
#include "includes.h"

#define BLOCK_SIZE 256

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size) {
    __shared__ float part[BLOCK_SIZE];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Unroll loop and use warp-level reduction for performance optimization
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK_SIZE) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Intra-block reduction
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

    if (p == 0) {
        // Atomic add to ensure correctness without race conditions
        atomicAdd(&bias_updates[filter], part[0]);
    }
}