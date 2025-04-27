#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation

    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        float log_p_safe = logf(p + 1e-7f); // Use logf and more consistent small constant
        float log_1mp_safe = logf(1.0f - p + 1e-7f); // Use logf and more consistent small constant
        error[i] = -t * log_p_safe - (1.0f - t) * log_1mp_safe;
        delta[i] = t - p;
    }
}