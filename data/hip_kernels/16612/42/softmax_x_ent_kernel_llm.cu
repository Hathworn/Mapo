#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        float log_p = (p > 0) ? __logf(p) : 0;  // Fast logarithm approximation
        error[i] = t ? -log_p : 0;
        delta[i] = t - p;
    }
}