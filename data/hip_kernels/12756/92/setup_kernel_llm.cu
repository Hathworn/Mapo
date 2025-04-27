#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    // Calculate global thread index using block and thread indices
    int i = blockDim.x * blockIdx.x + threadIdx.x;
    
    // Initialize RNG state with a unique seed per thread
    hiprand_init(seed, i, 0, &state[i]);
}