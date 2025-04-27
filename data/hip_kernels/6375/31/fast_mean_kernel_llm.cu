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
    for(j = 0; j < batch; ++j){
        // Use a pointer to avoid recalculating index offsets
        float *x_ptr = x + j * spatial * filters + filter * spatial;
        for(i = id; i < spatial; i += threads){
            local[id] += x_ptr[i];
        }
    }

    // Use atomic addition for thread-safe mean calculation
    atomicAdd(&mean[filter], local[id] / (spatial * batch));
}