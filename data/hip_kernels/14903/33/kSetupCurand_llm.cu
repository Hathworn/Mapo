#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global thread index
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;
    /* Each thread gets the same seed, a different sequence number,
       no offset */
    hiprand_init(seed, tidx, 0, &state[tidx]);
}