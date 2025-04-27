#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel(hiprandState *state, int *seeds, int n)
{
    // Directly use built-in variables to calculate global thread index
    int idx = blockIdx.x * blockDim.x * blockDim.y * blockDim.z + 
              blockIdx.y * blockDim.x * blockDim.y * blockDim.z + 
              threadIdx.z * blockDim.x * blockDim.y + 
              threadIdx.y * blockDim.x + 
              threadIdx.x;
              
    // Check and initialize state using atomic operations
    if (idx < n)
    {
        hiprand_init(seeds[idx], idx, 0, &state[idx]);
    }
}