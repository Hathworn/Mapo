#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridStride = blockDim.x * gridDim.x;
    
    for (; i < n; i += gridStride) { // Use grid-stride loop for better occupancy
        float diff = truth[i] - pred[i];
        error[i] = diff * diff;       // Compute squared error
        delta[i] = diff;              // Compute delta
    }
}