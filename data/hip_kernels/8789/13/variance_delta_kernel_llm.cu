#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Cache variance[i] and mean[i] in registers for better performance
    float mean_i = mean[i];
    float variance_i = variance[i];
    float temp = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            temp += delta[index] * (x[index] - mean_i);
        }
    }

    // Use pre-computed constant and avoid pow() for better performance
    float variance_pow = -.5f * __frcp_rn(sqrtf(variance_i + .000001f) * (variance_i + .000001f));
    variance_delta[i] = temp * variance_pow;
}