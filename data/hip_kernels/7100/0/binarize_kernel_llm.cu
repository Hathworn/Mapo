#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate unique global thread index more efficiently
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if within bounds and parallelize conditionally
    if (i < n) {
        binary[i] = __frsqrt_rn(__frsqrt_rn(x[i]) >= 0 ? 1.0f : -1.0f); // Simplified condition
    }
}