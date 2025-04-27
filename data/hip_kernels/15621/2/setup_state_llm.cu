#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Launch thread initializes its own random seed
    int idx = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, idx, 0, &state[idx]);
}