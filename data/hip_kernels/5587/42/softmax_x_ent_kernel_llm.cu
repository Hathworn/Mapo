#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Improve calculation using single dimension for blockIdx
    int stride = blockDim.x * gridDim.x; // Calculate stride for loop unrolling

    for (int idx = i; idx < n; idx += stride) { // Process more elements per thread
        float t = truth[idx];
        float p = pred[idx];
        error[idx] = (t != 0.0f) ? -__logf(p) : 0.0f; // Use fast math intrinsic for log
        delta[idx] = t - p;
    }
}