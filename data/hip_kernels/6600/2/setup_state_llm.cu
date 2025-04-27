#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel with multiple threads initialization
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Calculate unique thread index
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize state per thread
    hiprand_init(seed, idx, 0, &state[idx]);
}