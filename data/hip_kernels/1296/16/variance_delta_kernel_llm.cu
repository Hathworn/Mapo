#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize variance_delta at the start
    float temp_variance_delta = 0.0f;

    // Calculate variance_delta
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp_variance_delta += delta[index] * (x[index] - mean[i]);
        }
    }

    // Update variance_delta with computed value and scaling factor
    variance_delta[i] = temp_variance_delta * -.5f * powf(variance[i] + .00001f, -1.5f);
}