#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize fast_mean_kernel by reducing divergence and improving memory operations
__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int batch_filter_offset = filter * spatial;
    local[id] = 0.0f;

    // Use loop unrolling for spatial dimension
    for (int j = 0; j < batch; ++j) {
        int batch_offset = j * spatial * filters;
        for (int i = id; i < spatial; i += threads) {
            int index = batch_offset + batch_filter_offset + i;
            local[id] += x[index]; // Accumulate values
        }
    }

    __syncthreads();

    // Accumulate results using parallel reduction
    if (id < threads / 2) {
        local[id] += local[id + threads / 2];
    }
    __syncthreads();

    if (id < threads / 4) {
        local[id] += local[id + threads / 4];
    }
    __syncthreads();

    if (id < threads / 8) {
        local[id] += local[id + threads / 8];
    }
    __syncthreads();

    if (id < threads / 16) {
        local[id] += local[id + threads / 16];
    }
    __syncthreads();

    // Calculate mean and store in global memory
    if (id == 0) {
        mean[filter] = local[0] / (spatial * batch);
    }
}