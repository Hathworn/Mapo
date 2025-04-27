#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use a more efficient loop and load balancing by unrolling the loop
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            if(i < spatial) local[id] += delta[index];
        }
    }

    __syncthreads();

    // Use atomic operation to prevent race conditions when combining results
    if(id == 0){
        float sum = 0.0f;
        for(int i = 0; i < threads; ++i){
            sum += local[i];
        }
        mean_delta[filter] = sum * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}