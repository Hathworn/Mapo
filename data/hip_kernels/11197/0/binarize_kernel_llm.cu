#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;  // Simplified index calculation for 1D grid
    if (i < n) {  // Changed comparison to process within bounds
        binary[i] = (x[i] >= 0) ? 1 : -1;  // Perform binary operation
    }
}