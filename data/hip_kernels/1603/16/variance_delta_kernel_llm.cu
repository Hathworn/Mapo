#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Prepare for reduction variable
    float sum = 0.0f;
    
    // Use registers for repetitive calculations and loop unrolling for optimization
    int spatial_stride = i * spatial;
    float variance_offset = variance[i] + .00001f;
    float inverse_variance = (__powf(variance_offset, -1.5f)) * -.5f;

    for (int j = 0; j < batch; ++j)
    {
        int batch_stride = j * filters * spatial;
        for (int k = 0; k < spatial; ++k)
        {
            int index = batch_stride + spatial_stride + k;
            sum += delta[index] * (x[index] - mean[i]);
        }
    }
    
    // Apply computed variance_multiplier
    variance_delta[i] = sum * inverse_variance;
}