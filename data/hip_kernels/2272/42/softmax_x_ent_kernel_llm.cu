#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation

    // Unrolling loop for better memory access and performance
    int stepSize = blockDim.x * gridDim.x;  // Calculate total step size for full grid
    for (int i = idx; i < n; i += stepSize) {
        float t = truth[i];
        float p = pred[i];

        // Use conditional operator to reduce branch divergence
        error[i] = t ? -log(p) : 0.0f;  
        delta[i] = t - p;
    }
}