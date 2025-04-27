#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified grid-stride calculation

    // Use stride loop to handle more elements in each thread
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        float t = truth[idx];
        float p = pred[idx];
        error[idx] = (t) ? -log(p) : 0;
        delta[idx] = t - p;
    }
}