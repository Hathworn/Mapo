#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    // Reduce global memory access frequency by unrolling loops
    int step = spatial / threads * threads;  // handle remaining elements separately
    for(int j = 0; j < batch; ++j) {
        for(int i = 0; i < step; i += threads){
            int index = j * spatial * filters + filter * spatial + i + id;
            local[id] += x[index];
        }
        // Handle remaining elements if spatial is not divisible by threads
        for(int i = step + id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Use efficient reduction pattern
    if (id < threads / 2){
        local[id] += local[id + threads / 2];
    }
    __syncthreads();
    
    if(id < threads / 4){
        local[id] += local[id + threads / 4];
    }
    __syncthreads();
    
    if(id < threads / 8){
        local[id] += local[id + threads / 8];
    }
    __syncthreads();
    
    if(id == 0){
        mean[filter] = local[0] / (spatial * batch);
    }
}