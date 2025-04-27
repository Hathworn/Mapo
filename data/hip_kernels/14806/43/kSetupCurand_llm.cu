#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x; // Use blockDim.x for better readability and flexibility
    /* Each thread gets same seed, a different sequence number, no offset */
    hiprand_init(seed, tidx, 0, &state[tidx]); // streamlined comment
}