#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function
__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x + blockIdx.y * blockDim.x * gridDim.x;
    
    // Ensure thread index is within array bounds
    if(i < n) {
        float t = truth[i];
        float p = pred[i];
        
        // Pre-calculate common expressions for performance improvement
        float epsilon = 0.0000001;
        float log_p = log(p + epsilon);
        float log_1mp = log(1 - p + epsilon);

        // Compute error and delta values
        error[i] = -t * log_p - (1 - t) * log_1mp;
        delta[i] = t - p;
    }
}