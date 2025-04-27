#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0.0f;

    // Loop unrolling to enhance performance
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use parallel reduction to accumulate results
    for (int stride = BLOCK / 2; stride > 0; stride >>= 1) {
        if (p < stride) {
            part[p] += part[p + stride];
        }
        __syncthreads();
    }

    // Write back the final result to global memory
    if (p == 0) {
        bias_updates[filter] += part[0];
    }
}