#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;
    int total_spatial = batch * spatial * filters;

    // Using stride loop to reduce iteration count
    for (int index = filter * spatial + id; index < total_spatial; index += threads * spatial) {
        int j = index / (spatial * filters);
        int i = index % spatial;
        local[id] += (i < spatial) ? delta[index] * (x[index] - mean[filter]) : 0;
    }

    __syncthreads();

    // Using reduction to minimize warp divergence
    for (int offset = threads / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // Only first thread writes the result
    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}