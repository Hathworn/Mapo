#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;

    // Optimize by using a single loop with fewer conditional checks
    int stride = blockDim.x * gridDim.x;
    for (int j = id; j < batch * spatial; j += stride) {
        int index = j * filters + filter * spatial + id;
        if (index < batch * spatial * filters) {
            local[id] += x[index];
        }
    }
    __syncthreads();

    // Use warp reduction for faster summation
    if (threads >= 32) {
        for (int s = threads / 2; s > 0; s >>= 1) {
            if (id < s) {
                local[id] += local[id + s];
            }
            __syncthreads();
        }
    }

    // Single thread division after warp reduction
    if (id == 0) {
        mean[filter] = local[0] / (spatial * batch);
    }
}