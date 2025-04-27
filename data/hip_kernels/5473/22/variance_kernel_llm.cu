#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Scale factor to normalize variance
    float scale = 1.f / (batch * spatial - 1);
    float sum = 0; // Local variable for accumulation

    // Prefetch mean value
    float mean_val = mean[i];

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean_val; // Subtract mean
            sum += diff * diff; // Accumulate squared difference
        }
    }

    variance[i] = sum * scale; // Scale the accumulated sum
}