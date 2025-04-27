#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    // Use the fastest way to calculate the global index
    int i = (blockIdx.x * blockDim.x) + threadIdx.x;
    
    // Initialize the random state for each thread
    hiprand_init(seed, i, 0, &state[i]);
}