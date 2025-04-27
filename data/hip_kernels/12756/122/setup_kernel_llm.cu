#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    // Use a single call to obtain the block index
    if (id < gridDim.x * blockDim.x) {
        hiprand_init(seed, id, 0, &state[id]);
    }
}