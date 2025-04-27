#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialize(unsigned int seed, hiprandState_t *states, unsigned int size)
{
    // Calculate the global index once for better performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread does not exceed array bounds
    if (i < size)
    {
        // Initialize the random state for each thread
        hiprand_init(seed, i, 0, &states[i]);
    }
}