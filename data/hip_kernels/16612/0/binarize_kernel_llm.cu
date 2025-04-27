#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void binarize_kernel(float *x, int n, float *binary)
{
    // Use blockIdx.z for computing global index, optimizing grid and block computation.
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    int gridSize = gridDim.x * blockDim.x;
    
    // Loop through all elements, handling boundary conditions.
    for (; i < n; i += gridSize) {
        binary[i] = (x[i] >= 0) ? 1 : -1;
    }
}