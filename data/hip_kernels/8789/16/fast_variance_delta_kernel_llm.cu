#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void  fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;

    int filter = blockIdx.x;
    int thread_stride = blockDim.x * gridDim.x;

    int i, j;
    for(j = 0; j < batch; ++j){
        for(i = id; i < spatial; i += thread_stride){
            int index = j * spatial * filters + filter * spatial + i;

            if (i < spatial) {
                local[id] += delta[index] * (x[index] - mean[filter]);
            }
        }
    }
    __syncthreads(); // Ensure all threads have written to local

    // Use reduction to accumulate results
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads(); // Synchronize threads after each reduction step
    }

    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * powf(variance[filter] + .000001f, -1.5f);
    }
}