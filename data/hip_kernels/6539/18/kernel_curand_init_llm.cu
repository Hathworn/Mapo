#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_curand_init(hiprandState *state, int seed)
{
    // Compute the global thread ID
    int global_id = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize curand state only if within bounds
    if (global_id < N) // Assume N is the maximum number of states
    {
        hiprand_init(seed, global_id, 0, &state[global_id]);
    }
}