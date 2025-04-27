#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;
    if (i < n) {
        // Store the difference value to avoid redundant memory accesses
        float diff = truth[i] - pred[i];
        // Error calculation optimized using single assignment
        error[i] = diff * diff;
        delta[i] = diff;
    }
}