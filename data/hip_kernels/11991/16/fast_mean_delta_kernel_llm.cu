#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    int filter = blockIdx.x;

    float sum = 0.0f;  // Temporary variable to accumulate results

    for(int j = 0; j < batch; ++j){
        for(int i = id; i < spatial; i += threads){ // Spread work evenly across threads
            int index = j * spatial * filters + filter * spatial + i;
            sum += delta[index]; // Accumulate directly to avoid bank conflicts
        }
    }

    local[id] = sum; // Store the partial sum in shared memory
    __syncthreads(); // Synchronize threads to ensure all sums are written

    // Reduce the sum in shared memory to a single value
    if (id == 0) {
        float total_sum = 0.0f;
        for(int i = 0; i < threads; ++i) {
            total_sum += local[i];
        }
        mean_delta[filter] = total_sum * (-1.0f / sqrtf(variance[filter] + 0.000001f));
    }
}