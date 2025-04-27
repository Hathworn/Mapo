#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Use grid-stride loop for better device utilization
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Reduce within block using a single thread
    if (p == 0) {
        sum = 0;
        for (int i = 0; i < BLOCK; ++i) {
            sum += part[i];
        }
        atomicAdd(&bias_updates[filter], sum); // Use atomicAdd for thread safety
    }
}