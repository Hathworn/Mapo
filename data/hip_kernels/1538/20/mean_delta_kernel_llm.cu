#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void mean_delta_kernel(float *delta, float *variance, int batch, int filters, int spatial, float *mean_delta)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i >= filters) return;  // Ensure thread is within bounds
    int j, k;
    float sum = 0; // Use local variable to reduce global memory access
    for (j = 0; j < batch; ++j) {
        for (k = 0; k < spatial; ++k) {
            int index = j * filters * spatial + i * spatial + k;
            sum += delta[index]; // Accumulate in local variable
        }
    }
    mean_delta[i] = sum * (-1.f / sqrtf(variance[i] + .00001f)); // Compute and store the result
}