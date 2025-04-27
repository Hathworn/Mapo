#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if(i < n) {
        // Load data into registers
        float truth_val = truth[i];
        float pred_val = pred[i];

        // Compute difference
        float diff = truth_val - pred_val;
        
        // Write results back to global memory
        error[i] = diff * diff;
        delta[i] = diff;
    }
}