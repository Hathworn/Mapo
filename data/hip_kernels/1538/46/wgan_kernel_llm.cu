#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation
    if (i < n) {
        float truthVal = truth[i]; // Cache the value of truth[i]
        float predVal = pred[i];   // Cache the value of pred[i]
        
        error[i] = truthVal ? -predVal : predVal;  // Use cached values
        delta[i] = (truthVal > 0) ? 1 : -1;        // Use cached values
    }
}