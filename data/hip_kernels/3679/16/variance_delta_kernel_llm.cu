#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_d = 0.0f;
    float mean_val = mean[i];
    float variance_val = variance[i];
    float factor = -.5f * powf(variance_val + .00001f, -1.5f);

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            var_d += delta[index] * (x[index] - mean_val);
        }
    }
    variance_delta[i] = var_d * factor; // Pre-compute reusable values and optimize memory operations
}