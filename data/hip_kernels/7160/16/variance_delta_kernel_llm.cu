#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure i is within bounds
    if (i < filters) {
        float var = variance[i] + 0.00001f;
        float factor = -0.5f * powf(var, -1.5f);
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + i * spatial + k;
                variance_delta[i] += delta[index] * (x[index] - mean[i]);
            }
        }
        variance_delta[i] *= factor;
    }
}