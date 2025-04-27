#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var = 0.0f;

    // Loop through batch and spatial dimensions to calculate variance
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Accumulate variance using shared computation of differences
            float diff = x[index] - mean[i];  // Compute once per element
            var += diff * diff;  // More efficient multiplication
        }
    }

    variance[i] = var * scale;  // Efficient final scaling
}