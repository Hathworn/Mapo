#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Shared memory to reduce global memory bandwidth
    extern __shared__ float shared_delta[];

    // Initialize shared memory for accumulation
    float local_mean_delta = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            local_mean_delta += delta[index];
        }
    }

    // Write the result back to global memory with normalization
    mean_delta[i] = local_mean_delta * (-1.F / sqrtf(variance[i] + 0.000001f));
}