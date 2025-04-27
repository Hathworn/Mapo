#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread ID
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread is within bounds
    if(i < n) {
        float t = truth[i];
        float p = pred[i];
        
        // Compute error and delta
        error[i] = -t * logf(p + 1e-7f) - (1.0f - t) * logf(1.0f - p + 1e-7f);
        delta[i] = t - p;
    }
}