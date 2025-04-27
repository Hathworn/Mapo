#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Precompute inverse power of variance for efficiency
    float inv_var = -.5f * powf(variance[i] + .00001f, -1.5f);
    float sum = 0; // Accumulate contributions in a local variable
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index] * (x[index] - mean[i]); // Use local variable for accumulation
        }
    }
    variance_delta[i] = sum * inv_var; // Use precomputed inverse power
}