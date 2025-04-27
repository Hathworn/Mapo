#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale factor outside the loop for efficiency
    float scale = 1.F/(batch * spatial - 1);
    // Determine global thread index
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    if (i >= filters) return;

    // Initialize shared variable for variance computation
    float var = 0.0f;

    // Loop through batch and spatial dimensions
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];
            var += diff * diff; // Avoid using powf for a slight performance gain
        }
    }
    
    // Scale the accumulated variance and store it
    variance[i] = var * scale;
}