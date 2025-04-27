#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void logistic_x_ent_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the global index for the current thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride to cover the entire range efficiently
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        float t = truth[idx];
        float p = pred[idx];

        // Compute the error and delta for the current index
        error[idx] = -t * logf(p + 0.0000001f) - (1 - t) * logf(1 - p + 0.0000001f);
        delta[idx] = t - p;
    }
}