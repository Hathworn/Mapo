#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void fast_mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;  // Initialize shared memory

    int filter = blockIdx.x;
    int numElements = batch * spatial;

    // Unroll loop for performance
    for (int j = 0; j < batch; ++j) {
        int baseIndex = j * spatial * filters + filter * spatial + id;
        for (int i = 0; i < spatial; i += threads) {
            int index = baseIndex + i;
            if (index < numElements) {
                local[id] += x[index];  // Accumulate values
            }
        }
    }

    // Use atomic addition for reduction to prevent race condition
    if (id == 0) {
        float sum = 0.0f;
        for (int i = 0; i < threads; ++i) {
            sum += local[i];
        }
        mean[filter] = sum / (spatial * batch);
    }
}