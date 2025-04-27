#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Unrolling spatial loop by a factor of 4 to enhance performance
    int i, j;
    for (j = 0; j < batch; ++j) {
        for (i = 0; i < spatial; i += threads * 4) {
            int base_index = j * spatial * filters + filter * spatial + i + id;
            float sum = 0;
            if (i + id < spatial) sum += x[base_index];
            if (i + threads + id < spatial) sum += x[base_index + threads];
            if (i + 2 * threads + id < spatial) sum += x[base_index + 2 * threads];
            if (i + 3 * threads + id < spatial) sum += x[base_index + 3 * threads];
            local[id] += sum;
        }
    }

    __syncthreads(); // Ensure all threads have computed their local sums

    // Reduce within block to compute the mean
    if (id == 0) {
        float sum = 0;
        for (i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);
    }
}