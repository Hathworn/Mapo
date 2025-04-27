#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init(unsigned int seed, hiprandState_t *states, unsigned int size)
{
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure thread index is within bounds
    if (i < size)
    {
        // Initialize random state
        hiprand_init(seed, i, 0, &states[i]);
    }
}