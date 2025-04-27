#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Parallel reduction for calculating mean delta
    int i, j;
    for (j = 0; j < batch; ++j) {
        for (i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Reduce the result in shared memory
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Update mean_delta for the current filter
    if (id == 0) {
        mean_delta[filter] = local[0] * (-1. / sqrt(variance[filter] + .000001f));
    }
}