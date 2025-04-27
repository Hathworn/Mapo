```
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index
    if (i >= filters) return;

    float md = 0.0f; // Initialize mean_delta

    // Use a single loop to iterate over all indices
    for (int j = 0; j < batch * spatial; ++j) {
        int index = (j / spatial) * filters * spatial + i * spatial + (j % spatial);
        md += delta[index];
    }
    mean_delta[i] = md * (-1.0f / sqrtf(variance[i] + .00001f)); // Update mean_delta with scaling
}