#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    // Calculate global ID
    int id = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize random state
    hiprand_init(seed, id, 0, &state[id]);
}