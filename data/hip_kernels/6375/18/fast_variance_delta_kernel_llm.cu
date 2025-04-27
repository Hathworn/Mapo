```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void  fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    local[id] = 0.0f;  // Initialize shared memory

    int filter = blockIdx.x;
    int index;

    // Accumulate local contributions
    for(int j = 0; j < batch; ++j) {
        for(int i = id; i < spatial; i += threads) {  // Use thread-stride loop for workload distribution
            index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    // Perform reduction in shared memory
    __syncthreads();
    for (int s = threads / 2; s > 0; s >>= 1) {
        if (id < s) {
            local[id] += local[id + s];
        }
        __syncthreads();
    }

    // Final computation by the first thread of each block
    if (id == 0) {
        variance_delta[filter] = local[0] * (-0.5f * pow(variance[filter] + 0.000001f, -1.5f));
    }
}