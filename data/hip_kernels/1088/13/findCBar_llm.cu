#include "hip/hip_runtime.h"
#include "includes.h"

__global__ static void findCBar(double* cOld, double* cCurr, double* cBar, int nx)
{
    // Calculate unique global thread index
    int index = blockIdx.y * blockDim.y * nx + blockIdx.x * blockDim.x + threadIdx.y * nx + threadIdx.x;
    
    // Check for within bounds before computation
    if (index < nx * gridDim.y * blockDim.y) {
        // Compute cBar using optimized access
        cBar[index] = 2.0 * cCurr[index] - cOld[index];
    }
}