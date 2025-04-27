#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i < n) {
        float p = pred[i];
        float t = truth[i];
        float log_p = logf(p + 1e-7f);             // Use logf for single-precision
        float log_one_minus_p = logf(1.0f - p + 1e-7f); // Use logf for single-precision
        error[i] = -t * log_p - (1.0f - t) * log_one_minus_p;
        delta[i] = t - p;
    }
}