#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel function
__global__ void Frontier_copy(unsigned int *frontier, unsigned int *frontier2, unsigned int *frontier_length) {
    // Calculate global thread ID for current execution
    unsigned int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Only threads within range execute this copy
    if (tid < *frontier_length) {
        // Copy data from frontier2 to frontier
        frontier[tid] = frontier2[tid];
    }
}