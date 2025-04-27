#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize global kernel function by launching multiple threads
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate index for each thread
    hiprand_init(seed, idx, 0, &state[idx]); // Initialize state for each thread
}