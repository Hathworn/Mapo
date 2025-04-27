#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function
__global__ void rnd_init(size_t _count, hiprandState * _state)
{
    // Calculate linear index within the grid
    int index = blockIdx.x * blockDim.x + threadIdx.x 
                + (blockIdx.y * blockDim.y + threadIdx.y) * gridDim.x * blockDim.x 
                + (blockIdx.z * blockDim.z + threadIdx.z) * gridDim.x * blockDim.x * gridDim.y * blockDim.y;
    
    // Guard against out-of-bounds threads
    if (index >= _count)
    {
        return;
    }
    
    // Initialize random state
    hiprand_init(1984, index, 0, &_state[index]);
}