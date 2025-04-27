```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Optimize thread index calculation and loop loading
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    for (int i = idx; i < n; i += stride) {
        // Load data once for reuse
        float t = truth[i];
        float p = pred[i];

        // Calculate error and delta
        error[i] = -t*logf(p + 1e-7f) - (1 - t)*logf(1 - p + 1e-7f);
        delta[i] = t - p;
    }
}