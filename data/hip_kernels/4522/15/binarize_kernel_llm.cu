#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate global index for thread
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Use a single conditional check for valid index
    if (i < n) {
        binary[i] = __float2int_rn(x[i] >= 0) * 2 - 1; // Ternary condition simplified
    }
}