```c++
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;

    int filter = blockIdx.x;

    // Unroll inner loop to improve performance
    for (int j = 0; j < batch; ++j) {
        for (int i = threadIdx.x; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    // Reduction using shared memory and thread synchronization
    __syncthreads();
    for (int s = threads / 2; s > 0; s >>= 1) {
        if (id < s) {
            local[id] += local[id + s];
        }
        __syncthreads();
    }

    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}