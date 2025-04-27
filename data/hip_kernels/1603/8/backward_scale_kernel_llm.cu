#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void backward_scale_kernel(float *x_norm, float *delta, int batch, int n, int size, float *scale_updates)
{
    __shared__ float part[BLOCK];
    int i, b;
    int filter = blockIdx.x;
    int p = threadIdx.x;
    float sum = 0;

    for(b = 0; b < batch; ++b) {
        for(i = p; i < size; i += BLOCK) {
            int index = i + size * (filter + n * b);
            sum += delta[index] * x_norm[index];  // Use p as offset directly in the loop
        }
    }
    part[p] = sum;
    __syncthreads();

    if (p == 0) {
        float block_sum = 0;  // Local reduction within the block
        for(i = 0; i < BLOCK; ++i) block_sum += part[i];
        atomicAdd(&scale_updates[filter], block_sum);  // Atomic addition to ensure correct accumulation in global memory
    }
}