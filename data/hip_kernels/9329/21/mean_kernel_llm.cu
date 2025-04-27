#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.F / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use block-level reduction
    __shared__ float shared_mean[1024]; // Adjust size according to max threads per block
    shared_mean[threadIdx.x] = 0.0f;
    
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            shared_mean[threadIdx.x] += x[index]; // Aggregate in shared memory
        }
    }
    
    // Synchronize threads to ensure all additions are complete
    __syncthreads();
    
    // Reduce results within a block
    if (threadIdx.x == 0) {
        float block_total = 0.0f;
        for (int n = 0; n < blockDim.x; ++n) {
            block_total += shared_mean[n];
        }
        atomicAdd(&mean[i / blockDim.x], block_total * scale); // Atomic add to global result
    }
}