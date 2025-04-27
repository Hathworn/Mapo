#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Frontier_copy(unsigned int *frontier, unsigned int *frontier2, unsigned int *frontier_length) {
    // Obtain the linear thread index within the grid
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Check if index is within the bounds of the frontier_length
    if (idx < *frontier_length) {
        // Copy element from frontier to frontier2
        frontier2[idx] = frontier[idx];
    }
}