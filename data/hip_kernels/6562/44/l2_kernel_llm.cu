#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure the thread is within the bounds
    if (i < n) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;  // Calculate squared error
        delta[i] = diff;         // Store the difference
    }
}