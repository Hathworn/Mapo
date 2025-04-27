#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale factor
    float scale = 1.0f / (batch * spatial - 1);
    int j, k;
    
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check thread bounds
    if (i >= filters) return;
    
    // Initialize variance accumulator
    float var_acc = 0.0f;
    
    // Loop over batches and spatial dimensions
    for (j = 0; j < batch; ++j) {
        for (k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            
            // Accumulate the squared differences
            float diff = x[index] - mean[i];
            var_acc += diff * diff;
        }
    }
    
    // Apply scale factor
    variance[i] = var_acc * scale;
}