#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Simplified index calculation for 1D grid
    if (i < n) // Use "<n" condition directly instead of ">= n" return
    {
        binary[i] = (x[i] >= 0) ? 1 : -1; // Binarize element
    }
}