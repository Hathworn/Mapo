#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Utilize blockDim to calculate thread index directly for improved readability
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x;
    /* Each thread gets same seed, a different sequence number, no offset */
    hiprand_init(seed, tidx, 0, &state[tidx]);
}