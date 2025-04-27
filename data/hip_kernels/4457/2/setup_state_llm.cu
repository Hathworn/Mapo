#include "hip/hip_runtime.h"
#include "includes.h"
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Compute the unique thread index
    int index = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize random state for each thread uniquely
    hiprand_init(seed, index, 0, &state[index]);
}