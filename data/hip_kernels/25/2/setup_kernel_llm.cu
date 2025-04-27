#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed)
{
    // Use grid dimensionality for better mapping of threads to state array
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize random state for each thread
    hiprand_init(seed, id, 0, &state[id]);
}