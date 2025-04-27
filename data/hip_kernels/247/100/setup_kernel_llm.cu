#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState* state, unsigned long long seed) {
    const uint tidx = NUM_RND_THREADS_PER_BLOCK * blockIdx.x + threadIdx.x;
    // Pre-calculate sequence number to minimize redundant calculations.
    unsigned long long sequence_number = seed + tidx;
    hiprand_init(seed, sequence_number, 0, &state[tidx]);
}