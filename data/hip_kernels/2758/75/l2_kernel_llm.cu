#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate global index more efficiently avoiding redundant operations
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use grid-stride loop for better performance with larger datasets
    for (; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;
        delta[i] = diff;
    }
}