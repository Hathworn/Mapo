#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    // Calculate the unique global thread index for each thread
    const uint tidx = blockIdx.x * blockDim.x + threadIdx.x;
    // Initialize each thread's state with a unique sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}