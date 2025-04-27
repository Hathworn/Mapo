#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void l2_kernel(int n, float *pred, float *truth, float *delta, float *error)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global index using only blockIdx.x
    int stride = gridDim.x * blockDim.x; // Determine the stride for loop unrolling

    for (; i < n; i += stride) { // Loop unrolling: process multiple elements in steps
        float diff = truth[i] - pred[i]; // Calculate difference
        error[i] = diff * diff; // Compute error
        delta[i] = diff; // Store delta
    }
}