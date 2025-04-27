#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Optimize by using threadIdx.x to initialize each state for concurrent execution.
    hiprand_init(seed, threadIdx.x, 0, &state[threadIdx.x]);
}