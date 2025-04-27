#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState * state, unsigned long seed)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Initialize with a persistent random state per thread
    hiprandState localState;
    hiprand_init(seed, i, 0, &localState);
    
    // Store the local state into global memory
    state[i] = localState;
}