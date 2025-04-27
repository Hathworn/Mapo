#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread is within range
    if(i < n) {
        float p = pred[i];
        float t = truth[i];
        error[i] = (t != 0.0f) ? -logf(p) : 0.0f;  // Use logf for better performance
        delta[i] = t - p;
    }
}