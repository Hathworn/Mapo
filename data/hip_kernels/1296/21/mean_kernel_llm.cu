#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Use only blockIdx.x for 1D grid
    if (i >= filters) return;

    float sum = 0.0f; // Use a local variable for sum
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index]; // Accumulate sum
        }
    }
    mean[i] = sum * scale; // Multiply by scale after loop
}