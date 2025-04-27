#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_population_fixed(unsigned int *pop, unsigned int rows, unsigned int cols, unsigned int *fixed) {
    // Calculate unique thread ID
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure thread ID is within bounds
    if (idx < rows * cols) {
        // Only update if not fixed
        if (fixed[idx] == 0) {
            pop[idx] = 1; // Example operation to update population
        }
    }
}