#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate index without blockIdx.y

    // Use a loop to process all relevant indices
    for (; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;  // Calculate squared difference for error
        delta[i] = diff;         // Calculate difference for delta
    }
}