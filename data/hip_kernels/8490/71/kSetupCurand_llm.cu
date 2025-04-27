#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Optimize: Use a loop to initialize multiple states per thread if needed
    for (int i = 0; i < NUM_RND_THREADS_PER_BLOCK; i += blockDim.x){
        int index = tidx + i;
        if (index < NUM_RND_THREADS_PER_BLOCK * gridDim.x) {
            hiprand_init(seed, index, 0, &state[index]);
        }
    }
}