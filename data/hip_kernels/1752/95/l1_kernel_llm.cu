#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use more efficient thread index calculation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    if(i < n) {
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff); // Use faster intrinsic function for absolute value
        delta[i] = copysignf(1.0f, diff); // Use copysign function instead of branch
    }
}