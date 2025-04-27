#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.0f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Initialize shared memory for partial sums
    extern __shared__ float shared_mean[];
    shared_mean[threadIdx.x] = 0;

    // Calculate partial sums in each thread block
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            shared_mean[threadIdx.x] += x[index];
        }
    }

    // Sum up results across threads within a block
    __syncthreads();
    if (threadIdx.x == 0) {
        float sum = 0;
        for (int j = 0; j < blockDim.x; ++j) {
            sum += shared_mean[j];
        }
        mean[i] = sum * scale;
    }
}