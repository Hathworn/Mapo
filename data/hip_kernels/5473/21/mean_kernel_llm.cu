#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify thread index calculation
    if (i >= filters) return;
    
    float sum = 0; // Use a local variable to accumulate the sum
    for (int j = 0; j < batch; ++j) {
        int base_index = j * filters * spatial + i * spatial; // Calculate base index once per batch
        for (int k = 0; k < spatial; ++k) {
            sum += x[base_index + k]; // Index calculation outside innermost loop
        }
    }
    mean[i] = sum * scale;
}