#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, const float *pred, const float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;  

    if (i < n) {
        // Store the difference
        float diff = truth[i] - pred[i];
        
        // Compute error and delta in a single step
        error[i] = fabsf(diff);
        delta[i] = (diff > 0) ? 1.0f : -1.0f;
    }
}