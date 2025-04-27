#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate the global index for the filter
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_val = variance[i];
    float mean_val = mean[i];
    float var_delta = 0.0f;

    // Combine the batch and spatial loops for increased thread utilization
    for (int j = 0; j < batch * spatial; ++j) {
        int index = j * filters + i;
        var_delta += delta[index] * (x[index] - mean_val);
    }
    
    // Calculate the variance delta for the filter
    variance_delta[i] = var_delta * -.5f * pow(var_val + .000001f, -1.5f);
}