#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean) {
    const int threads = 512;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int stride = spatial * filters;

    // Initialize shared memory
    local[id] = 0;

    // Accumulate sum in shared memory
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * stride + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Reduce sum in shared memory
    if (id < 256) local[id] += local[id + 256];
    __syncthreads();
    if (id < 128) local[id] += local[id + 128];
    __syncthreads();
    if (id < 64) local[id] += local[id + 64];
    __syncthreads();

    if (id < 32) {
        local[id] += local[id + 32];
        local[id] += local[id + 16];
        local[id] += local[id + 8];
        local[id] += local[id + 4];
        local[id] += local[id + 2];
        local[id] += local[id + 1];
    }

    if (id == 0) {
        mean[filter] = local[0] / (spatial * batch);  // Compute mean
    }
}