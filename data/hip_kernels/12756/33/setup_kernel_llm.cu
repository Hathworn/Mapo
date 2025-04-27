#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_kernel(hiprandState *state, unsigned long seed) {
    // Calculate global thread index
    int i = blockIdx.x * blockDim.x + threadIdx.x;
    
    // Directly manipulate hiprandStatePtr for reduced pointer arithmetic
    hiprandState *statePtr = &state[i];
    
    // Initialize the random state
    hiprand_init(seed, i, 0, statePtr);
}