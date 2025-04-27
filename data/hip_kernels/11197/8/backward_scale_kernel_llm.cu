#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Optimize loop by unrolling
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use reduction pattern for sum
    if (p < 32) {
        part[p] += part[p + 32];
        part[p] += part[p + 16];
        part[p] += part[p + 8];
        part[p] += part[p + 4];
        part[p] += part[p + 2];
        part[p] += part[p + 1];
    }
    
    if (p == 0) {
        scale_updates[filter] += part[0];
    }
}