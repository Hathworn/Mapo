#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void kSetupCurand(hiprandState *state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Use `__syncthreads()` to ensure all threads have initialized before usage
    __shared__ hiprandState localState[NUM_RND_THREADS_PER_BLOCK];
    hiprand_init(seed, tidx, 0, &localState[threadIdx.x]);
    __syncthreads();
    state[tidx] = localState[threadIdx.x];
}