#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];  // Define shared memory for thread block

    int id = threadIdx.x;
    int filter = blockIdx.x;

    local[id] = 0.0f;

    // Calculate the summation in parallel, unrolling the loop for efficiency
    for (int j = 0; j < batch; ++j) {
        int base_index = j * spatial * filters + filter * spatial + id;
        for (int i = 0; i < spatial; i += threads) {
            if (i + id < spatial) {
                local[id] += x[base_index + i];  // Accumulate values in shared memory
            }
        }
    }

    __syncthreads();

    // Reduce block-level summation using a single thread
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);  // Compute mean
    }
}