#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by launching a grid of 1D block
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int id = blockIdx.x * blockDim.x + threadIdx.x;  // Calculate unique ID for each thread
    hiprand_init(seed, id, 0, &state[id]); // Initialize state for each thread
}