#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate the index based on thread position
    int i = (blockIdx.x + blockIdx.y*gridDim.x) * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0.0f;
    int stride = filters * spatial;

    // Use stride access pattern to optimize global memory reads
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * stride + i * spatial + k;
            sum += delta[index];
        }
    }

    // Prevent redundant calculation in the loop
    mean_delta[i] = sum * (-1.f/sqrtf(variance[i] + .00001f));
}