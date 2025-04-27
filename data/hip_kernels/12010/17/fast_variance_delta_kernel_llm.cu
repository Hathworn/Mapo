#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta) {
    extern __shared__ float local[]; // Use dynamic shared memory

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize local memory
    local[id] = 0;

    // Iterate over the batch and spatial dimensions
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += blockDim.x) { // Improve loop stride
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index] * (x[index] - mean[filter]);
        }
    }

    // Reduce within the block
    __syncthreads(); // Ensure all threads have completed their additions
    if (id == 0) {
        float reduceSum = 0;
        for (int i = 0; i < blockDim.x; ++i) {
            reduceSum += local[i];
        }
        variance_delta[filter] = reduceSum * -.5f * powf(variance[filter] + .000001f, -1.5f);
    }
}