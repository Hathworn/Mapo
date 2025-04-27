#include "hip/hip_runtime.h"
#include "includes.h"
#define BLOCK 1024

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Loop over batch and size in parallel
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Using a single thread to accumulate results
    if (p == 0) {
        float total_sum = 0;
        for (int i = 0; i < BLOCK; ++i) {
            total_sum += part[i];
        }
        bias_updates[filter] += total_sum;
    }
}