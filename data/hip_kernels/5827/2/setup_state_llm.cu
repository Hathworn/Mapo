#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Initialize the random state for each thread with a unique sequence offset
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique global thread index
    hiprand_init(seed, idx, 0, &state[idx]); // Use idx to ensure different states for each thread
}