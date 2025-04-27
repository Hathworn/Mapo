#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale outside the loop
    float scale = 1.f / (batch * spatial - 1);
    int tid = blockIdx.x * blockDim.x + threadIdx.x;
    if (tid >= filters) return;

    float var = 0;  // Use local variable for accumulation
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + tid * spatial + k;
            float diff = x[index] - mean[tid];
            var += diff * diff; // Avoid using powf for better performance
        }
    }
    variance[tid] = var * scale; // Write to global memory outside the loop
}