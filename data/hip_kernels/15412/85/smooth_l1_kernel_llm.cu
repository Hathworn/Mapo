#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized global kernel function
__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x 
            + blockIdx.y * blockDim.x * gridDim.x;
    
    if(i < n) {
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use optimized `fabsf` for float
        
        if(abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        } else {
            error[i] = 2.0f * abs_val - 1.0f;
            delta[i] = copysignf(1.0f, diff); // Use `copysignf` to determine sign
        }
    }
}