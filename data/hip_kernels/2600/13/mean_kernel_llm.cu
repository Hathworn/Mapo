#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Compute indices more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float local_mean = 0.0f;
    float scale = 1.0f / (batch * spatial);

    // Combine loops to improve data locality
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            // Calculate index within the flattened array
            int index = j * filters * spatial + i * spatial + k;
            local_mean += x[index];
        }
    }

    // Scale the accumulated sum
    mean[i] = local_mean * scale;
}