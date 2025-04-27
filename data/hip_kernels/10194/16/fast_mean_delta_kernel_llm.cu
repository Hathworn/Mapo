#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Optimize by combining multiple threads' work using the shared memory more effectively
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads(); // Ensure all threads have completed their summation

    // Reduce using shared memory by summing all local results in thread 0
    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean_delta[filter] = sum * (-1.0f / sqrt(variance[filter] + 0.000001f));
    }
}