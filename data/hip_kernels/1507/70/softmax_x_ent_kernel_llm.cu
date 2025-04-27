#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel for softmax cross-entropy
__global__ void softmax_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;

    // Use a stride loop to enhance performance, especially for large n
    for (; i < n; i += stride) {
        float t = truth[i];
        float p = pred[i];
        error[i] = (t) ? -log(p) : 0;
        delta[i] = t - p;
    }
}