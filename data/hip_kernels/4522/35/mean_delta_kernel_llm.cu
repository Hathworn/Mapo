#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate unique thread index using grid and block dimensions
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    
    // Ensure that we do not exceed the number of filters
    if (i >= filters) return;
    
    float sum = 0.0f; // Store the sum for each filter
    
    // Use a single loop to iterate over batch and spatial dimensions
    for (int j = 0; j < batch * spatial; ++j) {
        int index = (j / spatial) * filters * spatial + i * spatial + (j % spatial);
        sum += delta[index];
    }

    // Compute mean_delta using the precomputed sum
    mean_delta[i] = sum * (-1.f / sqrtf(variance[i] + .00001f));
}