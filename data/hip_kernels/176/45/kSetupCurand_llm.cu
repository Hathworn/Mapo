#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Use a more efficient register variable for state pointer
    hiprandState localState;
    hiprand_init(seed, tidx, 0, &localState);
    state[tidx] = localState;
}