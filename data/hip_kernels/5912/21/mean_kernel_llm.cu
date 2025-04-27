#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_kernel(float *x, int batch, int filters, int spatial, float *mean)
{
    float scale = 1.f / (batch * spatial);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float temp_mean = 0.0f; // Temporary variable for each thread
    int filter_offset = i * spatial; // Precompute offset for filter

    for (int j = 0; j < batch; ++j) {
        int batch_offset = j * filters * spatial; // Precompute offset for each batch
        for (int k = 0; k < spatial; ++k) {
            int index = batch_offset + filter_offset + k;
            temp_mean += x[index];
        }
    }
    mean[i] = temp_mean * scale; // Scale after the loop
}