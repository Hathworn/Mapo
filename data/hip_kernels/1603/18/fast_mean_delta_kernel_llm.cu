#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    local[id] = 0;
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) { // Distribute work evenly among threads
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index]; // Each thread handles its portion
        }
    }

    __syncthreads();

    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i]; // Accumulate results
        }
        mean_delta[filter] = sum * (-1.f / sqrtf(variance[filter] + 0.00001f)); // Compute mean_delta
    }
}