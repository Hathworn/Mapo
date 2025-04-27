#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        // Precompute log values to improve readability and performance
        float log_p = logf(p + 1e-7f);
        float log_1mp = logf(1 - p + 1e-7f);
        
        error[i] = -t * log_p - (1.0f - t) * log_1mp;
        delta[i] = t - p;
    }
}