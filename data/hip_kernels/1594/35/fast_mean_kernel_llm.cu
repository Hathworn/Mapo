#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void  fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    int j;
    for(j = 0; j < batch; ++j){
        // Using unrolled loop for improved performance
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Reduce sum using parallel reduction
    for(int stride = threads / 2; stride > 0; stride /= 2) {
        if(id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    if(id == 0){
        mean[filter] = local[0] / (spatial * batch);
    }
}