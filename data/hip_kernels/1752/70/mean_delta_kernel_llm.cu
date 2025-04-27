#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    extern __shared__ float shared_delta[];
    shared_delta[threadIdx.x] = 0;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Accumulate delta into shared memory
            shared_delta[threadIdx.x] += delta[index];
        }
    }

    // Synchronize to ensure all additions are done
    __syncthreads();

    // Use the accumulated value in shared memory
    if (threadIdx.x == 0) {
        float sum_delta = 0;
        for (int t = 0; t < blockDim.x; ++t) {
            sum_delta += shared_delta[t];
        }
        mean_delta[i] = sum_delta * (-1.f / sqrtf(variance[i] + .00001f));
    }
}