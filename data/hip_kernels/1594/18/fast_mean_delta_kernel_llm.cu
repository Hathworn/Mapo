#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[BLOCK];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    // Initialize shared memory
    float temp_sum = 0.0f;

    // Unroll the loop for better performance
    for (int j = 0; j < batch; ++j) {
        for (int i = id; i < spatial; i += threads) {  // Change loop increment to `threads`
            int index = j * spatial * filters + filter * spatial + i;
            temp_sum += (i < spatial) ? delta[index] : 0.0f;
        }
    }

    // Store partial sum in shared memory
    local[id] = temp_sum;
    __syncthreads();

    // Perform reduction in shared memory
    if (id == 0) {
        mean_delta[filter] = 0.0f;
        for (int i = 0; i < threads; ++i) {
            mean_delta[filter] += local[i];
        }
        mean_delta[filter] *= (-1.0f / sqrtf(variance[filter] + 0.00001f));
    }
}