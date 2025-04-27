#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimize block index calculation

    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);

        // Use ternary operator for compact control flow
        error[i] = (abs_val < 1) ? (diff * diff) : (2 * abs_val - 1);
        delta[i] = (abs_val < 1) ? diff : copysignf(1.0f, diff); // Use copysignf for sign
    }
}