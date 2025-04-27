#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation
    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        float log_p = log(p + 1e-7f);               // Small epsilon for numerical stability
        float log_1_p = log(1.0f - p + 1e-7f);     // Small epsilon for numerical stability
        error[i] = -t * log_p - (1 - t) * log_1_p;
        delta[i] = t - p;
    }
}