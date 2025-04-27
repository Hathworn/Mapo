#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate global index once and use shared memory for better performance
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;

    // Optimize hiprand_init with a calculated seed per thread using tidx
    hiprand_init(seed + tidx, 0, 0, &state[tidx]);
}