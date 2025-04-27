#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    // Optimize by precomputing constant in registers
    float scale = 1.0f / (batch * spatial - 1);
    int idx = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (idx >= filters) return;

    float var_sum = 0.0f; // Use local variable to accumulate variance

    for (int j = 0; j < batch; ++j) {
        // Unroll loop to improve performance
        for (int k = 0; k < spatial; k += 4) {
            int base_index = j * filters * spatial + idx * spatial + k;

            for (int offset = 0; offset < 4 && (k + offset) < spatial; ++offset) {
                int index = base_index + offset;
                float diff = x[index] - mean[idx];
                var_sum += diff * diff;
            }
        }
    }
    variance[idx] = var_sum * scale; // Store result
}