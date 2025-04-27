#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int filter = blockIdx.x;
    int p = threadIdx.x;
    
    float sum = 0;
    for (int b = 0; b < batch; ++b) {
        for (int i = p; i < size; i += BLOCK) {  // Optimize loop increment to use thread index
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];
        }
    }

    part[p] = sum;
    __syncthreads();

    // Use reduction to compute the sum across the shared memory
    if (p == 0) {
        float block_sum = 0;
        for (int i = 0; i < BLOCK; ++i) {
            block_sum += part[i];
        }
        atomicAdd(&scale_updates[filter], block_sum);  // Use atomicAdd for concurrency
    }
}