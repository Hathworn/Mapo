#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void init_rng(hiprandState *states, int seed) {
    // Calculate global thread index
    int tid = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize RNG for each thread
    hiprandState localState;
    hiprand_init(seed, tid, 0, &localState);
    states[tid] = localState;
}