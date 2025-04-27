#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i >= filters) return;

    float sum = 0.0f; // Use a local variable for accumulation
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index];
        }
    }
    mean_delta[i] = sum * (-1.0f / sqrtf(variance[i] + 1e-6f)); // Use sqrtf for float and simplify constant
}