#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use grid-stride loop for better memory access pattern
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j*spatial*filters + filter*spatial + i;
            local[id] += delta[index];
        }
    }

    // Parallel reduction to accumulate results
    __syncthreads();
    for (int offset = threads / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // Normalize by variance and update mean_delta
    if (id == 0) {
        mean_delta[filter] = local[0] * (-1.0f / sqrtf(variance[filter] + 0.000001f));
    }
}