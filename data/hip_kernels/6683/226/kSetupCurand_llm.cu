#include "hip/hip_runtime.h"
#include "includes.h"

// Improved kernel for setting up CURAND states
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique global thread index
    const uint globalThreadIdx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Each thread gets a unique sequence number, no offset
    if (globalThreadIdx < MAX_NUM_THREADS) { // Ensure thread index is within bounds
        hiprand_init(seed, globalThreadIdx, 0, &state[globalThreadIdx]);
    }
}