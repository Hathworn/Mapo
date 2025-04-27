#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.f / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float var_accum = 0; // Use a local accumulator to reduce global memory access
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];
            var_accum += diff * diff; // Use multiplication instead of powf for efficiency
        }
    }
    variance[i] = var_accum * scale;
}