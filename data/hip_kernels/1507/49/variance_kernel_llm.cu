#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Pre-calculate constants outside the loop
    const float scale = 1.0F / (batch * spatial - 1);
    const int stride = filters * spatial;
    
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_sum = 0.0f;

    for (int j = 0; j < batch; ++j) {
        int base_index = j * stride + i * spatial;
        for (int k = 0; k < spatial; ++k) {
            float diff = x[base_index + k] - mean[i]; // Reuse subtracted value
            var_sum += diff * diff; // Avoid powf for squaring
        }
    }
    
    variance[i] = var_sum * scale;
}