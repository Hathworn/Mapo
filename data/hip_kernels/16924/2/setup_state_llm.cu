#include "hip/hip_runtime.h"
#include "includes.h"

// Setup random state with each thread handling different initial sequence and offset
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Unique thread ID
    hiprand_init(seed, id, 0, &state[id]); // Use 'id' to vary the initial sequence per thread
}