#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x; // Simplified thread index calculation
    /* Initialize each thread with the same seed, different sequence number, no offset */
    hiprand_init(seed, tidx, 0, &state[tidx]);
}