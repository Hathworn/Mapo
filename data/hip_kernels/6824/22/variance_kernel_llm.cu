#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale factor once per thread
    float scale = 1.0f / (batch * spatial - 1);

    // Optimize index calculation using only thread and block-specific values
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize variance to zero
    float temp_variance = 0.0f;

    // Unroll loops to process multiple elements per iteration, improving memory access efficiency
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp_variance += powf(x[index] - mean[i], 2);
        }
    }

    // Store the computed variance with scaling
    variance[i] = temp_variance * scale;
}