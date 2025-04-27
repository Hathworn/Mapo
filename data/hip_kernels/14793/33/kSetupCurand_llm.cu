#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Utilize shared memory and bank conflict reduction if needed
    __shared__ hiprandState localState[NUM_RND_THREADS_PER_BLOCK];

    // Initialize local state with different sequence numbers
    hiprand_init(seed, tidx, 0, &localState[threadIdx.x]);

    // Store local state to global state
    state[tidx] = localState[threadIdx.x];
}