#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void curandINIT(int size, hiprandState_t *d_states, unsigned int seed)
{
    // Utilize a single calculation to improve performance
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure threads do not go out of bounds
    if (i < size)
    {
        // Initialize the random state more efficiently
        hiprand_init(seed, i, 0, &d_states[i]);
    }
}