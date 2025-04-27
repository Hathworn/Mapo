#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize: Ensure state accesses are coalesced and avoid unnecessary index computation
__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    hiprand_init(seed, i, 0, &state[i]);
}