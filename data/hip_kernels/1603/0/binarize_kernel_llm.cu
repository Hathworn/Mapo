#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Calculate the unique global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure valid index
    if (i < n) {
        // Use ternary operation for binarization
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f;
    }
}