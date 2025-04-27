#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Optimize bounds check
    if (i >= n) return;

    // Cache frequently used values and minimize recomputations
    float diff = truth[i] - pred[i];
    float abs_val = fabsf(diff);  // Use `fabsf` for single-precision

    // Simplify branching logic for performance
    if (abs_val < 1) {
        error[i] = diff * diff;
        delta[i] = diff;
    } else {
        error[i] = abs_val * 2.0f - 1.0f;  // Use floating-point literals for consistency
        delta[i] = copysignf(1.0f, diff);   // Use `copysignf` for clarity and optimization
    }
}