#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized mean_kernel function
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use shared memory for storing intermediate means
    __shared__ float shared_mean[1024]; // Assuming blockDim.x <= 1024
    shared_mean[threadIdx.x] = 0.0f;

    if (i < filters) {
        int j, k;
        for (j = 0; j < batch; ++j) {
            for (k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + i * spatial + k;
                shared_mean[threadIdx.x] += x[index];
            }
        }
    }
    
    __syncthreads(); // Ensure all threads have updated shared memory

    // Aggregate results from shared memory
    if (i < filters) {
        mean[i] = shared_mean[threadIdx.x] * scale;
    }
}