#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index for the global array
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Process only valid indices
    if(i < n){
        float diff = truth[i] - pred[i];
        
        // Compute squared error and store result
        error[i] = __fmul_rn(diff, diff);  // Use efficient floating-point multiplication
        
        // Store the difference for delta
        delta[i] = diff;
    }
}