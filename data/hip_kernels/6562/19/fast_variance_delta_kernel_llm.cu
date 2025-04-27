#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Each thread initializes its own local element to 0
    float local_sum = 0.0f;

    // Unroll outer loop for better performance
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local_sum += delta[index] * (x[index] - mean[filter]);
        }
    }

    // Store each thread's local sum to shared memory
    local[id] = local_sum;

    __syncthreads();

    // Perform reduction only if it's thread 0
    if(id == 0){
        float sum = 0.0f;
        for(int i = 0; i < threads; ++i){
            sum += local[i];
        }
        variance_delta[filter] = sum * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}