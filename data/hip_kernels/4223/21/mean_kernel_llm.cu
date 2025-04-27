#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Pre-compute scale and setup thread index
    float scale = 1.f / (batch * spatial);
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    if (i >= filters) return;
    
    // Initialize mean accumulator
    float sum = 0;
    
    // Perform computation, using shared memory could be beneficial if needed for large data
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }
    
    // Finalize mean calculation
    mean[i] = sum * scale;
}