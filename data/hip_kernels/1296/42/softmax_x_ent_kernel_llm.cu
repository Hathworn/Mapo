#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid index calculation

    // Vectorized access pattern to maximize memory coalescing and reduce divergence
    for (; i < n; i += blockDim.x * gridDim.x)
    {
        float t = truth[i];
        float p = pred[i];
        error[i] = (t) ? -log(p) : 0;
        delta[i] = t - p;
    }
}