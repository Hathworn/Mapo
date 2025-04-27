#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Launch fewer threads if out of bounds to improve performance
    if (tidx < maxNumThreads) {
        /* Each thread gets same seed, a different sequence number,
        no offset */
        hiprand_init(seed, tidx, 0, &state[tidx]);
    }
}