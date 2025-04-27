#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    
    // Cache variance calculation
    float inv_var = -1.0f / sqrtf(variance[i] + 0.000001f);
    
    // Accumulate delta values for each filter
    float sum = 0;
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index];
        }
    }
    
    // Store the mean delta value
    mean_delta[i] = sum * inv_var;
}