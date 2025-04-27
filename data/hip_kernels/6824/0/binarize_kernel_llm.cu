#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplify index calculation for 1D grid
    if (i < n) { // Keep condition for valid index range check
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f; // Ensure consistent float assignment
    }
}