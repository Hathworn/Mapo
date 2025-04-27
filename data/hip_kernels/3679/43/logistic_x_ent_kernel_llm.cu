#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = gridDim.x * blockDim.x; // Determine total stride for grid

    // Process elements in a grid-strided loop
    for (int idx = i; idx < n; idx += stride) {
        float t = truth[idx];
        float p = pred[idx];
        error[idx] = -t * logf(p + 1e-7f) - (1.0f - t) * logf(1.0f - p + 1e-7f); // Use logf for float precision
        delta[idx] = t - p;
    }
}