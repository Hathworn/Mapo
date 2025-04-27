#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure the thread index is within bounds
    if(i < n) {
        float t = truth[i];
        float p = pred[i];
        
        // Use a temporary variable to avoid redundant memory accesses.
        float err = 0.0;
        if (t > 0) { // Check for non-zero truth value before error computation
            err = -log(p);
        }
        
        error[i] = err;
        delta[i] = t - p;
    }
}