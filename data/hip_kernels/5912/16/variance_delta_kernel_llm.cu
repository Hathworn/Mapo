#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float variance_i = variance[i];
    float mean_i = mean[i];
    float sum = 0.0f;

    // Precompute constant for variance_delta scaling
    float scale = -.5f * powf(variance_i + .00001f, -1.5f);

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index] * (x[index] - mean_i);
        }
    }

    variance_delta[i] = sum * scale;
}