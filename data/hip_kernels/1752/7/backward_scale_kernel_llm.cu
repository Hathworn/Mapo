#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int i, b;
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling for performance
    for(b = 0; b < batch; ++b) {
        for(i = 0; i < size; i += BLOCK * 4) {
            int index0 = p + i + size * (filter + n * b);
            int index1 = p + i + BLOCK + size * (filter + n * b);
            int index2 = p + i + 2 * BLOCK + size * (filter + n * b);
            int index3 = p + i + 3 * BLOCK + size * (filter + n * b);

            if (p + i < size) sum += delta[index0] * x_norm[index0];
            if (p + i + BLOCK < size) sum += delta[index1] * x_norm[index1];
            if (p + i + 2 * BLOCK < size) sum += delta[index2] * x_norm[index2];
            if (p + i + 3 * BLOCK < size) sum += delta[index3] * x_norm[index3];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Using parallel reduction for better performance
    if (p < 32) {
        part[p] += part[p + 32];
        part[p] += part[p + 16];
        part[p] += part[p + 8];
        part[p] += part[p + 4];
        part[p] += part[p + 2];
        part[p] += part[p + 1];
    }

    // Single thread update for scale_updates
    if (p == 0) {
        scale_updates[filter] += part[0];
    }
}