#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Initialize random state with threadIdx.x to ensure unique sequences across threads
    hiprand_init(seed, threadIdx.x, 0, state);
}