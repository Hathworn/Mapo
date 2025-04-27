#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;

    int filter = blockIdx.x;

    // Loop unrolling and accessing global memory efficiently
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Use parallel reduction instead of sequential accumulation
    for (int offset = threads / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // Only one thread writes the result
    if (id == 0) {
        mean[filter] = local[0] / (spatial * batch);
    }
}