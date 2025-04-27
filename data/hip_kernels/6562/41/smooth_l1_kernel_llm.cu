#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread operates within bounds
    if(i < n) {
        // Calculate the difference between truth and prediction
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff);
        
        // Use intrinsic operations for better performance
        if(abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        }
        else {
            error[i] = fmaf(2.0f, abs_val, -1.0f);  // Use fmaf for fused multiply-add
            delta[i] = copysignf(1.0f, diff);     // Use copysignf for better readability
        }
    }
}