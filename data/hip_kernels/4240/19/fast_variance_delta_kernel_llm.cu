#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    
    // Initialize shared memory with 0
    local[id] = 0;

    for(int j = 0; j < batch; ++j) {
        for(int i = id; i < spatial; i += threads) { // Optimize loop with step size as threads
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }
    __syncthreads();

    // Accumulate results using only one thread
    if(id == 0){
        variance_delta[filter] = 0;
        for(int i = 0; i < threads; ++i){
            variance_delta[filter] += local[i];
        }
        // Constant expressions computed only once
        float variance_factor = -.5 * powf(variance[filter] + .000001f, (float)(-3./2.));
        variance_delta[filter] *= variance_factor;
    }
}