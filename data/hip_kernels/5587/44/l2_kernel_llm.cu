#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Use grid-stride loop for better scalability
    for (int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Calculate squared difference
        delta[i] = diff;        // Store difference
    }
}