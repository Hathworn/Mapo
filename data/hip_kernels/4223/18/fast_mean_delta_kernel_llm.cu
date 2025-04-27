```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    
    // Initialize shared memory to zero
    local[id] = 0;

    // Accumulate delta values for each thread
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {  // Use thread stride
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += (i < spatial) ? delta[index] : 0;
        }
    }

    __syncthreads();

    // Reduce sum in a single thread
    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean_delta[filter] = sum * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}