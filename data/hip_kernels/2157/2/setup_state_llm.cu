```c
#include "hip/hip_runtime.h"
#include "includes.h"

__global__ void setup_state(hiprandState* state, unsigned long long seed) {
    int idx = blockIdx.x * blockDim.x + threadIdx.x; // Calculate global index
    hiprand_init(seed, idx, 0, &state[idx]); // Use unique index for each state
}