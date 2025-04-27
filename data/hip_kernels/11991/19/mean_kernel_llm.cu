#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (i >= filters) return;

    extern __shared__ float shared_mean[];  // Shared memory to accumulate mean
    shared_mean[threadIdx.x] = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            shared_mean[threadIdx.x] += x[index];
        }
    }

    // Reduce in shared memory
    __syncthreads();

    if (threadIdx.x == 0) {
        float block_sum = 0.0f;
        for (int s = 0; s < blockDim.x; ++s) {
            block_sum += shared_mean[s];
        }
        atomicAdd(&mean[i], block_sum * scale);  // Use atomicAdd to accumulate results
    }
}