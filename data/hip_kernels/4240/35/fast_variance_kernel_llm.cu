#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    int i, j;
    // Loop unrolling
    for(j = 0; j < batch; ++j){
        for(i = id; i < spatial; i += threads){
            int index = j*spatial*filters + filter*spatial + i;
            float diff = (i < spatial) ? x[index] - mean[filter] : 0;
            local[id] += diff * diff;
        }
    }
    __syncthreads();

    // Reduce using parallel reduction
    if(id < 32){
        for(i = threads / 2; i > 32; i >>= 1){
            if(id < i){
                local[id] += local[id + i];
            }
            __syncthreads();
        }
        if(id < 32){
            volatile float* vlocal = local;
            vlocal[id] += vlocal[id + 32];
            vlocal[id] += vlocal[id + 16];
            vlocal[id] += vlocal[id + 8];
            vlocal[id] += vlocal[id + 4];
            vlocal[id] += vlocal[id + 2];
            vlocal[id] += vlocal[id + 1];
        }
    }

    if(id == 0){
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}
```
