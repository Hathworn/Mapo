#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique thread ID
    hiprand_init(seed, id, 0, &state[id]);            // Initialize state with unique ID
}