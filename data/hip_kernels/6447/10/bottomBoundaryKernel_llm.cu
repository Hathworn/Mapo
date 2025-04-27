#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void bottomBoundaryKernel(double* temperature, int block_size) {
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Precompute constant stride
    int stride = block_size + 2;
    
    // Check if within boundary limits
    if (i < block_size) {
        // Set temperature value at the boundary
        temperature[stride * (block_size + 1) + (1 + i)] = 1.0;
    }
}