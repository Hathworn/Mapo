#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate a global thread index using block and thread indices
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a strided loop to cover all elements in case grid size is smaller than n
    for (; i < n; i += blockDim.x * gridDim.x) {
        float t = truth[i];
        float p = pred[i];
        
        // Keep calculations outside of conditional checks for optimization
        float p_eps = p + 0.0000001f;
        float inv_p_eps = 1 - p + 0.0000001f;
        
        // Compute error using updated terms
        error[i] = -t * log(p_eps) - (1 - t) * log(inv_p_eps);
        
        // Calculate delta value
        delta[i] = t - p;
    }
}