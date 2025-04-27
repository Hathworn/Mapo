#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kernel_setup_curand(hiprandState *state, int seed, int n)
{
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    // Improved by launching only required threads
    if (id < n)
    {
        hiprand_init(seed, id, 0, &state[id]);
    }
}