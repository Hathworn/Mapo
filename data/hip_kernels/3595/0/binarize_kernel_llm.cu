#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel using blockIdx and threadIdx
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int step = gridDim.x * blockDim.x;
    for (; i < n; i += step) {
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f; // Loop for larger arrays
    }
}