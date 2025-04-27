#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int i, b;
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Reduce work by accumulating across batches
    for (b = 0; b < batch; ++b) {
        for (i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Reduce sum within the block
    for (i = BLOCK / 2; i > 0; i >>= 1) {
        if (p < i) {
            part[p] += part[p + i];
        }
        __syncthreads();
    }

    // Update bias only by thread 0 of each block
    if (p == 0) {
        atomicAdd(&bias_updates[filter], part[0]);
    }
}