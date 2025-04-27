#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    int idx = blockDim.x * blockIdx.x + threadIdx.x; // Use meaningful variable name 'idx'
    hiprand_init(seed, idx, 0, &state[idx]); // Align spacing for clarity
}