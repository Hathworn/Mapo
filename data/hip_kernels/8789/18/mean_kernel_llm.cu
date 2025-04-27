#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Define scale outside the loop as it's independent of the calculation.
    float scale = 1.0f / (batch * spatial);

    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < filters) {
        float sum = 0.0f;
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                // Precompute index to avoid repeated multiplication.
                int index = j * filters * spatial + i * spatial + k;
                sum += x[index];
            }
        }
        // Store the result in one step to account for memory access patterns.
        mean[i] = sum * scale;
    }
}