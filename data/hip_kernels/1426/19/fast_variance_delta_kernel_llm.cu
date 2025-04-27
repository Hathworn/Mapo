#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    float temp_sum = 0.0f; // Use a local variable to store reduction sum 

    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) { // Increment by threads directly
            int index = j * spatial * filters + filter * spatial + i;

            temp_sum += delta[index] * (x[index] - mean[filter]); // Accumulate values
        }
    }

    local[id] = temp_sum; // Store local sum
    __syncthreads();

    // Use parallel reduction to sum up all local[id] values
    for (int s = threads / 2; s > 0; s >>= 1) {
        if (id < s) {
            local[id] += local[id + s];
        }
        __syncthreads();
    }

    if (id == 0) {
        variance_delta[filter] = local[0] * -.5f * powf(variance[filter] + .00001f, -1.5f);
    }
}