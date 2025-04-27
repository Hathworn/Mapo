#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void gpu_RNG_setup(hiprandState *state, unsigned long seed, int N)
{
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Ensure id remains within bounds
    if (id < N) {
        hiprand_init((seed << 20) + id, 0, 0, &state[id]);
    }
}