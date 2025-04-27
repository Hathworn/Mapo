#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    int stride = blockDim.x;

    local[id] = 0;
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += stride) { // Use strided loops for better memory access
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    __syncthreads();

    // Use parallel reduction within shared memory
    for (unsigned int s = stride / 2; s > 0; s >>= 1) {
        if (id < s) {
            local[id] += local[id + s];
        }
        __syncthreads();
    }

    if (id == 0) {
        mean_delta[filter] = local[0] * (-1.f / sqrtf(variance[filter] + .00001f)); // Direct computation after reduction
    }
}