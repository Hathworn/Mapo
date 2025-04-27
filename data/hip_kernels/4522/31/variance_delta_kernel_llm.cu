#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize variance_delta array
    float var_delta_sum = 0;
    
    // Reduce repetitive access by pre-calculating multiplier
    float multiplier = -.5f * powf(variance[i] + .00001f, (float)(-3.f/2.f));

    // Iterate over batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Accumulate variance delta
            var_delta_sum += delta[index] * (x[index] - mean[i]);
        }
    }

    // Assign calculated value to variance_delta
    variance_delta[i] = var_delta_sum * multiplier;
}