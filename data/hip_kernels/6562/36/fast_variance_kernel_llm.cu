#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize local memory only if necessary to reduce memory operations
    local[id] = 0.0f;

    int j;
    for (j = 0; j < batch; ++j) {
        int index_offset = j * spatial * filters + filter * spatial;
        for (int i = id; i < spatial; i += threads) { // Strided access to utilize all threads
            int index = index_offset + i;
            // Use fmaf (fused multiply-add) for potential performance improvement
            float diff = x[index] - mean[filter];
            local[id] += diff * diff;
        }
    }

    __syncthreads();

    // Use reduction to accumulate values more efficiently
    for (int stride = threads / 2; stride > 0; stride /= 2) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Final calculation by the first thread in the block
    if (id == 0) {
        variance[filter] = local[0] / (spatial * batch - 1);
    }
}