#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0.0f;
    
    // Optimize loop unrolling and avoid unnecessary computations
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            float diff = x[index] - mean[filter];
            local[id] += diff * diff;
        }
    }

    // Use parallel reduction to sum shared memory
    __syncthreads();
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Final compute on thread 0
    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}