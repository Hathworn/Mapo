#include "hip/hip_runtime.h"
#include "includes.h"

// Utilize block and thread indices for unique state initialization
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Compute global thread ID
    hiprand_init(seed, id, 0, &state[id]); // Assign each thread a unique state
}