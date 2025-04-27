#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Kernel index based on global thread ID
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    // Return if index is out of filter range
    if (i >= filters) return;

    float v_delta = 0.0f;  // Local variable for variance delta
    float local_mean = mean[i];  // Cache mean value
    float local_variance = variance[i];  // Cache variance value

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            v_delta += delta[index] * (x[index] - local_mean);  // Accumulate variance delta
        }
    }

    v_delta *= -.5f * powf(local_variance + .00001f, -1.5f);  
    variance_delta[i] = v_delta;
}