```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    
    float sum = 0.0f;
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) { // Use thread stride loop for better memory access
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;

    __syncthreads();

    // Reduce within block using binary tree reduction
    for (int offset = BLOCK / 2; offset > 0; offset >>= 1) {
        if (p < offset) {
            part[p] += part[p + offset];
        }
        __syncthreads();
    }

    if (p == 0) {
        atomicAdd(&bias_updates[filter], part[0]); // Use atomicAdd for concurrent writes
    }
}