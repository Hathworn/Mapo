#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel (hiprandState * state, unsigned long seed) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x;

    // Optimize by removing unnecessary variables and improving readability
    if (idx < gridDim.x * blockDim.x) {
        hiprand_init(seed, idx, 0, &state[idx]);
    }
}