#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize variance kernel
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Precompute constants outside loop for efficiency
    float scale = 1.f/(batch * spatial - 1);
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;

    // Avoid redundant computations by ensuring i is within bounds
    if (i >= filters) return;

    // Start with zero variance
    float var = 0.0f;

    // Compute variance using pre-computed mean
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j*filters*spatial + i*spatial + k;
            float diff = x[index] - mean[i];
            var += diff * diff;  // Use inline computation instead of powf
        }
    }
    
    // Save the computed value after scaling
    variance[i] = var * scale;
}