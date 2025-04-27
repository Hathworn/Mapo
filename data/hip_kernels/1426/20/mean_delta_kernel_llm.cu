#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return; // Ensure thread index is within bounds

    float mean = 0.0f; // Local variable to accumulate mean
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Accumulate delta values
            mean += delta[index];
        }
    }
    // Compute and store final mean_delta result
    mean_delta[i] = mean * (-1.f / sqrtf(variance[i] + .00001f));
}