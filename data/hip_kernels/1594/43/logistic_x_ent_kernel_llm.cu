#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation

    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        
        // Calculate terms to reduce repetitive computation
        float log_p = log(p + 1e-7);
        float log_1mp = log(1 - p + 1e-7);

        error[i] = -t * log_p - (1 - t) * log_1mp; // Calculate error
        delta[i] = t - p; // Calculate delta
    }
}