#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Compute global thread index using single blockDim.y multiplication for optimization
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) {
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f; // Use float literals for clarity
    }
}