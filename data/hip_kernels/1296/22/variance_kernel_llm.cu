#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Pre-calculate constants outside the loop to reduce repeated computation
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i >= filters) return;
    
    float var = 0.0f; // Use a local variable to avoid redundant global memory access
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            var += powf((x[index] - mean[i]), 2);
        }
    }
    
    variance[i] = var * scale; // Assign the final result to the global memory
}