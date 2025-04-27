#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Use a 1D grid and 1D block for better thread allocation
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < n) { // Check boundary conditions to avoid overwriting
        binary[i] = (x[i] >= 0) ? 1.0f : -1.0f; // Ensure floating-point values
    }
}