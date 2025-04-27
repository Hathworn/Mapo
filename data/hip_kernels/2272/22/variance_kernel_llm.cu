#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate scale factor outside the loop
    float scale = 1.f/(batch * spatial - 1);

    // Use a single variable to capture the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_sum = 0; // Use a register for summation
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i]; // Compute difference only once
            var_sum += diff * diff; // Use multiplication instead of powf
        }
    }
    variance[i] = var_sum * scale;
}