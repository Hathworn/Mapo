#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Optimized to initialize the state per thread
    int id = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, id, 0, &state[id]);
}