```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l1_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Using grid-stride loop to handle more elements than the grid can handle in one launch
    for(int i = blockIdx.x * blockDim.x + threadIdx.x; i < n; i += blockDim.x * gridDim.x) {
        float diff = truth[i] - pred[i];
        error[i] = fabsf(diff); // Use fast GPU math function for absolute value
        delta[i] = copysignf(1.0f, diff); // Use fast GPU function for sign
    }
}