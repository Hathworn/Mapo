#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Parallelize condition check using unified thread calculation
    if(i < n){
        float diff = truth[i] - pred[i];
        
        // Directly assign abs value using fabsf for floats
        error[i] = fabsf(diff);
        
        // Use ternary operator for concise conditional logic
        delta[i] = (diff > 0.0f) ? 1.0f : -1.0f;
    }
}