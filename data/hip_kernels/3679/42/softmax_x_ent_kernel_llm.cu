#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure within bounds
    if(i < n) {
        float p = pred[i];
        // Use ternary operation for concise conditional computation
        error[i] = (truth[i]) ? -logf(p) : 0.0f;
        delta[i] = truth[i] - p;
    }
}