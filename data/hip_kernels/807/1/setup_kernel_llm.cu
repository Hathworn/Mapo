#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel (hiprandState *state, unsigned long seed)
{
    // Improved parallelization with thread index
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    if (id < gridDim.x * blockDim.x) {
        hiprand_init(seed, id, 0, &state[id]);
    }
}