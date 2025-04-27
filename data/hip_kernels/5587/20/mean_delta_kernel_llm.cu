#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return; // Check bounds
    
    float sum_delta = 0.0f; // Local variable for sum
    
    // Loop unrolling for reduced loop overhead
    for (int j = 0; j < batch; ++j) {
        int batch_offset = j * filters * spatial;
        for (int k = 0; k < spatial; ++k) {
            sum_delta += delta[batch_offset + i * spatial + k]; // Accumulate sum
        }
    }

    mean_delta[i] = sum_delta * (-1.0f / sqrtf(variance[i] + 0.00001f)); // Compute mean_delta
}