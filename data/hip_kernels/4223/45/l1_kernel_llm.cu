#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;
    for(; i < n; i += gridStride) {
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff);  // Use vectorized operation for absolute value
        delta[i] = (diff > 0) ? 1.0f : -1.0f;  // Use float to ensure type consistency
    }
}