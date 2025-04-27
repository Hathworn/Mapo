#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 256

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Update reduction loop with stride and unroll optimization
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Efficient parallel reduction within the block
    for (int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    // Single thread writes the result
    if (p == 0) {
        scale_updates[filter] = part[0];
    }
}