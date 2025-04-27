#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Use shared memory for faster access
    extern __shared__ float shared_mean[];

    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Load mean into shared memory
    if (threadIdx.x < filters) {
        shared_mean[threadIdx.x] = mean[threadIdx.x];
    }
    __syncthreads();  

    float scale = 1.0f / (batch * spatial - 1);
    float var_sum = 0.0f;

    // Reduce repeated reads by storing mean in shared memory
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            var_sum += pow((x[index] - shared_mean[i]), 2);
        }
    }

    variance[i] = var_sum * scale;
}