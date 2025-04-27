#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;

    // Unroll loop to improve performance
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += powf((x[index] - mean[filter]), 2);
        }
    }

    __syncthreads();

    // Reduce the shared memory array to compute variance
    if(id < 32) {
        for (int i = threads / 2; i > 0; i >>= 1) {
            if (id < i) {
                local[id] += local[id + i];
            }
            __syncthreads();
        }
    }

    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}