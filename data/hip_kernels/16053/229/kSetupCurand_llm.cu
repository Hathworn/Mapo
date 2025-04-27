#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique thread index
    uint tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Each thread gets a different seed with no offset
    hiprand_init(seed, tidx, 0, &state[tidx]);
}