#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Precompute scale outside loop
    float scale = 1.F/(batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i >= filters) return;

    float sum = 0.0f; // Use register for sum to reduce global memory access

    // Unroll loops for better efficiency
    for (int j = 0; j < batch; ++j) {
        int index_base = j * filters * spatial + i * spatial;
        for (int k = 0; k < spatial; ++k) {
            sum += x[index_base + k];
        }
    }
    
    mean[i] = sum * scale; // Store the results back to global memory
}