#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index and ensure it doesn't exceed the array length
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use faster HIP intrinsic for absolute value
        if (abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        } else {
            error[i] = 2.0f * abs_val - 1.0f;
            delta[i] = copysignf(1.0f, diff); // Use copysignf for clarity and potential performance gain
        }
    }
}