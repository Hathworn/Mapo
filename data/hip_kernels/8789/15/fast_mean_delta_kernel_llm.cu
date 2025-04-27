#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int spatialPerThread = (spatial + threads - 1) / threads;  // Ensure all spatial indices are handled

    local[id] = 0;

    // Optimized loop to utilize shared memory coalescing
    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads(); // Ensure all threads have completed summing

    // Use a single thread per block to sum the local sums and compute mean_delta
    if (id == 0){
        mean_delta[filter] = 0;
        for (int i = 0; i < threads; ++i){
            mean_delta[filter] += local[i];
        }
        mean_delta[filter] *= (-1.0f / sqrtf(variance[filter] + .000001f));
    }
}
```
