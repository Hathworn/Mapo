#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Optimize thread indexing for 1D grid
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);
        if (abs_val < 1.0f) {  // Use consistent floating-point literal
            error[i] = diff * diff;
            delta[i] = diff;
        } else {
            error[i] = 2.0f * abs_val - 1.0f;  // Use consistent floating-point literals
            delta[i] = copysignf(1.0f, diff);  // Optimize using copysignf for delta calculation
        }
    }
}