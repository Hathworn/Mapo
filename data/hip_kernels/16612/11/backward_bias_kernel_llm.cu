#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_bias_kernel(float *bias_updates, float *delta, int batch, int n, int size)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    // Optimize with stride in inner loop for better memory coalescing
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index];
        }
    }
    part[p] = sum;
    __syncthreads();

    // Reduce sum using shared memory, parallelized reduction
    if (p == 0) {
        float block_sum = 0;
        for (int i = 0; i < BLOCK; ++i) {
            block_sum += part[i];
        }
        atomicAdd(&bias_updates[filter], block_sum); // Use atomic add for thread-safe update
    }
}