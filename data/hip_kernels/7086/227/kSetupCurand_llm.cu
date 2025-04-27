#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Optimize using cooperative thread indexing to reduce calculations
    uint globalThreadId = blockDim.x * blockIdx.x + threadIdx.x;

    // Initialize the random state with the optimized thread index
    hiprand_init(seed, globalThreadId, 0, &state[globalThreadId]);
}