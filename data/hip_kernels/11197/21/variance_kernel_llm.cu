```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Return if index is out of bounds
    if (i >= filters) return;

    // Initialize variance to zero
    float var_sum = 0.0;

    // Iterate over batch and spatial dimensions
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            var_sum += powf((x[index] - mean[i]), 2.0f);
        }
    }

    // Compute scaled variance
    variance[i] = var_sum / (batch * spatial - 1);
}