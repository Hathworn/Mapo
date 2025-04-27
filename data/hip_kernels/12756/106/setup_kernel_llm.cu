#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState* __restrict__ state, unsigned long seed) {
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    // Directly initializing RNG state without additional offset
    hiprand_init(seed, i, 0, state + i);
}