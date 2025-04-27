#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize hiprandState initialization by utilizing threadIdx for parallel efficiency.
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Calculate unique thread index
    hiprand_init(seed, idx, 0, &state[idx]); // Initialize state for each thread
}