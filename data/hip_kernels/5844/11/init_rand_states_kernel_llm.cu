#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_rand_states_kernel(hiprandState *state, int seed)
{
    // Compute the global thread ID
    int id = threadIdx.x + blockIdx.x * blockDim.x;

    // Check if the thread ID is within bounds for safety
    if (id >= gridDim.x * blockDim.x) return;

    // Initialize random state with unique sequence for each thread
    hiprand_init(seed, id, 0, &state[id]);
}