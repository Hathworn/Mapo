#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Each thread handles multiple elements to maximize parallelism
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x) {
        float diff = truth[idx] - pred[idx];
        error[idx] = abs(diff);
        delta[idx] = (diff > 0) ? 1 : -1;
    }
}