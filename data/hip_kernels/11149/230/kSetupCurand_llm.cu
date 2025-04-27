#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Use shared memory to reduce the number of unnecessary global memory accesses
    __shared__ hiprandState sharedState[NUM_RND_THREADS_PER_BLOCK];

    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Initialize curand state in shared memory
    hiprand_init(seed, tidx, 0, &sharedState[threadIdx.x]);

    // Copy the initialized state back to global memory
    state[tidx] = sharedState[threadIdx.x];
}