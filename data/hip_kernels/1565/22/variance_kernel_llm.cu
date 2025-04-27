#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified block index calculation
    if (i >= filters) return;
    
    float sum = 0.0f; // Use a local variable to accumulate the variance
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += powf((x[index] - mean[i]), 2); // Accumulate variance in the local variable
        }
    }
    variance[i] = sum * scale; // Assign the scaled result back to global memory
}