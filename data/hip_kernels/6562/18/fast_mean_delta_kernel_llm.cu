#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    int i, j;
    for(j = 0; j < batch; ++j){
        for(i = id; i < spatial; i += threads){
            int index = j*spatial*filters + filter*spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Using reduction technique to accumulate results
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

    if (id == 0) {
        // Final sum computation by the first thread
        mean_delta[filter] = local[0] * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}