#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void update_population_lost(unsigned int *pop, unsigned int rows, unsigned int cols, unsigned int *fixed) {
    unsigned int tid = hipBlockIdx_x * hipBlockDim_x + hipThreadIdx_x; // Compute global thread ID
    unsigned int totalThreads = gridDim.x * blockDim.x; // Calculate total number of threads

    // Loop over the array with stride equal to totalThreads to utilize all threads
    for (unsigned int i = tid; i < rows * cols; i += totalThreads) {
        if (pop[i] == 1) { // Check if population element is 1
            atomicAdd(fixed, 1); // Atomic operation to prevent race condition
        }
    }
}