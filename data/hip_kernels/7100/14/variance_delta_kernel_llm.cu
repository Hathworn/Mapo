```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float temp_variance_delta = 0.0f; // Local variable to accumulate result
    float mean_val = mean[i];
    float variance_val = variance[i];
    float factor = -.5f * pow(variance_val + .000001f, -1.5f); // Precompute constant factor

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp_variance_delta += delta[index] * (x[index] - mean_val);
        }
    }

    variance_delta[i] = temp_variance_delta * factor; // Apply factor after accumulation
}