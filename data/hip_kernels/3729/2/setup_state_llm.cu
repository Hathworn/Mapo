#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel to use a unique thread index for initializing state
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique thread index
    hiprand_init(seed, idx, 0, &state[idx]);         // Initialize state using unique index
}