#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int step = batch * spatial * filters;

    local[id] = 0;

    // Use loop unrolling to increase efficiency
    for (int j = 0; j < batch; ++j) {
        int baseIdx = j * spatial * filters + filter * spatial + id;
        int maxIdx = baseIdx + spatial - id;

        // Loop through spatial dimension with stride BLOCK to leverage shared memory
        for (int i = baseIdx; i < maxIdx; i += threads) {
            local[id] += powf((x[i] - mean[filter]), 2);
        }
    }

    __syncthreads();

    // Use atomic operation to reduce synchronization overhead
    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        atomicAdd(&variance[filter], sum / (spatial * batch - 1));
    }
}