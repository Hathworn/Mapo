#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i >= filters) return;

    float sum = 0.0f; // Local variable for accumulation

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index]; // Accumulate directly into local variable
        }
    }
    
    mean_delta[i] = sum * (-1.0f / sqrtf(variance[i] + 0.000001f)); // Use of sqrtf for float precision
}