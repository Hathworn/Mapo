#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Use unrolled loop to improve memory access
    for (int b = 0; b < batch; ++b) {
        for (int i = 0; i < size; i += BLOCK) {
            int index = p + i + size * (filter + n * b);
            if (p + i < size) sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Parallel reduction instead of sequential reduction
    for (int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    if (p == 0) {
        atomicAdd(&scale_updates[filter], part[0]);
    }
}