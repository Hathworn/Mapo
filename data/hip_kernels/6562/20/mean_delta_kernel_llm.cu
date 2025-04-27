#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;
    
    float sum = 0; // Use a local variable for accumulation
    int base_idx = i * spatial; // Compute base indexing outside of inner loop
    
    for (int j = 0; j < batch; ++j) {
        int batch_start = j * filters * spatial; // Precompute start index for batch
        for (int k = 0; k < spatial; ++k) {
            sum += delta[batch_start + base_idx + k];
        }
    }
    
    mean_delta[i] = sum * (-1.f / sqrtf(variance[i] + .00001f)); // Compute result outside of loops
}