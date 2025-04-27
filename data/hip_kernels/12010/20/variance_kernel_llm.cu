#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_sum = 0.0f; // Declare a local variable for variance accumulation

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = (x[index] - mean[i]);
            var_sum += diff * diff; // Accumulate squared differences
        }
    }
    variance[i] = var_sum * scale; // Apply scaling to the local accumulation
}