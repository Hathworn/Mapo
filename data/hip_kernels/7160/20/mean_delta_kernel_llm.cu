#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index for filter
    if (i >= filters) return;

    float sum = 0.0f; // Use a local variable for accumulation
    int stride = i * spatial; // Precompute stride for current filter

    for (int j = 0; j < batch; ++j) {
        int batchOffset = j * filters * spatial; // Precompute batch offset
        for (int k = 0; k < spatial; ++k) {
            int index = batchOffset + stride + k;
            sum += delta[index]; // Accumulate deltas
        }
    }

    mean_delta[i] = sum * (-1.f / sqrtf(variance[i] + .00001f)); // Final computation
}