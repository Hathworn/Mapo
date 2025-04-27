#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate thread index
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    
    // Return if out of bounds
    if (i >= filters) return;

    // Initialize mean_delta to 0 for each filter
    float sum = 0.0f;
    for (int j = 0; j < batch * spatial; ++j) {
        // Compute linear index and accumulate delta values
        int index = j * filters + i;
        sum += delta[index];
    }

    // Normalize and store result in mean_delta
    mean_delta[i] = sum * (-1.0f / sqrtf(variance[i] + 0.000001f));
}