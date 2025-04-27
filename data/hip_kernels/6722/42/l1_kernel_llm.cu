#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int index = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if(index < n){
        float diff = truth[index] - pred[index]; // Use single index calculation
        error[index] = fabsf(diff); // Use CUDA intrinsic function for absolute value
        delta[index] = copysignf(1.0f, diff); // Use copysignf for sign evaluation
    }
}