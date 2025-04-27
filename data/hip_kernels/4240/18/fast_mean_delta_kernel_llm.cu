```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];
    
    int id = threadIdx.x;
    local[id] = 0;
    
    int filter = blockIdx.x;
    
    // Efficient reduction in shared memory
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += (i < spatial) ? delta[index] : 0;
        }
    }
    __syncthreads();
    
    // Use parallel reduction for better performance
    for(int stride = threads / 2; stride > 0; stride /= 2){
        if(id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }
    
    if(id == 0){
        mean_delta[filter] = local[0] * (-1.F/sqrtf(variance[filter] + .000001f));
    }
}