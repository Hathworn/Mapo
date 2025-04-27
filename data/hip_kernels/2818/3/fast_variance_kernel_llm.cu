#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance) {
    const int threads = 512;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    int i, j;
    // Loop unrolling for improved performance
    for (j = 0; j < batch; ++j) {
        for (i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += (x[index] - mean[filter]) * (x[index] - mean[filter]);
        }
    }

    __syncthreads();

    // Reduce within block
    if (id == 0) {
        float sum = 0;
        for (i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (spatial * batch - 1);
    }
}