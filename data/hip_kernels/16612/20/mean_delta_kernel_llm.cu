#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread within filters
    if (i >= filters) return;

    // Initialize mean_delta for filter i
    float temp_mean_delta = 0.0f;

    // Compute mean_delta for filter i
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp_mean_delta += delta[index];
        }
    }

    // Update global memory for mean_delta[i]
    mean_delta[i] = temp_mean_delta * (-1.f / sqrtf(variance[i] + .00001f));
}