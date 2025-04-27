#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Launch with one thread as each thread initializes a single state
    int idx = threadIdx.x;  
    hiprand_init(seed, idx, 0, &state[idx]);  // Utilize thread index for state initialization
}