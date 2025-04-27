#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    // Unrolling the outer loop for better performance
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {  // Distribute iterations directly among threads
            int index = j * spatial * filters + filter * spatial + i;
            float diff = x[index] - mean[filter];
            local[id] += diff * diff;
        }
    }

    __syncthreads();

    // Reduction: Summing up values in shared memory
    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (spatial * batch - 1);
    }
}