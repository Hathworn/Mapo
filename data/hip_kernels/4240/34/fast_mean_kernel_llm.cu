#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];  // Fixed size to BLOCK for better consistency
    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;

    int offset = filter * spatial;

    // Accumulate values in shared memory
    for (int j = 0; j < batch; ++j) {
        int base_index = j * spatial * filters + offset;
        for (int i = id; i < spatial; i += threads) {  // Strided access for better utilization
            local[id] += x[base_index + i];
        }
    }

    __syncthreads();

    // Reduce shared memory values to compute mean
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);
    }
}