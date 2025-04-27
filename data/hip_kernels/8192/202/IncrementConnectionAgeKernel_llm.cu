#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void IncrementConnectionAgeKernel( int cell, int *connection, int *age, int maxCells )
{
    // Calculate thread index in a more efficient way
    int threadId = blockIdx.x * blockDim.x + threadIdx.x;

    // Check if threadId is within bounds
    if(threadId < maxCells)
    {
        // Optimize memory access by using shared memory
        __shared__ int shared_connection[blockDim.x];
        __shared__ int shared_age[blockDim.x];

        // Load data into shared memory
        shared_connection[threadIdx.x] = connection[cell * maxCells + threadId];
        shared_age[threadIdx.x] = age[cell * maxCells + threadId];

        __syncthreads();

        // Process data using shared memory
        if(shared_connection[threadIdx.x] == 1)
        {
            shared_age[threadIdx.x] += 1;
            age[threadId * maxCells + cell] += 1;
        }

        // Store results back to global memory
        age[cell * maxCells + threadId] = shared_age[threadIdx.x];
    }
}