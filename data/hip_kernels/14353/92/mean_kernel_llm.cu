#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate scale multiplier once
    float scale = 1.0f / (batch * spatial);
    
    // Compute global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) {
        return; // Early exit if the index is out of bounds
    }

    mean[i] = 0.0f;

    // Unroll the inner loop to improve memory access patterns
    for (int j = 0; j < batch; ++j) {
        int base_index = j * filters * spatial + i * spatial;
        for (int k = 0; k < spatial; ++k) {
            mean[i] += x[base_index + k];
        }
    }

    mean[i] *= scale; // Apply scaling only once
}