#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float acc = 0.0f;  // Accumulator for variance_delta
    for(int j = 0; j < batch; ++j) {
        for(int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            acc += delta[index] * (x[index] - mean[i]);
        }
    }

    // Use intrinsic rsqrtf for fast inverse square root
    variance_delta[i] = acc * -0.5f * rsqrtf((variance[i] + .000001f) * (variance[i] + .000001f) * (variance[i] + .000001f) );
}