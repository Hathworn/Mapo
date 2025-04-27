#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x; 

    // Check element within bounds
    if(i < n){
        // Compute difference
        float diff = truth[i] - pred[i];

        // Store absolute error
        error[i] = fabsf(diff);  // Use fast math function

        // Update delta
        delta[i] = copysignf(1.0f, diff);  // Use copysignf for clean conditional assignment
    }
}