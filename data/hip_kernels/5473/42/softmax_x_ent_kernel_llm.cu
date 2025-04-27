#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel function to compute softmax cross-entropy loss
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if(i < n){
        float t = truth[i];
        float p = pred[i];

        // Use FMA for better precision
        error[i] = (t > 0) ? -__logf(p) : 0;
        
        // Direct subtraction, no need to check truth value again
        delta[i] = t - p;
    }
}