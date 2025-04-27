#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void createLaplacianKernel(float *grid, float *kernel, int nrDimensions, int nrGridElements) {
    size_t x = threadIdx.x + blockDim.x * blockIdx.x;
    
    // Ensure x is within bounds
    if (x >= nrGridElements) return;

    // Initialize kernel value with the grid element
    float sum = grid[x];

    // Loop unrolling for better performance
#pragma unroll
    for(int d = 1; d < nrDimensions; ++d) {
        sum += grid[x + d * nrGridElements];
    }

    // Store the computed sum in the kernel
    kernel[x] = sum;
}