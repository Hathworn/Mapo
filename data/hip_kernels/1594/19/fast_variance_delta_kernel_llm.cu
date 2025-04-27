#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Reset local shared memory
    local[id] = 0;

    int i, j;
    for(j = 0; j < batch; ++j){
        for(i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    // Synchronize threads within block
    __syncthreads();

    // Reduce local values and compute variance delta
    if(id == 0){
        float sum = 0;
        for(i = 0; i < threads; ++i){
            sum += local[i];
        }
        variance_delta[filter] = sum * -.5f * powf(variance[filter] + .00001f, (float)(-3.f/2.f));
    }
}