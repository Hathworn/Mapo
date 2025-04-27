#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float mean_sum = 0.0f;  // Use local variable to reduce global memory access
    const int filter_spatial = i * spatial;
    
    for (int j = 0; j < batch; ++j) {
        int base_index = j * filters * spatial + filter_spatial;
        for (int k = 0; k < spatial; ++k) {
            mean_sum += delta[base_index + k];
        }
    }
    
    mean_delta[i] = mean_sum * (-1.F/sqrtf(variance[i] + .000001f));
}