#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation for 1D grid
    if (i >= filters) return;

    float temp_variance_delta = 0.0f; // Local temporary variable to reduce global memory accesses
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp_variance_delta += delta[index] * (x[index] - mean[i]);
        }
    }
    
    // Avoid repeated pow calculation
    float inv_variance_pow = -.5f * rsqrtf(variance[i] + .000001f);
    variance_delta[i] = temp_variance_delta * inv_variance_pow;
}