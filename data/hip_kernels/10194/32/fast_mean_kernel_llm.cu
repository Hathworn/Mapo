#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    int i, j;
    // Unroll the loop for increased performance
    for(j = 0; j < batch; ++j){
        for(i = 0; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i + id;
            local[id] += (i + id < spatial) ? x[index] : 0;
        }
    }

    // Use reduction pattern to compute sum
    __syncthreads();
    if(id < warpSize){
        for(int offset = warpSize; offset < threads; offset += warpSize){
            local[id] += local[id + offset];
        }
    }
    
    // Atomic operation to safely update mean
    if(id == 0){
        atomicAdd(&mean[filter], local[0] / (spatial * batch));
    }
}