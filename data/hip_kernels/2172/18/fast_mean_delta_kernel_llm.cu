#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize shared memory with parallel reduction in mind
    float sum = 0.0f;

    // Loop with stride to cover all spatial elements
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            sum += delta[index];
        }
    }

    local[id] = sum;
    __syncthreads();

    // Reduce using parallel reduction
    for (int offset = threads / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // Compute mean_delta for this filter
    if(id == 0) {
        mean_delta[filter] = local[0] * (-1.f/sqrtf(variance[filter] + .00001f));
    }
}