#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int i = blockIdx.x * blockDim.x + threadIdx.x;

    // Launch multiple initialization threads to improve efficiency.
    hiprand_init(seed, i, 0, &state[i]);
}