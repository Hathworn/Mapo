#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Exit early if thread is outside the valid range
    if (i >= filters) return;

    float sum = 0.0f; // Local accumulator for mean calculation
    int base_index = i * spatial; // Precompute base index for efficiency
    for (int j = 0; j < batch; ++j) {
        int batch_base_index = j * filters * spatial + base_index; // Avoid repeated calculation
        for (int k = 0; k < spatial; ++k) {
            sum += x[batch_base_index + k]; // Efficient accumulation
        }
    }
    mean[i] = sum * scale; // Store the result with scaling
}