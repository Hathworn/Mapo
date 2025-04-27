#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;
    int stride = gridDim.x * threads;  // Compute stride for coalesced memory access

    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += stride) {  // Use stride loop for efficiency
            int index = j * spatial * filters + filter * spatial + i;

            if (i < spatial) {
                local[id] += pow((x[index] - mean[filter]), 2);
            }
        }
    }

    __syncthreads();  // Ensure all threads have completed local summation

    if (id == 0) {
        float sum = 0;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (spatial * batch - 1);
    }
}