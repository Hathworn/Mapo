```c
#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel function by using blockIdx.x instead of calculating a linear index manually.
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n){
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;
        delta[i] = diff;
    }
}