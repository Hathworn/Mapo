#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed)
{
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Random state initialization with a unique seed for each thread
    hiprand_init(seed + i, 0, 0, &state[i]);
}