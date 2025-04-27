#include "hip/hip_runtime.h"
#include "includes.h"

// Use __launch_bounds__ to optimize resource allocation
__launch_bounds__(NUM_RND_THREADS_PER_BLOCK) 
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Improved initialization using unique seed per block and thread
    hiprand_init(seed + blockIdx.x, tidx, 0, &state[tidx]);
}