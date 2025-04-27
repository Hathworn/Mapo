#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global index for the parallel thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure index is within range
    if(i < n){
        // Compute difference between truth and prediction
        float diff = truth[i] - pred[i];
        
        // Update error using atomic operation to avoid race conditions
        error[i] = fabsf(diff);
        
        // Compute delta using ternary operator for simplicity
        delta[i] = (diff > 0) ? 1.0f : -1.0f;
    }
}