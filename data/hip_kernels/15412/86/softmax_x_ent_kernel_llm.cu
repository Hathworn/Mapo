#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Flattened index calculation; simplified grid access
    if (i < n) {
        float p = pred[i];
        float t = truth[i];
        error[i] = (t > 0.0f) ? -__logf(p) : 0.0f; // Use fast math function __logf for better performance
        delta[i] = t - p;
    }
}