#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int i = blockIdx.x * blockDim.x + threadIdx.x; // Calculate the global thread index

    // Initialize the random state with given seed
    if (i < gridDim.x * blockDim.x) {
        hiprand_init(seed, i, 0, &state[i]); // Ensure state index is within bounds
    }
}