#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate unique thread index
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;

    // Exit if thread is out of bounds
    if (i >= filters) return;

    // Declare accumulator
    float acc = 0.0f;

    // Precompute multiplier for efficiency
    float variance_term = -.5f * powf(variance[i] + .00001f, (float)(-3.f/2.f));

    // Loop over batch and spatial dimensions with precomputed stride
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            // Compute linear index
            int index = j*filters*spatial + i*spatial + k;
            
            // Accumulate result
            acc += delta[index] * (x[index] - mean[i]);
        }
    }

    // Apply precomputed term and store result efficiently
    variance_delta[i] = acc * variance_term;
}