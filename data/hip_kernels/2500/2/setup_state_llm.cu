#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    // Use threadIdx.x for unique state assignment per thread
    int id = blockIdx.x * blockDim.x + threadIdx.x; 
    hiprand_init(seed, id, 0, &state[id]);  // Initialize state with unique id
}