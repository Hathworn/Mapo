#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta) 
{
    // Calculate linear index for filters
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize variance_delta
    float var_delta_sum = 0.0f;
    
    // Pre-compute common values for better performance
    float mean_i = mean[i];
    float variance_val = variance[i] + 0.00001f;
    float factor = -.5f * powf(variance_val, (float)(-3.f/2.f));

    // Loop through batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            var_delta_sum += delta[index] * (x[index] - mean_i);
        }
    }
    
    // Apply factor to the sum
    variance_delta[i] = var_delta_sum * factor;
}