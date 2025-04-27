#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    float sum = 0.0f;
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) { // Use thread offset to balance load
            int index = j * spatial * filters + filter * spatial + i;
            sum += delta[index];
        }
    }
    local[id] = sum;

    __syncthreads();

    // Parallel reduction for local sum
    for (int offset = threads / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    if (id == 0) {
        mean_delta[filter] = local[0] * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}