#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate the scale factor
    float scale = 1.f / (batch * spatial);

    // Calculate global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Avoid out-of-bound access
    if (i >= filters) return;

    // Initialize mean value
    float sum = 0;

    // Efficiently accumulate values
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }

    // Store the scaled mean
    mean[i] = sum * scale;
}