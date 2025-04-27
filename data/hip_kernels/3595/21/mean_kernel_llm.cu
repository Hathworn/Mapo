#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use shared memory for better memory access efficiency
    __shared__ float shared_mean[256];
    shared_mean[threadIdx.x] = 0;  // Initialize shared memory
    __syncthreads();  // Synchronize to ensure all threads have initialized
    
    int j, k;
    for (j = 0; j < batch; ++j) {
        for (k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            shared_mean[threadIdx.x] += x[index];  // Accumulate values in shared memory
        }
    }
    __syncthreads();  // Synchronize to ensure all accumulations are complete

    if (threadIdx.x == 0) {
        mean[i] = 0;
        for (int t = 0; t < min(blockDim.x, filters - i); ++t) {
            mean[i] += shared_mean[t];  // Reduce in block
        }
        mean[i] *= scale;  // Apply scale factor
    }
}