#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Optimize index calculation using blockDim.x for better readability and performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);  // Use standard library function for absolute value
        if (abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        }
        else {
            error[i] = 2.0f * abs_val - 1.0f;  // Ensure consistent floating-point usage
            delta[i] = copysignf(1.0f, diff); // Use copysignf for sign determination
        }
    }
}