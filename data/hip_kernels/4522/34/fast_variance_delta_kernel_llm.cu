#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    int j, i, index;
    for(j = 0; j < batch; ++j) {
        // Ensure coalesced memory access for better performance
        for(i = id; i < spatial; i += threads) {
            index = j * spatial * filters + filter * spatial + i;
            local[id] += (i < spatial) ? delta[index] * (x[index] - mean[filter]) : 0;
        }
    }

    __syncthreads();

    // Reduce the results from all threads using atomic add for better performance
    if(id == 0) {
        float sum = 0;
        for(i = 0; i < threads; ++i) {
            sum += local[i];
        }
        atomicAdd(&variance_delta[filter], sum * -.5f * powf(variance[filter] + .00001f, -1.5f));
    }
}