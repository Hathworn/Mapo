#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_kernel (hiprandState * state, unsigned long seed ) {
    // Calculate global index
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Ensure the thread index is within the valid range
    if (i < gridDim.x * blockDim.x) {
        // Initialize the random state
        hiprand_init(seed, i, 0, &state[i]);
    }
}