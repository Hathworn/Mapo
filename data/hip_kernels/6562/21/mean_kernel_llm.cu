#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate scale outside the loop for efficiency
    float scale = 1.f / (batch * spatial);
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float temp_sum = 0.0f;  // Use a temporary variable to accumulate sum

    // Unroll the loop if possible, minor optimization
    int batch_spatial = batch * spatial;
    for (int j = 0; j < batch_spatial; ++j) {
        int index = j * filters + i;
        temp_sum += x[index];
    }
    
    mean[i] = temp_sum * scale;  // Apply scale at the end
}