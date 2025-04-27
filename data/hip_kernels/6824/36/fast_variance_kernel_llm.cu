#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;
    local[id] = 0;

    // Iterate over batch and spatial dimensions
    for(int j = 0; j < batch; ++j) {
        for(int i = id; i < spatial; i += threads) { // Stride by threads across spatial dimension
            int index = j * spatial * filters + filter * spatial + i;

            if(i < spatial) { // Ensure index is within bounds
                local[id] += powf((x[index] - mean[filter]), 2);
            }
        }
    }

    // Ensure all threads have written their values to local memory
    __syncthreads();

    // Reduce sum in shared memory by the first thread
    if(id == 0) {
        float sum = 0;
        for(int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        variance[filter] = sum / (spatial * batch - 1);
    }
}