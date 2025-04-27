#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread operates within bounds
    if (i >= filters) return;
    
    float mean_sum = 0; // Use register for summation
    
    // Calculate offset for batches and spatial dimensions
    int filter_offset = i * spatial;
    
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + filter_offset + k;
            mean_sum += delta[index];
        }
    }
    
    // Normalize and negate mean_sum and store result
    mean_delta[i] = mean_sum * (-1.f / sqrtf(variance[i] + .00001f)); 
}