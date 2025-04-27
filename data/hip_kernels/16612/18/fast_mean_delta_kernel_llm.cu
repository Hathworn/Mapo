#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;

    // Precompute shared memory contribution
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Use parallel reduction to sum up local[id] within a block
    for (int stride = threads / 2; stride > 0; stride /= 2) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Write final result to mean_delta
    if (id == 0) {
        mean_delta[filter] = -local[0] / sqrtf(variance[filter] + 0.00001f);
    }
}