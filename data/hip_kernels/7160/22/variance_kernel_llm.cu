#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Calculate the unique global thread index for filters
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return; // Early exit if thread index is out of filter range

    float scale = 1.f / (batch * spatial - 1);
    float var_sum = 0.0f;
    
    // Unrolling loops for improved performance on GPU
    for (int j = 0; j < batch; ++j) {
        int base_index = j * filters * spatial + i * spatial;
        for (int k = 0; k < spatial; ++k) {
            int index = base_index + k;
            float diff = x[index] - mean[i];
            var_sum += diff * diff;
        }
    }
    
    variance[i] = var_sum * scale; // Apply scaling factor to the variance sum
}