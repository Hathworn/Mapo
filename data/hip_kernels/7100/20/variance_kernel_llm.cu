#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    extern __shared__ float shared_mean[]; // Use shared memory for mean to reduce global memory access
    float scale = 1.0f / (batch * spatial - 1);
    int j, k;
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    if (i >= filters) return;

    shared_mean[threadIdx.x] = mean[i]; // Load mean into shared memory
    __syncthreads(); // Ensure all threads have loaded mean

    float var_temp = 0.0f; // Local accumulator for variance
    for (j = 0; j < batch; ++j) {
        for (k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            var_temp += (x[index] - shared_mean[threadIdx.x]) * (x[index] - shared_mean[threadIdx.x]); // Avoid pow for efficiency
        }
    }
    variance[i] = var_temp * scale;
}