#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Use warp shuffle to initialize multiple states per thread for better performance
    unsigned int lane = tidx % warpSize;
    unsigned int seq = tidx / warpSize;
    hiprand_init(seed, seq, lane, &state[tidx]);
}