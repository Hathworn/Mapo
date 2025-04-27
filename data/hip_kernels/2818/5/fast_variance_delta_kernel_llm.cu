#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta) {
    const int threads = 512;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Use a single loop iteration and reduce shared memory access
    for (int j = 0; j < batch * spatial; j += threads) {
        int index = j * filters + filter * spatial + id;

        if (j + id < batch * spatial) {
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    __syncthreads();

    // Perform reduction using parallel threads
    if (id < threads / 2) {
        local[id] += local[id + threads / 2];
    }
    __syncthreads();

    // Calculate final variance delta in a single thread
    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads / 2; ++i) {
            sum += local[i];
        }
        variance_delta[filter] = -.5f * sum * powf(variance[filter] + .00001f, -1.5f);
    }
}