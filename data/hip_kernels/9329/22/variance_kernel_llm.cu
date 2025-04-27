#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void variance_kernel(float *x, float *mean, int batch, int filters, int spatial, float *variance)
{
    float scale = 1.F / (batch * spatial - 1);
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float sum = 0.0f;  // Use a temporary variable to accumulate
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            float diff = x[index] - mean[i];
            sum += diff * diff;  // Reduce redundant 'powf' call
        }
    }
    variance[i] = sum * scale;  // Scale after accumulation
}