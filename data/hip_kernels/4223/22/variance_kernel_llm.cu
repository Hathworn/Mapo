#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.f / (batch * spatial - 1);
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize variance
    float var = 0.0f;
    
    // Loop over batch and spatial dimensions, computing variance
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];
            var += diff * diff; // Avoid using powf for better performance
        }
    }
    
    // Store the computed variance with scaling
    variance[i] = var * scale;
}