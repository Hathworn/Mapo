#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 512

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll the first loop for better performance
    for(int b = 0; b < batch; ++b) {
        for(int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Parallel reduction to accumulate shared memory results
    if (p < 256) part[p] += part[p + 256];
    __syncthreads();
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

    // Update scale with the reduced sum
    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);  // Atomic addition to prevent race conditions
    }
}