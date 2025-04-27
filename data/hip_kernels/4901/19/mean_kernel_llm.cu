#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel using shared memory and loop unrolling
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    extern __shared__ float shared_mean[];  // Shared memory for reduction
    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    shared_mean[threadIdx.x] = 0;  // Initialize shared memory
    __syncthreads();

    for (int j = 0; j < batch; j++) {
        for (int k = threadIdx.x; k < spatial; k += blockDim.x) {  // Unroll loop over spatial
            int index = j * filters * spatial + i * spatial + k;
            shared_mean[threadIdx.x] += x[index];
        }
    }
    
    __syncthreads();

    if (threadIdx.x == 0) {  // Use one thread to accumulate results
        float total_mean = 0;
        for (int t = 0; t < blockDim.x; ++t) {
            total_mean += shared_mean[t];
        }
        mean[i] = total_mean * scale;
    }
}