#include "hip/hip_runtime.h"
#include "includes.h"

// Use a unique thread index for seed initialization
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x; // Calculate thread index globally
    hiprand_init(seed, idx, 0, &state[idx]); // Initialize state with unique index
}