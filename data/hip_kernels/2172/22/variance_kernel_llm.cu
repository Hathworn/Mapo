#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Define scale outside of block to avoid repetitive calculation.
    float scale = 1.f / (batch * spatial - 1);
    
    // Calculate global index once for efficiency.
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if within bounds to prevent unnecessary execution.
    if (i >= filters) return;
    
    // Initialize variance directly with scale applied to sum.
    float varSum = 0.0f;
    
    // Use shared memory for mean subtraction calculation.
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Avoid redundant powf call by direct multiplication.
            float diff = x[index] - mean[i];
            varSum += diff * diff;
        }
    }
    variance[i] = varSum * scale;
}