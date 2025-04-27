#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(const float * __restrict__ x, const int n, float * __restrict__ binary)
{
    // Calculate the global index
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    if (i < n) {
        // Use ternary operation for binarization
        binary[i] = (x[i] >= 0.0f) ? 1.0f : -1.0f;
    }
}