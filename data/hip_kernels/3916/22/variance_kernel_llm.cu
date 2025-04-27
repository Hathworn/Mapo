#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.f/(batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify global index calculation
    if (i >= filters) return;
    float sum = 0.0f;  // Use a local variable for accumulation
    for(int j = 0; j < batch; ++j) {
        for(int k = 0; k < spatial; ++k) {
            int index = j*filters*spatial + i*spatial + k;
            float diff = x[index] - mean[i];  // Avoid repeated calculation
            sum += diff * diff;  // Use multiplication instead of powf for performance
        }
    }
    variance[i] = sum * scale;  // Write back the result to the global memory
}