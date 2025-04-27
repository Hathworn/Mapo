#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float* x, float* delta, float* mean, float* variance, int batch, int filters, int spatial, float* variance_delta) 
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Loop unrolling to reduce the number of iterations
    for (int j = 0; j < batch; ++j) {
        for (int i = 0; i < spatial; i += threads * 2) {
            int index1 = j * spatial * filters + filter * spatial + i + id;
            int index2 = index1 + threads;

            // Use conditional assignment to avoid conditional statements
            float delta_contribution1 = (i + id < spatial) ? delta[index1] * (x[index1] - mean[filter]) : 0;
            float delta_contribution2 = (i + id + threads < spatial) ? delta[index2] * (x[index2] - mean[filter]) : 0;

            local[id] += delta_contribution1 + delta_contribution2;
        }
    }

    __syncthreads();

    // Use a single thread to reduce the array
    if (id == 0) {
        variance_delta[filter] = 0;
        for (int i = 0; i < threads; ++i) {
            variance_delta[filter] += local[i];
        }
        variance_delta[filter] *= -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}