```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;

    // Loop unrolling for better performance
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += powf((x[index] - mean[filter]), 2);
        }
    }
    __syncthreads();

    // Use parallel reduction for summing
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Only thread 0 writes result to global memory
    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}