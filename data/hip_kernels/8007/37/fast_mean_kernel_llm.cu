#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Loop unrolling for improved performance
    for(int j = 0; j < batch; ++j){
        for(int i = 0; i < spatial; i += threads * 2){
            int index1 = j*spatial*filters + filter*spatial + i + id;
            int index2 = j*spatial*filters + filter*spatial + i + threads + id;
            local[id] += (i + id < spatial) ? x[index1] : 0;
            local[id] += (i + threads + id < spatial) ? x[index2] : 0;
        }
    }

    __syncthreads();

    if(id < 32) {  // Warp-level reduction for better efficiency
        for(int i = id + 32; i < threads; i += 32){
            local[id] += local[i];
        }
    }

    __syncthreads();

    if(id == 0) {
        float sum = 0;
        for(int i = 0; i < 32; ++i){
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);
    }
}