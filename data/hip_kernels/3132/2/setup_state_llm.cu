#include "hip/hip_runtime.h"
#include "includes.h"

// Kernel to initialize hiprand states
__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = threadIdx.x + blockIdx.x * blockDim.x; // Compute global index
    hiprand_init(seed, idx, 0, &state[idx]); // Use global index for state initialization
}