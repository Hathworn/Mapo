#include "hip/hip_runtime.h"
#include "includes.h"

extern "C" {
}

__global__ void smooth_l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index
    if(i < n){
        float diff = truth[i] - pred[i];
        float abs_val = fabsf(diff); // Use fast math function for absolute value
        if(abs_val < 1.0f) {
            error[i] = diff * diff;
            delta[i] = diff;
        }
        else {
            error[i] = 2.0f * abs_val - 1.0f;
            delta[i] = copysignf(1.0f, diff); // Use copysignf for sign function
        }
    }
}