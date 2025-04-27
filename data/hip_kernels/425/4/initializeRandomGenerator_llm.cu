#include "hip/hip_runtime.h"
#include "includes.h"

// Use a more descriptive name for the kernel
__global__ void initializeRandomGenerator(hiprandState *state, unsigned long seed, int count)
{
    int idx = blockIdx.x * blockDim.x + threadIdx.x;

    // Check index before processing
    if (idx < count) {
        // Initialize RNG state for each thread
        hiprand_init(seed, idx, 0, &state[idx]);
    }
}