#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global thread index
    if (i < n) {
        float t = truth[i];
        float p = pred[i];
        error[i] = (t > 0.0f) ? -logf(p) : 0.0f; // Use logf for float precision
        delta[i] = t - p;
    }
}