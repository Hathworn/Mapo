#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;

    int filter = blockIdx.x;

    // Optimized workload by using a single loop
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();  // Ensure all threads have completed local accumulation

    // Use parallel reduction for better performance
    if (threads > 1) {
        for (int s = threads / 2; s > 0; s >>= 1) {
            if (id < s) {
                local[id] += local[id + s];
            }
            __syncthreads();  // Synchronize threads after each reduction step
        }
    }

    if (id == 0) {
        mean[filter] = local[0] / (spatial * batch);
    }
}