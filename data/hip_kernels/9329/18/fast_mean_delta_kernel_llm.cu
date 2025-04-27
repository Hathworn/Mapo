#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    // Faster loop using warp divergence elimination
    for (int j = 0; j < batch; ++j) {
        int baseIdx = j * spatial * filters + filter * spatial;
        for (int i = id; i < spatial; i += threads) {
            int index = baseIdx + i;
            local[id] += delta[index];
        }
    }
    __syncthreads();

    // Reduce sum using shared memory with fewer iterations
    if (id < warpSize) {
        for (int i = id + warpSize; i < threads; i += warpSize) {
            local[id] += local[i];
        }
    }
    __syncthreads();

    // Final computation by the first thread
    if (id == 0) {
        mean_delta[filter] = local[0] * (-1.F / sqrtf(variance[filter] + .000001f));
    }
}