#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    // Calculate the global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize for warp efficiency: initialize state for each thread within the warp
    if (i < gridDim.x * blockDim.x) {
        // Initialize the random state
        hiprand_init(seed, i, 0, &state[i]);
    }
}