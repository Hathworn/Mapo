#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    // Use a more descriptive variable name and cache block and grid info
    int globalIndex = blockDim.x * blockIdx.x + threadIdx.x;
    hiprand_init(seed, globalIndex, 0, &state[globalIndex]);
}