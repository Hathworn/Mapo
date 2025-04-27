#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index of the thread
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * gridDim.x * blockDim.x;
    
    // Ensure we don't access out of bounds
    if(i < n){
        float t = truth[i];
        float p = pred[i];

        // Use ternary operator to compute values efficiently
        error[i] = (t != 0.0f) ? -logf(p) : 0.0f;
        delta[i] = t - p;
    }
}