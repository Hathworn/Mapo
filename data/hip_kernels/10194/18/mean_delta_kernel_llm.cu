#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use shared memory for mean_delta to avoid repeated global memory access
    __shared__ float shared_mean_delta;
    if (threadIdx.x == 0) {
        shared_mean_delta = 0.0f;
    }
    __syncthreads();

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            atomicAdd(&shared_mean_delta, delta[index]);
        }
    }

    if (threadIdx.x == 0) {
        shared_mean_delta *= (-1.0f / sqrt(variance[i] + .000001f));
        mean_delta[i] = shared_mean_delta;
    }
}