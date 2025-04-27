#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    // Loop over batches and spatial parts, reducing memory accesses with larger steps
    for(int j = 0; j < batch; ++j) {
        for(int i = id; i < spatial; i += BLOCK) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += delta[index];
        }
    }

    // Sum local results using parallel reduction in shared memory
    __syncthreads();
    for (int stride = BLOCK / 2; stride > 0; stride /= 2) {
        if (id < stride) {
            local[id] += local[id + stride];
        }
        __syncthreads();
    }

    // Write result to global memory
    if (id == 0) {
        mean_delta[filter] = local[0] * (-1./sqrt(variance[filter] + .000001f));
    }
}