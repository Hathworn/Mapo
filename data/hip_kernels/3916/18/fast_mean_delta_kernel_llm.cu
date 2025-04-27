#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Optimize memory access with unrolling and boundary checks.
    int i, j;
    for(j = 0; j < batch; ++j){
        for(i = id; i < spatial; i += threads){
            int index = j*spatial*filters + filter*spatial + i;
            if (i < spatial) {
                local[id] += delta[index];
            }
        }
    }

    __syncthreads();

    // Accumulate reductions to a single thread.
    if(id == 0){
        mean_delta[filter] = 0;
        for(i = 0; i < threads; ++i){
            mean_delta[filter] += local[i];
        }
        mean_delta[filter] *= (-1.f/sqrtf(variance[filter] + .00001f));
    }
}