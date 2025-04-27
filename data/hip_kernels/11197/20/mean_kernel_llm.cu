#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized mean_kernel function
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean) {
    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0.0f; // Use a local variable for accumulation
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index]; // Use the local variable for accumulation
        }
    }
    mean[i] = sum * scale;
}