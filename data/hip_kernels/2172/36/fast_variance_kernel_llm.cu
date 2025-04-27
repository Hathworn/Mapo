#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void  fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use strides to avoid redundant calculations
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += powf((x[index] - mean[filter]), 2);
        }
    }

    __syncthreads();

    // Use reduction to sum the local array more efficiently
    if (id < 32) {
        for (int offset = threads / 2; offset > 0; offset /= 2) {
            if (id < offset) {
                local[id] += local[id + offset];
            }
            __syncthreads();
        }
    }

    if(id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}