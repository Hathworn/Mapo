```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void  fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;
    int index;

    // Unroll the inner loop for better performance
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            index = j * spatial * filters + filter * spatial + i;
            local[id] += powf((x[index] - mean[filter]), 2);
        }
    }

    __syncthreads();

    // Optimized reduction using parallel reduction pattern
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}