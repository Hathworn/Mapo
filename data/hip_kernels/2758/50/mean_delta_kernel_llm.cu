#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;

    float mean = 0.0f; // Use a local variable for intermediate accumulation
    for (int j = 0; j < batch; ++j) {
        for (int k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            mean += delta[index]; // Accumulate into the local variable
        }
    }
    mean_delta[i] = mean * (-1.F / sqrtf(variance[i] + .000001f)); // Compute the final result
}