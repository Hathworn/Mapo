#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i >= filters) return;
    
    float sum = 0.0f; // Use register for sum to reduce global memory accesses

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index]; // Accumulate sum
        }
    }

    mean[i] = sum * scale; // Update mean with scaled sum
}