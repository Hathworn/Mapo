#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    // Precompute global index and stride
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    int stride = blockDim.x * gridDim.x;
    
    // Loop to handle larger data sets
    for (int i = index; i < n; i += stride) {
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Compute squared error
        delta[i] = diff;        // Compute delta
    }
}