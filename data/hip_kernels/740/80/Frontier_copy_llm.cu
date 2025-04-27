#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void Frontier_copy(unsigned int *frontier, unsigned int *frontier2, unsigned int *frontier_length) {
    // Calculate global index for each thread
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Limit execution to frontier length
    if (idx < *frontier_length) {
        // Perform copying operation
        frontier2[idx] = frontier[idx];
    }
}