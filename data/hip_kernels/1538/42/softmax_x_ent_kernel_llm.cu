#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use increment to simplify index calculation and get rid of gridDim.y multiplication
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Unroll loop for improved memory access pattern
    for (; i < n; i += blockDim.x * gridDim.x) {
        float t = truth[i];
        float p = pred[i];
        error[i] = (t) ? -logf(p) : 0.0f; // Use logf for single-precision float operations
        delta[i] = t - p;
    }
}