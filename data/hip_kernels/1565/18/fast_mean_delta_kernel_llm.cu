#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void fast_mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0;

    int filter = blockIdx.x;
    float sum = 0.0f; // Accumulator for each thread

    // Use a single loop with a stride of threads to reduce the number of iterations
    for (int j = 0; j < batch * spatial; j += threads) {
        int index = j * filters + filter * spatial + id;
        if (j + id < batch * spatial) { // Boundary check to prevent out-of-bounds access
            sum += delta[index];
        }
    }

    local[id] = sum; // Store each thread's sum in shared memory
    __syncthreads();

    // Reduce shared memory array to calculate the final mean_delta
    if (id == 0) {
        float total = 0.0f;
        for (int i = 0; i < threads; ++i) {
            total += local[i];
        }
        mean_delta[filter] = total * (-1.f / sqrtf(variance[filter] + .00001f));
    }
}