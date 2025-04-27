#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate unique global thread index for efficient memory access
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Initialize each thread with a unique sequence number using tidx
    hiprand_init(seed, tidx, 0, &state[tidx]);
}