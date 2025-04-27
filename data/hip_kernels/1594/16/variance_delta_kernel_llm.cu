#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    
    float var = variance[i] + .00001f;
    float var_factor = -.5f * powf(var, (float)(-3.f/2.f));
    
    float temp_variance_delta = 0;
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            temp_variance_delta += delta[index] * (x[index] - mean[i]);
        }
    }
    
    variance_delta[i] = temp_variance_delta * var_factor;
}