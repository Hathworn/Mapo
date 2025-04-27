#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Optimize calculation using shared memory
    extern __shared__ float shared_data[];

    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }

    shared_data[threadIdx.x] = sum;
    __syncthreads();

    // Use reduction to ensure all results are summed correctly
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shared_data[threadIdx.x] += shared_data[threadIdx.x + s];
        }
        __syncthreads();
    }

    // Save the final result to global memory
    if (threadIdx.x == 0) {
        mean[blockIdx.x] = shared_data[0] * scale;
    }
}