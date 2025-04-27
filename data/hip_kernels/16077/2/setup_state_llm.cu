#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Optimize by assigning unique thread ID for state initialization
    int id = threadIdx.x + blockIdx.x * blockDim.x;
    hiprand_init(seed, id, 0, &state[id]);
}