#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Optimize: Use built-in function for fast index computation
    unsigned int sequenceNumber = blockIdx.x * blockDim.x + threadIdx.x; 

    /* Each thread gets a different sequence number */
    hiprand_init(seed, sequenceNumber, 0, &state[sequenceNumber]);
}