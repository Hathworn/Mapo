#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize mean accumulation for this filter
    float sum = 0.0f;

    // Accumulate over batches and spatial dimensions
    for(int j = 0; j < batch; ++j){
        for(int k = 0; k < spatial; ++k){
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }

    // Multiply accumulated mean with scale factor
    float scale = 1.0f / (batch * spatial);
    mean[i] = sum * scale;
}