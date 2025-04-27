#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale outside of loop as constants.
    float scale = 1.F / (batch * spatial - 1);
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Check bounds.
    if (i >= filters) return;

    float local_variance = 0.0f;

    // Loop over batch and spatial dimensions.
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i]; // Pre-calculate difference.
            local_variance += diff * diff;   // Accumulate squared differences.
        }
    }

    // Apply scale outside the loop.
    variance[i] = local_variance * scale;
}