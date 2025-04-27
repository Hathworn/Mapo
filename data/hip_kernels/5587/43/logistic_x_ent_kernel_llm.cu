#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use blockDim.x to iterate over chunks of data per block, handling more elements
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = gridDim.x * blockDim.x;
    
    for(int i = index; i < n; i += gridStride) {
        float t = truth[i];
        float p = pred[i];
        error[i] = -t * log(p + 1e-7f) - (1.0f - t) * log(1.0f - p + 1e-7f); // Use more readable exponential notation
        delta[i] = t - p; // Reduce data dependency in operations
    }
}