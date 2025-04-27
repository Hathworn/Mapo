#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Optimizing loop by combining calculations within bounds
    for(int j = 0; j < batch; ++j) {
        for(int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Use parallel reduction to compute mean
    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads; i++) {
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);
    }
}