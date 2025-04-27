#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Unroll the inner loop to enhance performance
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Use a reduction pattern to sum partial results more efficiently
    if (p == 0) {
        float blockSum = 0;
        for (int i = 0; i < BLOCK; ++i) {
            blockSum += part[i];
        }
        atomicAdd(&bias_updates[filter], blockSum); // Use atomic operation to prevent race conditions
    }
}