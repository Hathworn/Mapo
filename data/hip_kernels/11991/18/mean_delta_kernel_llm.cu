#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < filters) {
        float sum_delta = 0.0f; // Use a register for sum accumulation
        for (int j = 0; j < batch; ++j) {
            for (int k = 0; k < spatial; ++k) {
                int index = j * filters * spatial + i * spatial + k;
                sum_delta += delta[index];
            }
        }
        mean_delta[i] = sum_delta * (-1.0f / sqrtf(variance[i] + 0.000001f)); // Use sqrtf for performance
    }
}