#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    local[id] = 0;

    // Unrolling the loop to enhance performance
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            if (i < spatial) {
                local[id] += delta[index] * (x[index] - mean[filter]);
            }
        }
    }

    __syncthreads();

    // Reduction to calculate sum across threads
    if (id < 32) { // Warp unrolling, using reduction for optimization
        for (int offset = threads / 2; offset > 0; offset >>= 1) {
            local[id] += __shfl_down_sync(0xffffffff, local[id], offset);
        }
    }

    // Store result after reduction
    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * pow(variance[filter] + .000001f, -1.5f);
    }
}