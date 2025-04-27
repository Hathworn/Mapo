#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate thread's global index
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Initialize curand with unique seed for each thread
    hiprand_init(seed, tidx, 0, &state[tidx]);
}