#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate index within grid
    if (i >= filters) return;
    
    float sum = 0.0f;  // Accumulator for variance_delta[i]
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index] * (x[index] - mean[i]);  // Accumulate results
        }
    }
    
    // Store final result after complete accumulation
    variance_delta[i] = sum * -.5f * rsqrtf(variance[i] + .00001f) * rsqrtf(variance[i] + .00001f);  // Optimized using reciprocal sqrt
}