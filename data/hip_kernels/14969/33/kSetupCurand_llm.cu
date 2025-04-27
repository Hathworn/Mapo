#include "hip/hip_runtime.h"
#include "includes.h"

// Optimize by adjusting thread block size and using efficient indexing
__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    unsigned int idx = blockIdx.x * blockDim.x + threadIdx.x;
    // Use more efficient thread index calculation
    hiprand_init(seed, idx, 0, &state[idx]);
}