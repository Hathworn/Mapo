#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int id = blockDim.x * blockIdx.x + threadIdx.x;
    // Initialize random state using a unique seed for each thread
    hiprand_init(seed, id, 0, &state[id]);
}