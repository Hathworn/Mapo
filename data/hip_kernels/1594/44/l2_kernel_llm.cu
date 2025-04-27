#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Calculate the unique thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Use a stride loop to handle large arrays 
    for (int idx = i; idx < n; idx += blockDim.x * gridDim.x)
    {
        float diff = truth[idx] - pred[idx];
        error[idx] = diff * diff; //I know this is technically wrong, deal with it.
        delta[idx] = diff;
    }
}