#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void fast_variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    const int threads = BLOCK;
    __shared__ float local[threads];

    int id = threadIdx.x;
    local[id] = 0.0f;

    int filter = blockIdx.x;
    int sharedIdx = threadIdx.x;
    int blockStride = blockDim.x;

    for (int j = 0; j < batch; ++j) {
        for (int i = sharedIdx; i < spatial; i += blockStride) { // Use strided iteration
            int index = j * spatial * filters + filter * spatial + i;
            if (i < spatial) {
                local[id] += powf((x[index] - mean[filter]), 2); // Access each element within bounds
            }
        }
    }

    __syncthreads(); // Ensure all partial sums are complete

    if (id == 0) {
        variance[filter] = 0;
        for (int i = 0; i < threads; ++i) {
            variance[filter] += local[i];
        }
        variance[filter] /= (spatial * batch - 1);
    }
}