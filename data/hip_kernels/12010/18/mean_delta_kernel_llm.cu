#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Using shared memory for mean_delta to optimize memory access
    extern __shared__ float shared_mean_delta[];
    shared_mean_delta[threadIdx.x] = 0;

    // Unroll loop for faster accumulation
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            shared_mean_delta[threadIdx.x] += delta[index];
        }
    }

    // Multiply outside the loop for reduced operations
    shared_mean_delta[threadIdx.x] *= (-1.f / sqrtf(variance[i] + 0.000001f));

    // Write result back to global memory
    mean_delta[i] = shared_mean_delta[threadIdx.x];
}