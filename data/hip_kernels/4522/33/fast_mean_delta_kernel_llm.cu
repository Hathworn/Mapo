#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use shared memory to reduce memory access latency
    for(int j = 0; j < batch; ++j){
        int base_idx = j * spatial * filters + filter * spatial;
        for(int i = id; i < spatial; i += threads){
            local[id] += delta[base_idx + i];
        }
    }

    __syncthreads();

    // Perform reduction using parallel reduction
    if(id < 32) {
        #pragma unroll
        for(int offset = 32; offset > 0; offset >>= 1) {
            local[id] += __shfl_down_sync(0xFFFFFFFF, local[id], offset);
        }
    }

    if(id == 0){
        mean_delta[filter] = local[0] * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}
```
