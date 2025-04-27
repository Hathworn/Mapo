#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize local shared memory
    local[id] = 0;

    int i, j;
    for (j = 0; j < batch; ++j) {
        for (i = id; i < spatial; i += threads) { // Use stride loop pattern for efficiency
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += (i < spatial) ? x[index] : 0;
        }
    }

    __syncthreads();

    // Reduce shared memory values to compute the mean
    if (id == 0) {
        mean[filter] = 0;
        for (i = 0; i < threads; ++i) {
            mean[filter] += local[i];
        }
        mean[filter] /= (spatial * batch);
    }
}