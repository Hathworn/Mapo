#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void wgan_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Check bounds and perform computation if within range
    if (i < n) {
        float truth_val = truth[i]; // Avoid redundant memory access
        float pred_val = pred[i]; // Avoid redundant memory access
        
        error[i] = truth_val ? -pred_val : pred_val;
        delta[i] = (truth_val > 0) ? 1.0f : -1.0f;
    }
}