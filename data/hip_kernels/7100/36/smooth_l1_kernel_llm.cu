#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use a single index calculation to improve readability and performance
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x; 
    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use intrinsic for better performance
        if(abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        } else {
            error[i] = 2.0f * abs_val - 1.0f;
            delta[i] = copysignf(1.0f, diff); // Use intrinsic for branch reduction
        }
    }
}