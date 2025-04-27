#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Optimize index calculation to work only in x-dimension
    int stride = blockDim.x * gridDim.x; // Use stride for grid-stride loop

    for (int i = idx; i < n; i += stride) { // Utilize grid-stride loop for accessing all elements
        float diff = truth[i] - pred[i];
        error[i] = diff * diff; // Compute squared error
        delta[i] = diff; // Compute delta
    }
}