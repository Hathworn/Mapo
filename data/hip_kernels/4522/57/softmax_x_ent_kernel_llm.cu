#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified grid index calculation
    if(i < n){
        float t = truth[i];
        float p = pred[i];
        // Use math function with HIP prefix for compatibility and performance
        error[i] = (t) ? -__logf(p) : 0.0f;
        delta[i] = t - p;
    }
}