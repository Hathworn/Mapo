#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale factor outside of the loop
    float scale = 1.f / (batch * spatial - 1);

    // Use 1D grid and calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float variance_sum = 0.f; // Use a register for variance sum

    for(int j = 0; j < batch; ++j) {
        for(int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i]; // Compute difference only once
            variance_sum += diff * diff;
        }
    }
    variance[i] = variance_sum * scale; // Use the local variance_sum
}