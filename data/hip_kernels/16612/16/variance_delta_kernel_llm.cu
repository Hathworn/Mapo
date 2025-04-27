#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate unique index for thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    
    float sum = 0.0f; // Use local variable for reduction
    for(int j = 0; j < batch; ++j) {
        for(int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index] * (x[index] - mean[i]);
        }
    }

    // Avoid recomputation and use local variable
    float inv_var = -.5f * powf(variance[i] + 1e-5f, -1.5f);
    variance_delta[i] = sum * inv_var;
}