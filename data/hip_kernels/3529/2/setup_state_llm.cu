#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize kernel launch by setting up a unique state for each thread
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Unique thread index
    hiprand_init(seed, idx, 0, &state[idx]); // Initialize each thread's state
}