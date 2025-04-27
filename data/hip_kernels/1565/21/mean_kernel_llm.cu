#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    extern __shared__ float shared_mem[]; // Shared memory for reduction
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float mean_val = 0.0f; // Initialize mean value

    // Reduce batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            mean_val += x[index];
        }
    }

    // Store partial result in shared memory
    shared_mem[threadIdx.x] = mean_val;
    __syncthreads();

    // Reduce within the block
    for (unsigned int s = blockDim.x / 2; s > 0; s >>= 1) {
        if (threadIdx.x < s) {
            shared_mem[threadIdx.x] += shared_mem[threadIdx.x + s];
        }
        __syncthreads();
    }
    
    // Store the result for this filter index
    if (threadIdx.x == 0) {
        mean[blockIdx.x] = shared_mem[0] * scale;
    }
}