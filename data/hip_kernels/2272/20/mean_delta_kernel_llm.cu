#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    extern __shared__ float tmp[];
    tmp[threadIdx.x] = 0;

    // Accumulate delta values into shared memory
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            tmp[threadIdx.x] += delta[index];
        }
    }
    // Apply the scaling factor after accumulation
    mean_delta[i] = tmp[threadIdx.x] * (-1.f / sqrtf(variance[i] + .00001f));
}