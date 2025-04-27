#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique thread ID and ensure threads are not wasting resources
    const uint tidx = blockDim.x * blockIdx.x + threadIdx.x; 

    if (tidx < NUM_RND_THREADS_PER_BLOCK * gridDim.x) {
        /* Each thread gets same seed, a different sequence number, no offset */
        hiprand_init(seed, tidx, 0, &state[tidx]);
    }
}