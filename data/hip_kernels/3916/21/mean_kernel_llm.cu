#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const float scale = 1.f / (batch * spatial);
    const int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within the range
    if (i < filters) {
        float sum = 0.0f;
        
        // Use a single loop to replace nested loops for better coalescing
        for (int j = 0; j < batch * spatial; ++j) {
            sum += x[j * filters + i];
        }
        
        mean[i] = sum * scale;
    }
}