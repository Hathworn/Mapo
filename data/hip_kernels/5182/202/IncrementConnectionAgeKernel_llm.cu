#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IncrementConnectionAgeKernel(int cell, int *connection, int *age, int maxCells)
{
    // Calculate unique thread index
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Ensure threadId is within bounds
    if (threadId < maxCells)
    {
        int index1 = cell * maxCells + threadId;
        int index2 = threadId * maxCells + cell;

        // Check connection and update age
        if (connection[index1] == 1)
        {
            age[index1] += 1;
            age[index2] += 1;
        }
    }
}