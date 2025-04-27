#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    int i, j;
    // Loop unrolling for spatial dimension
    for (j = 0; j < batch; ++j) {
        for (i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Use parallel reduction to sum local array
    if (id < 32) {
        for (i = 32; i < threads; i += 32) {
            local[id] += local[id + i];
        }
    }

    if (id == 0) {
        mean_delta[filter] = 0;
        for (i = 0; i < 32; ++i) {
            mean_delta[filter] += local[i];
        }
        mean_delta[filter] *= (-1.f / sqrtf(variance[filter] + .00001f));
    }
}