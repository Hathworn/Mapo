#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the index is within the filter range
    if (i >= filters) return;

    // Local accumulator to reduce memory accesses
    float local_mean_delta = 0.0f;
    for (int j = 0; j < batch; ++j) {
        int base_index = j * filters * spatial + i * spatial;
        for (int k = 0; k < spatial; ++k) {
            local_mean_delta += delta[base_index + k];
        }
    }

    // Use a local variable to store the calculation result
    mean_delta[i] = local_mean_delta * (-1.0f / sqrtf(variance[i] + .000001f));
}