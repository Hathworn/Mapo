#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int i, b;
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Unroll loop for better performance
    for (b = 0; b < batch; ++b) {
        for (i = 0; i < size; i += BLOCK) {
            int index = p + i + size * (filter + n * b);
            if (p + i < size) {
                sum += delta[index] * x_norm[index];
            }
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use reduction to accumulate results
    if (p < 32) {
        part[p] += part[p + 32];
        part[p] += part[p + 16];
        part[p] += part[p + 8];
        part[p] += part[p + 4];
        part[p] += part[p + 2];
        part[p] += part[p + 1];
    }

    __syncthreads();

    // Write the result back to global memory
    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);
    }
}