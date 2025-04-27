#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale factor once
    float scale = 1.0f / (batch * spatial - 1);
    // Calculate global thread ID
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    
    if (i >= filters) return;
    
    // Initialize intermediate variable for variance
    float var = 0.0f;
    
    // Use shared memory if possible to reduce global memory access
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Accumulate variance on local variable
            float diff = x[index] - mean[i];
            var += diff * diff;
        }
    }
    
    // Write the scaled variance value to the global output array
    variance[i] = var * scale;
}