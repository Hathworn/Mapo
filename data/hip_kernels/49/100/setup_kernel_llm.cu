#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState* state, unsigned long long seed) {
    // Calculate unique global index for each thread
    unsigned int tidx = blockIdx.x * blockDim.x + threadIdx.x;

    // Initialize RNG state with unique sequence number
    hiprand_init(seed, tidx, 0, &state[tidx]);
}