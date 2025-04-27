#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Pre-calculate the index using built-in variable for efficiency
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize random state using unique thread index
    hiprand_init(seed, idx, 0, &state[idx]);
}