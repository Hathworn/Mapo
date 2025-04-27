#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Optimize to initialize hiprand state in parallel using threadIdx
    int idx = hipThreadIdx_x;
    hiprand_init(seed, idx, 0, &state[idx]);
}