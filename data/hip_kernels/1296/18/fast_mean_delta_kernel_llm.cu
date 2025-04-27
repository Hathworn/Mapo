#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int offset = filter * spatial;
    local[id] = 0;

    #pragma unroll // Unroll the loop for optimization
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + offset + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Use parallel reduction to sum up local array
    for (int stride = threads / 2; stride > 0; stride /= 2) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    if (id == 0) {
        mean_delta[filter] = local[0] * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}