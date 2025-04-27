#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    float local_sum = 0.0f; // Use a register to accumulate local results

    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){ // Increment by threads to ensure each thread processes different elements
            int index = j * spatial * filters + filter * spatial + i;
            local_sum += delta[index] * (x[index] - mean[filter]);
        }
    }

    local[id] = local_sum; // Store the result in shared memory
    __syncthreads();

    if(id == 0){
        float sum = 0.0f;
        for(int i = 0; i < threads; ++i){
            sum += local[i];
        }
        variance_delta[filter] = sum * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}