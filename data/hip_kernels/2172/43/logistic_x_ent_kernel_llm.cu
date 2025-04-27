#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the thread index to ensure efficient memory access
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        
        // Pre-compute common values for error calculation to improve performance
        float log_p = logf(p + 1e-7f);
        float log_1_minus_p = logf(1.0f - p + 1e-7f);
        
        error[i] = -t * log_p - (1.0f - t) * log_1_minus_p;
        delta[i] = t - p;
    }
}