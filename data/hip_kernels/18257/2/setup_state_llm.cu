#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Use block and thread indices for state setup to support multiple threads
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, idx, 0, &state[idx]);
}