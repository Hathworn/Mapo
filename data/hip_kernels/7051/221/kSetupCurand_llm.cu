#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Optimize by reducing calculations inside hiprand_init
    const uint offset = 0;
    // Use tidx directly without additional index computation
    hiprand_init(seed, tidx, offset, &state[tidx]);
}