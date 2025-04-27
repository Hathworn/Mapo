#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index computation
    if (i >= filters) return;

    float sum = 0.0f; // Use local variable for accumulation, reduce global memory access
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }
    mean[i] = sum * scale; // Use accumulated value to calculate mean
}