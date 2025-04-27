#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    // Calculate linear thread index within the grid
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    // Precompute the variance term outside the loop for efficiency
    float variance_term = -1.f / sqrtf(variance[i] + .00001f);

    // Initialize mean_delta[i] directly in the kernel
    float sum = 0.0f;

    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            // Accumulate delta values in local variable
            sum += delta[index];
        }
    }
    
    // Efficiently update mean_delta by utilizing precomputed variance term
    mean_delta[i] = sum * variance_term;
}