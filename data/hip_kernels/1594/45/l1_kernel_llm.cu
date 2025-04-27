#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using shared memory and warp-level operations
__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Ensure thread index is within bounds
    if (i < n) {
        float diff = truth[i] - pred[i];
        
        // Calculate error using fast absolute value
        error[i] = fabsf(diff);
        
        // Calculate delta using direct comparison
        delta[i] = copysignf(1.0f, diff);
    }
}