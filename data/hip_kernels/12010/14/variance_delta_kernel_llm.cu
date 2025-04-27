#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_inv3 = -0.5 * powf(variance[i] + 0.000001f, -1.5f);  // Precompute inverse of variance raised to power
    
    float accum = 0.0f;  // Accumulator
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            accum += delta[index] * (x[index] - mean[i]);  // Accumulate delta
        }
    }
    variance_delta[i] = accum * var_inv3;
}