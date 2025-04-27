#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    float sum = 0.0f;  // Use a register for accumulation

    int total_iters = spatial * batch;
    for (int idx = id; idx < total_iters; idx += threads) {
        int batch_idx = idx / spatial;
        int spatial_idx = idx % spatial;
        int index = batch_idx * spatial * filters + filter * spatial + spatial_idx;
        
        sum += powf((x[index] - mean[filter]), 2);  // Accumulate local sum directly
    }

    local[id] = sum;  // Store accumulated sum in shared memory
    __syncthreads();

    // Use parallel reduction to accumulate shared memory results
    if (id == 0) {
        variance[filter] = 0.0f;
        for (int i = 0; i < threads; ++i) {
            variance[filter] += local[i];
        }
        variance[filter] /= (spatial * batch - 1);  // Final division
    }
}