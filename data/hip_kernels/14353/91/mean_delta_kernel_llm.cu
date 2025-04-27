#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use local accumulator to minimize global memory access
    float local_sum = 0;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            local_sum += delta[index];
        }
    }

    // Store the result of local sum after scaling
    mean_delta[i] = local_sum * (-1.f / sqrtf(variance[i] + 0.00001f));
}