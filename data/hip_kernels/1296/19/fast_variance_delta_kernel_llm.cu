#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_delta_kernel(float *x, float *delta, float *mean, float *variance, int batch, int filters, int spatial, float *variance_delta)
{
    extern __shared__ float local[];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Each thread computes its contribution to shared memory
    float sum = 0.0f;
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += blockDim.x) {
            int index = j * spatial * filters + filter * spatial + i;
            if (i < spatial) {
                sum += delta[index] * (x[index] - mean[filter]);
            }
        }
    }
    local[id] = sum;

    __syncthreads();

    // Use a parallel reduction to compute the block-wide sum
    for (int offset = blockDim.x / 2; offset > 0; offset >>= 1) {
        if (id < offset) {
            local[id] += local[id + offset];
        }
        __syncthreads();
    }

    // First thread computes the final result for this block
    if (id == 0) {
        variance_delta[filter] = local[0] * (-0.5f * powf(variance[filter] + 0.00001f, -1.5f));
    }
}