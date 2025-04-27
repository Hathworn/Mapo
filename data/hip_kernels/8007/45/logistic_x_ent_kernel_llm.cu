#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // More efficient index calculation
    int stride = gridDim.x * blockDim.x;  // Determine stride for grid-stride loop
    for (int i = idx; i < n; i += stride) {  // Grid-stride loop for better utilization
        float t = truth[i];
        float p = pred[i];
        error[i] = -t*logf(p + 1e-7f) - (1 - t)*logf(1 - p + 1e-7f);  // Replacing log with logf & adjusted constant
        delta[i] = t - p;
    }
}