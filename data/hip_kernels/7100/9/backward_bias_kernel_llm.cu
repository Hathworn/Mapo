#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 256

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Use stride loop to improve memory access
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Reduce within the block using warp-level reduction
    for (int stride = blockDim.x / 2; stride > 0; stride /= 2) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    if (p == 0) {
        bias_updates[filter] += part[0]; // Accumulate results from each block
    }
}