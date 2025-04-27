#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    extern __shared__ float local[]; // Use dynamic shared memory

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int total_spatial = batch * spatial; // Calculate total once

    local[id] = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += blockDim.x) { // Optimize loop to avoid index calculations
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += powf(x[index] - mean[filter], 2);
        }
    }

    __syncthreads();

    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < blockDim.x; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (total_spatial - 1); // Use total_spatial for readability
    }
}