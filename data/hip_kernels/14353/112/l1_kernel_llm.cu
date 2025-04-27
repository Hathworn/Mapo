#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index with one less multiplication
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to manage excess elements beyond the grid size
    while(i < n) {
        float diff = truth[i] - pred[i];
        // Use fabsf for floating-point absolute value
        error[i] = fabsf(diff);
        // Use ternary operator directly
        delta[i] = (diff > 0) ? 1.0f : -1.0f;
        
        // Increment index by total number of threads
        i += blockDim.x * gridDim.x;
    }
}