#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x; // Optimize calculation of thread index
    hiprand_init(seed, tidx, 0, &state[tidx]); // Each thread initializes its own state with a unique seed
}