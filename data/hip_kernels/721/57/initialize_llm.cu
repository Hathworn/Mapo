#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void initialize( unsigned int seed, hiprandState_t *states, unsigned int size)
{
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    if (i < size) 
    {
        // Initialize the RNG state directly with the index
        hiprand_init(seed, i, 0, &states[i]);
    }
}