#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Optimized index calculation for 1D grid.
    if(i < n) {
        float t = truth[i];
        float p = pred[i];
        float log_p = logf(p + 1e-7f); // Use logf for better performance with floats.
        float log_one_minus_p = logf((1.0f - p) + 1e-7f); // Use logf for consistency and performance.
        error[i] = -t * log_p - (1.0f - t) * log_one_minus_p;
        delta[i] = t - p;
    }
}