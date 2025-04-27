```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale outside the loop
    float scale = 1.0f / (batch * spatial - 1);

    // Flatten grid and block indices for 1D indexing
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Early exit for threads out of range 
    if (i >= filters) return;

    // Initialize variance for current filter
    float var = 0.0f;
    
    // Unroll loops to improve performance
    #pragma unroll
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];
            var += diff * diff;
        }
    }

    // Store computed variance
    variance[i] = var * scale;
}