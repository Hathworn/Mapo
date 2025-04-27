#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize local array for each thread
    local[id] = 0;
    
    // Loop unrolling for spatial dimension
    int index_base = filter * spatial;
    for (int j = 0; j < batch; ++j) {
        #pragma unroll
        for (int i = id; i < spatial; i += threads) {
            int index = j * spatial * filters + index_base + i;
            if (i < spatial) {
                local[id] += x[index];
            }
        }
    }

    __syncthreads();

    // Efficient reduction for local sums
    if (id < 32) {
        for (int offset = threads / 2; offset > 0; offset /= 2) {
            local[id] += __shfl_down_sync(0xffffffff, local[id], offset);
        }
    }

    if (id == 0) {
        mean[filter] = local[0] / (spatial * batch);
    }
}