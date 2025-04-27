#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}


__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize local sum to 0
    local[id] = 0.0f;

    int index_base = filter * spatial;

    // Use striding for performance
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + index_base + i;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    __syncthreads();

    // Reduction within block
    if(id < 32){
        for(int offset = 32; offset < threads; offset += 32){
            local[id] += local[id + offset];
        }
    }

    __syncthreads();

    // Final reduction and update of variance_delta
    if(id == 0){
        float sum = 0.0f;
        for(int i = 0; i < 32; ++i){
            sum += local[i];
        }
        variance_delta[filter] = sum * -0.5f * powf(variance[filter] + 0.000001f, -1.5f);
    }
}