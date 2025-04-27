#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.F/(batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    float var = 0.0f; // Local variable for variance to optimize memory access
    
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j*filters*spatial + i*spatial + k;
            float diff = x[index] - mean[i]; // Compute difference once
            var += diff * diff; // Accumulate variance
        }
    }
    variance[i] = var * scale; // Store the result
}