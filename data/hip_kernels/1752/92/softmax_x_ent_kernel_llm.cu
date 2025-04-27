#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique global thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Loop to handle all elements (more efficient for large n)
    for (int i = idx; i < n; i += blockDim.x * gridDim.x) {
        float t = truth[i];
        float p = pred[i];
        // Optimize conditional assignment and operation
        error[i] = t ? -log(p) : 0.0f;
        delta[i] = t - p;
    }
}