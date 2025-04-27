#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;
    // Use warp reduction to optimize sum computation within a block
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK) {
            int index = p + i + size * (filter + n * b);
            if (p + i < size) sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use shared memory and partial reduction
    if (p < BLOCK / 2) {
        part[p] += part[p + BLOCK / 2];
    }
    __syncthreads();
    
    if (p == 0) {
        for (int i = 0; i < BLOCK / 2; ++i) scale_updates[filter] += part[i];
    }
}