#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Load mean and variance values once, to reduce global memory accesses
    float mean_i = mean[i];
    float variance_i = variance[i];
    
    float var_delta = 0;
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            var_delta += delta[index] * (x[index] - mean_i);
        }
    }
    variance_delta[i] = var_delta * -.5f * powf(variance_i + .000001f, -1.5f);
}