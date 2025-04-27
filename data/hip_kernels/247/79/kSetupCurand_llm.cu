#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Improved: Use grid stride loop to ensure all threads can initialize states.
    for (uint index = tidx; index < NUM_RND_THREADS_PER_BLOCK * gridDim.x; index += NUM_RND_THREADS_PER_BLOCK * blockDim.x) {
        hiprand_init(seed, index, 0, &state[index]);
    }
}
```
