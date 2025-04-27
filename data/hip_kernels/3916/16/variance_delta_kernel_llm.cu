#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    // Calculate the index for the current thread
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Store inverse variance pre-calculation
    float inv_var = -.5f * powf(variance[i] + .00001f, -1.5f);
    
    // Accumulate variance delta
    float acc = 0.0f;
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            acc += delta[index] * (x[index] - mean[i]);
        }
    }
    // Store the result using pre-calculated inverse variance
    variance_delta[i] = acc * inv_var;
}