```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize by using faster atomic operations for initializing states
    if (i < gridDim.x * blockDim.x) {
        hiprand_init(seed, i, 0, &state[i]);
    }
}