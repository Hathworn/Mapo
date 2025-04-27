#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    __shared__ float sharedMean[1024]; // Use shared memory for partial results
    float scale = 1.F / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    sharedMean[threadIdx.x] = 0; // Initialize shared memory
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sharedMean[threadIdx.x] += x[index]; // Accumulate in shared memory
        }
    }
    mean[i] = sharedMean[threadIdx.x] * scale; // Use shared memory result
}