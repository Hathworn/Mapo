#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Pre-calculate the scaling factor for efficiency
    float scale = -.5f * powf(variance[i] + .00001f, (float)(-3.f/2.f));
    float sum = 0.0f;

    // Unroll the loop to improve performance
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index] * (x[index] - mean[i]);
        }
    }

    // Store final result
    variance_delta[i] = sum * scale;
}