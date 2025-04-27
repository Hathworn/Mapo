#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;
    float sum = 0;

    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            sum += delta[index] * (x[index] - mean[filter]);  // Precompute index once.
        }
    }

    local[id] = sum;  // Accumulate partial sum results.

    __syncthreads();

    // Reduce sums within a block.
    for (int s = threads / 2; s > 0; s >>= 1) {
        if (id < s) {
            local[id] += local[id + s];
        }
        __syncthreads();
    }

    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}