#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplify grid calculation
    if(i < n){
        float p = pred[i];
        float t = truth[i];
        // Use of ternary operator for concise error calculation
        error[i] = t ? -__logf(p) : 0;  // Use __logf for faster computation
        delta[i] = t - p;
    }
}