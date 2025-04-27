#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Precompute scaling factor outside of loops
    float scale = 1.f / (batch * spatial - 1);
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0;  // Accumulator variable
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];  // Compute difference once
            sum += diff * diff;  // Accumulate squared difference
        }
    }
    variance[i] = sum * scale;  // Scale the accumulated result
}