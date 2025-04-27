#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize shared memory
    local[id] = 0.0f;

    // Loop over batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) { // Optimized loop to reduce divergence
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += powf((x[index] - mean[filter]), 2);
        }
    }

    __syncthreads();

    // Reduction in shared memory
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (spatial * batch - 1);
    }
}