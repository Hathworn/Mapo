#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    // Use loop unrolling for improved efficiency
    for (int j = 0; j < batch; ++j) {
        int baseIndex = j * spatial * filters + filter * spatial;
        for (int i = id; i < spatial; i += threads) {
            int index = baseIndex + i;
            local[id] += pow((x[index] - mean[filter]), 2);
        }
    }

    // Use __syncthreads() for synchronization
    __syncthreads();

    // Use parallel reduction for improved performance
    for (int offset = threads / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // Output final result
    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}