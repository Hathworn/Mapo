```c
#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    extern __shared__ float local[];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;
    int i, j;

    // Calculate sum of items handled by this thread
    for (j = 0; j < batch; ++j) {
        for (i = id; i < spatial; i += blockDim.x) {
            int index = j * spatial * filters + filter * spatial + i;
            local[id] += x[index];
        }
    }

    __syncthreads();

    // Reduce within block
    if (id == 0) {
        float block_sum = 0;
        for (i = 0; i < blockDim.x; ++i) {
            block_sum += local[i];
        }
        mean[filter] = block_sum / (spatial * batch);
    }
}