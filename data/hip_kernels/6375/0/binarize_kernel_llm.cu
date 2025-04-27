#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Use int for calculating grid position
    int totalThreads = gridDim.x * gridDim.y * blockDim.x;
    int i = (blockIdx.x + blockIdx.y * gridDim.x) * blockDim.x + threadIdx.x;

    // Optimize by processing multiple elements in each thread if possible
    for (; i < n; i += totalThreads) {
        binary[i] = (x[i] > 0) ? 1 : -1; // Simplified assignment
    }
}