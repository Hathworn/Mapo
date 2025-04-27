```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta) 
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int spatial_offset = blockDim.x * gridDim.x;

    local[id] = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += spatial_offset) {
            int index = j * spatial * filters + filter * spatial + i;
            // Accumulate delta
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    __syncthreads();

    // Reduction step
    for (int stride = threads / 2; stride > 0; stride >>= 1) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Compute variance delta for this filter
    if (id == 0) {
        variance_delta[filter] = local[0] * (-0.5f) * powf(variance[filter] + 0.00001f, -1.5f);
    }
}