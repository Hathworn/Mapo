#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Precompute reciprocal scale to avoid division in the loop
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_accumulator = 0.0f; // Use a register for accumulation

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];
            var_accumulator += diff * diff; // Avoid powf for better performance
        }
    }
    variance[i] = var_accumulator * scale; // Multiply scale at the end
}