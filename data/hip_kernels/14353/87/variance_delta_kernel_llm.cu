#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    
    // Calculate variance scaling factor once, outside the loop
    float var_scale = -.5 * pow(variance[i] + .00001f, (float)(-3./2.));
    
    float sum = 0; // Use a local variable for accumulation
    for(int j = 0; j < batch; ++j){
#pragma unroll  // Potentially improve loop performance
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index] * (x[index] - mean[i]);
        }
    }
    variance_delta[i] = sum * var_scale; // Apply computed scaling
}