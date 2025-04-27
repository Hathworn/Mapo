```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    // Compute the global index for the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Use float atomicAdd to handle concurrent writes safely and potentially optimize memory operations
    float sum = 0.0f;
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += x[index];
        }
    }

    // Calculate scale once per iteration instead of every time
    float scale = 1.0f / (batch * spatial);
    mean[i] = sum * scale;
}