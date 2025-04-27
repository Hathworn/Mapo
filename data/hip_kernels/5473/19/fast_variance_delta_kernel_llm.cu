#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    local[id] = 0.0f;  // Initialize shared memory

    int i, j;
    for (j = 0; j < batch; ++j) {
        for (i = id; i < spatial; i += threads) {  // Ensure all threads participate
            int index = j * spatial * filters + filter * spatial + i;

            if (i < spatial)  // Perform bounds check before computation
                local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }
    __syncthreads();

    if (id == 0) {
        float sum = 0.0f;
        for (i = 0; i < threads; ++i) {
            sum += local[i];  // Use local sum to reduce global update frequency
        }
        variance_delta[filter] = sum * -.5f * powf(variance[filter] + .00001f, -1.5f);  // Simplified powf computation
    }
}