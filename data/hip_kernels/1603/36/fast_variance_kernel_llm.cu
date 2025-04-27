#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];
    int id = threadIdx.x;
    local[id] = 0;
    int filter = blockIdx.x;
    
    // Unroll the loop for performance improvement
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += powf((x[index] - mean[filter]), 2);
        }
    }
    
    __syncthreads();
    
    // Use parallel reduction to accumulate results
    for (unsigned int stride = threads / 2; stride > 0; stride >>= 1) {
        __syncthreads();
        if (id < stride) {
            local[id] += local[id + stride];
        }
    }
    
    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}