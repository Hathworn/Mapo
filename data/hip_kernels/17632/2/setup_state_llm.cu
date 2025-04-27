#include "hip/hip_runtime.h"
#include "includes.h"

// Optimized kernel function using block and thread identifiers to improve parallelism
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int id = blockIdx.x * blockDim.x + threadIdx.x; // Calculate unique id for each thread
    hiprand_init(seed, id, 0, &state[id]); // Initialize state based on unique id
}