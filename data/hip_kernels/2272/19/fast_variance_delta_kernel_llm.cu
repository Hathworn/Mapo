#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];
    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize shared memory
    local[id] = 0;

    // Use unrolled loop for improved performance
    for (int j = 0; j < batch; ++j) {
        int max_i = ((spatial - 1) / threads + 1) * threads;
        for (int i = id; i < max_i; i += threads) {
            int index = j * spatial * filters + filter * spatial + i;
            // Boundary check to prevent out-of-bounds access
            if (i < spatial) {
                local[id] += delta[index] * (x[index] - mean[filter]);
            }
        }
    }

    __syncthreads();

    // Use a more efficient reduction method
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance_delta[filter] = sum * -.5f * powf(variance[filter] + .00001f, (float)(-3.f/2.f));
    }
}